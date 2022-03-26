import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:health/datamodels/pharmacy/pharmacy_model.dart';

class GoogleMapPage extends StatelessWidget {
  final double lat;
  final double long;
  final List<Pharmacy> items;
  final BitmapDescriptor markerbitmap;
  final BitmapDescriptor nearbyMarkerbitmap;

  GoogleMapPage({
    required this.lat,
    required this.long,
    required this.items,
    required this.markerbitmap,
    required this.nearbyMarkerbitmap,
  });

  List<Marker> get _markers {
    List<Marker> markers = [];

    items.forEach((element) {
      markers.add(
        Marker(
          markerId: MarkerId(element.phoneNumber1),
          draggable: true,
          position: LatLng(element.lat, element.lng),
          icon: element.distance > 0.9 ? markerbitmap : nearbyMarkerbitmap,
        ),
      );
    });
    markers.add(
      Marker(
        markerId: MarkerId('map'),
        draggable: true,
        position: LatLng(lat, long),
      ),
    );
    return markers;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GoogleMap(
        mapType: MapType.normal,
        markers: Set.from(_markers),
        myLocationEnabled: true,
        compassEnabled: true,
        initialCameraPosition:
            CameraPosition(target: LatLng(lat, long), zoom: 15),
      ),
    );
  }
}
