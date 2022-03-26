import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:health/app/app.locator.dart';
import 'package:health/app/app.logger.dart';
import 'package:health/datamodels/pharmacy/pharmacy_model.dart';
import 'package:health/services/location_service.dart';
import 'package:health/services/pharmacy_service.dart';
import 'package:health/utils/app_helpers.dart';
import 'package:location/location.dart';
import 'dart:ui' as ui;
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

String LOCATION_BUSY_KEY = 'locationObject';

class NearbyViewModel extends FutureViewModel<List<Pharmacy>?> {
  final log = getLogger('NearbyViewModel');
  final _pharmacyService = locator<PharamcyService>();
  final _locationService = locator<LocationService>();

  double _lat = 0;
  double get lat => _lat;
  double _lng = 0;
  double get lng => _lng;
  @override
  Future<List<Pharmacy>?> futureToRun() async {
    await getLocation();
    return await _pharmacyService.getAllPharmacy();
  }

  Pharmacy? _currentActivePharmacy;
  Pharmacy? get currentActivePharmacy => _currentActivePharmacy;

  void setActivePharmacy(Pharmacy pharmacy) {
    _currentActivePharmacy = pharmacy;
    notifyListeners();
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  late BitmapDescriptor markerbitmap;
  late BitmapDescriptor nearbyMarkerbitmap;
  Future getLocation() async {
    setBusyForObject(LOCATION_BUSY_KEY, true);
    markerbitmap = await BitmapDescriptor.fromBytes(
        await getBytesFromAsset("assets/icons/flags/location.png", 98));
    nearbyMarkerbitmap = await BitmapDescriptor.fromBytes(
        await getBytesFromAsset("assets/icons/flags/mapIcon1.png", 110));

    LocationData? result = await _locationService.getLocation();
    if (result != null) {
      _lat = result.latitude ?? 0;
      _lng = result.longitude ?? 0;
    } else {
      await getLocation();
    }
    setBusyForObject(LOCATION_BUSY_KEY, false);
  }

  Future<void> launchMapsUrl(double lat, double long) async {
    final _url =
        'https://www.google.com/maps/dir/?api=1&travelmode=driving&destination=$lat,$long';
    if (!await launch(_url)) throw 'Could not launch';
  }

  List<Pharmacy> _allPharmacies = [];
  List<Pharmacy> get allPharmacies {
    _allPharmacies.sort((a, b) => a.distance.compareTo(b.distance));
    return _allPharmacies;
  }

  List<Pharmacy> _nearByPharmacies = [];
  List<Pharmacy> get nearByPharmacies => _nearByPharmacies;

  @override
  void onData(List<Pharmacy>? data) {
    super.onData(data);
    if (data != null) {
      data.forEach((element) {
        double distance =
            CalculateDistance(_lat, _lng, element.lat, element.lng);
        _allPharmacies.add(element.copyWith(distance: distance));
      });
    }
  }
}
