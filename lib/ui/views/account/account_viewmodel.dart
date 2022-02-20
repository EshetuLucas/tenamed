import 'dart:developer';

import 'package:health/app/app.locator.dart';
import 'package:health/app/app.logger.dart';
import 'package:health/app/app.router.dart';
import 'package:health/datamodels/user/user_model.dart';
import 'package:health/enums/bottom_sheet_type.dart';
import 'package:health/enums/dialog_type.dart';
import 'package:health/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AccountViewModel extends BaseViewModel {
  final log = getLogger('AccountViewModel');
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();

  final _bottomSheetService = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();
  String get currentUserProfession => _userService.currentUser.profession ?? '';
  bool get hasUser => _userService.hasUser;
  User get currentUser => _userService.currentUser;

  String get userFullName =>
      currentUser.firstname + 'Eshetu Lukas' + currentUser.lastname;

  Future<void> onOptionTap(int index) async {
    log.i('index:$index');

    switch (index) {
      case 0:
        //onPreference();
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        onLanguage();
        break;
      case 4:
        break;
      case 5:
        break;
      case 6:
        //onAbout();
        break;
      case 8:
        await onLogout();
        break;
      default:
    }
  }

  Future<void> onCamera() async {
    log.i('');
    await _navigationService.navigateTo(
      Routes.profileUploadView,
    );
    notifyListeners();
  }

  Future<void> onPreference() async {
    _navigationService.navigateTo(Routes.preferenceView);
  }

  Future<void> onAbout() async {
    _navigationService.navigateTo(Routes.aboutView);
  }

  Future onLanguage() async {
    await _dialogService.showCustomDialog(
      variant: DialogType.LANGUAGE,
    );
  }

  Future<void> onLogout() async {
    await _userService.logOut();
    await _navigationService.clearStackAndShow(Routes.loginView);
  }

  void onSavedEvents() {
    _navigationService.navigateTo(Routes.settingView);
  }

  void onSignUp() {
    _navigationService.navigateTo(Routes.signUpView);
  }

  Future<void> onPersonalInfoTap() async {
    await _navigationService.navigateTo(Routes.personalInfoView);
    notifyListeners();
  }
}
