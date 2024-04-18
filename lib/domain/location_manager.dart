import 'package:location/location.dart';

class LocationManager {

  final Location _location = Location();

  Future<LocationData?> getCurrentLocation() async {
    final permission = await _checkLocationPermission();
    if (permission) {
      return await _location.getLocation();
    } else {
      return null;
    }
  }

  Future<bool> _checkLocationPermission() async {
    final permission = await _location.hasPermission();
    if (permission == PermissionStatus.granted) {
      return true;
    } else {
      return await _requestLocationPermission();
    }
  }

  Future<bool> _requestLocationPermission() async {
    final permission = await _location.requestPermission();
    if (permission == PermissionStatus.granted) {
      return true;
    } else {
      return false;
    }
  }

}