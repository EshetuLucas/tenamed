import 'package:health/app/app.locator.dart';
import 'package:health/app/app.logger.dart';
import 'package:health/ui/views/profile_upload_view/profile_upload_view.dart';
import 'package:health/ui/views/profile_upload_view/profile_upload_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AboutViewModel extends ProfileUploadViewModel {
  final log = getLogger('AboutViewModel');
  final _navigationService = locator<NavigationService>();

  void onBack() {
    _navigationService.back();
  }
}
