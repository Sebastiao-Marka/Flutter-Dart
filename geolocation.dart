import 'dart:math';

import 'package:geolocator/geolocator.dart';
import 'package:test/provider/objetos/loja.dart';

class GeoLocations {
  Future<Position> permissionForGetLocation() async {
    /**  Assuming in an async function */
    /// query the current location.

    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future calcDistance(shoppl, positionUser, distanceDefinida) async {
    const earthRadius = 6371.0;

    double toRadians(double degree) {
      return degree * pi / 180.0;
    }

    // Calcule a distância após a localização estiver disponível
    double lat1 = toRadians(shoppl.location!.latitude);
    double lon1 = toRadians(shoppl.location!.longitude);
    double lat2 = toRadians(positionUser.latitude);
    double lon2 = toRadians(positionUser.longitude);

    // Diferenças de coordenadas
    double dLat = lat2 - lat1;
    double dLon = lon2 - lon1;

    // Fórmula de Haversine
    double a =
        pow(sin(dLat / 2), 2) + cos(lat1) * cos(lat2) * pow(sin(dLon / 2), 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    // Distância em quilômetros
    double distance = earthRadius * c;

    if (distanceDefinida > 100) {
      return shoppl;
    } else if (distance < distanceDefinida) {
      return shoppl;
    }
  }
}
