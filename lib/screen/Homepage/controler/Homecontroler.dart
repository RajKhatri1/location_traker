import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

class Location_controler extends GetxController{
  RxDouble lat = 0.0.obs;
  RxDouble lon = 0.0.obs;
  RxList<Placemark> placeList = <Placemark>[].obs;
}