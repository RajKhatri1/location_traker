import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:location_traker/screen/Homepage/controler/Homecontroler.dart';
import 'package:permission_handler/permission_handler.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  Location_controler location_controler = Get.put(Location_controler());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Location Tracker"),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  var status = await Permission.location;
                  if (await status.isDenied) {
                    await Permission.location.request();
                  }
                },
                child: Container(decoration:
                BoxDecoration(border: Border.all(color: Colors.white),borderRadius: BorderRadius.all(Radius.circular(2))),child: Text("Permission")),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  Position position = await Geolocator.getCurrentPosition(
                      desiredAccuracy: LocationAccuracy.high);
                  location_controler.lat.value = position.latitude;
                  location_controler.lon.value = position.longitude;
                },
                child: Container(decoration:
                BoxDecoration(border: Border.all(color: Colors.white),borderRadius: BorderRadius.all(Radius.circular(5))),child: Text("Location",style: TextStyle(color: Colors.white),)),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              Obx(() => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(decoration:
                BoxDecoration(border: Border.all(color: Colors.white),borderRadius: BorderRadius.all(Radius.circular(5))),child: Text("${location_controler.lat.value}",style: TextStyle(color: Colors.white),)),
              )),
              SizedBox(
                height: 10,
              ),
              Obx(() => Container(margin: EdgeInsets.all(10),decoration:
              BoxDecoration(border: Border.all(color: Colors.white),borderRadius: BorderRadius.all(Radius.circular(5))),child: Text("${location_controler.lon.value}",style: TextStyle(color: Colors.white),))),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  List<Placemark> placemarkList =
                      await placemarkFromCoordinates(
                          location_controler.lat.value,
                          location_controler.lon.value);
                  location_controler.placeList.value = placemarkList;
                },
                child: Container(decoration:
                BoxDecoration(border: Border.all(color: Colors.white),borderRadius: BorderRadius.all(Radius.circular(5))),child: Text("Track Me")),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              ),
              SizedBox(
                height: 30,
              ),
              Obx(() => Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.white),borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(location_controler.placeList.isEmpty
                      ? " "
                      : "${location_controler.placeList[0]}",style: TextStyle(color: Colors.white),))),
            ],
          ),
        ),
      ),
    );
  }
}
