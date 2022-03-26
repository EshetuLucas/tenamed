import 'package:health/app/app.locator.dart';
import 'package:health/app/app.logger.dart';
import 'package:health/enums/dialog_type.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:location/location.dart';

class LocationService {
  final log = getLogger('LocationService');
  Location location = new Location();
  final _dialogService = locator<DialogService>();

  Future<LocationData?> getLocation() async {
    log.i('');
    bool _serviceEnabled = await location.serviceEnabled();
    log.v(_serviceEnabled);
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        await _dialogService.showCustomDialog(
            variant: DialogType.LOCATION, title: "Please trun location on");
      }
    } else {
      log.v('location is enabled');
      PermissionStatus permissionGranted = await location.hasPermission();
      log.v('$permissionGranted');
      if (permissionGranted == PermissionStatus.denied) {
        log.v('Permission denied');
        permissionGranted = await location.requestPermission();
      } else if (permissionGranted == PermissionStatus.granted) {
        log.v('Permission granted');
        return await location.getLocation();
      }
    }
  }
}
