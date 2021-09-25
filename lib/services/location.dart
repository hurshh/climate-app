import 'package:geolocator/geolocator.dart';

class location {
  late double lattitude;
  late double longitude;

  Future<void> getCurrentLocation() async{
    try{
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      lattitude = position.latitude;
      longitude = position.longitude;
    }
    catch(e){
      print(e);
    }
  }
}