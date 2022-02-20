import 'package:email_validator/email_validator.dart';
import 'package:health/app/app.locator.dart';
import 'package:health/app/app.logger.dart';
import 'package:health/app/app.router.dart';
import 'package:health/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:health/ui/views/signup/signup_view.form.dart';
import 'package:health/extensions/string_extensions.dart';

const String loginView = '/login-view';

class SignUpViewModel extends FormViewModel {
  final log = getLogger('SignUpSheetViewModel');
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();

  String? _emailValidationMessage;
  String? get emailValidationMessage => _emailValidationMessage;
  String _erroMessage = '';
  String get erroMessage => _erroMessage;
  String? _passwordValidationMessage;
  String? get passwordValidationMessage => _passwordValidationMessage;
  String? _phoneNumberValidationMessage;
  String? get phoneNumberValidationMessage => _phoneNumberValidationMessage;

  bool _showValidation = false;
  bool get showValidation => _showValidation;

  bool get nameFieldHasText => _showValidation && firstNameValue.isNullOrEmpty;
  bool get phoneNumberFieldHasText =>
      _showValidation && phoneNumberValue.isNullOrEmpty;
  bool get emailFieldHasText => _showValidation && emailValue.isNullOrEmpty;
  bool get passwordFieldHasText =>
      _showValidation && passwordValue.isNullOrEmpty;
  bool get confirmFieldHasText =>
      _showValidation && confirmPasswordValue.isNullOrEmpty;

  bool get enableCreateAccountButton =>
      phoneNumberValidationMessage == null &&
      //emailValidationMessage == null &&
      passwordValidationMessage == null &&
      //!emailValue.isNullOrEmpty &&
      !passwordValue.isNullOrEmpty &&
      !firstNameValue.isNullOrEmpty &&
      !confirmPasswordValue.isNullOrEmpty;

  bool _validateEmail() {
    if (!emailFieldHasText) {
      if (!EmailValidator.validate(emailValue!)) {
        _emailValidationMessage =
            'Please enter a valid email address to continue';
        notifyListeners();
        return false;
      } else {
        _emailValidationMessage = null;
      }
    }

    return true;
  }

  bool _validatePhoneNumber() {
    if (!phoneNumberFieldHasText) {
      if (phoneNumberValue!.length != 10) {
        _phoneNumberValidationMessage = 'Phone number must be 10 digit';
        notifyListeners();
        return false;
      } else {
        _phoneNumberValidationMessage = null;
      }
    }

    return true;
  }

  bool _validatePassword() {
    if (!passwordFieldHasText && !confirmFieldHasText) {
      if (passwordValue!.length < 6) {
        _passwordValidationMessage =
            'Please enter a password that\'s 6 characters or longer';
        notifyListeners();
        return false;
      } else if (passwordValue != confirmPasswordValue) {
        _passwordValidationMessage = 'Password and confrim password must match';
        notifyListeners();
      } else {
        _passwordValidationMessage = null;
      }
    }
    return true;
  }

  void onBack() => _navigationService.back();

  Future<void> onCreateAccount() async {
    _showValidation = true;
    // _validateEmail();
    _validatePassword();
    _validatePhoneNumber();
    notifyListeners();
    if (enableCreateAccountButton) {
      setBusy(true);
      await Future.delayed(
        Duration(seconds: 1),
      );
      // await _userService.login(
      //     email: phoneNumberValue!, password: passwordValue!);
      navigateToHomeView();

      try {
        //   final result = await _userService.createUserAccount(
        //     firstname: firstNameValue!,
        //     lastname: lastNameValue!,
        //     gender: _checkBoxValue == 1 ? 'Male' : 'Female',
        //     password: passwordValue!,
        //     email: emailValue!,
        //     username: emailValue!,
        //   );
        //   _userService.setCurrentuser(user: result);
        //   navigateToHomeView();
      } catch (e) {
        log.e('Could not create user account. $e');
        _erroMessage = e.toString();
        notifyListeners();
      }
    }
    setBusy(false);
  }

  Future<void> navigateToHomeView() async {
    await _navigationService.clearStackAndShow(Routes.homeView);
  }

  @override
  void setFormStatus() {}

  List<bool> _checkBoxValue = [false, false];
  List<bool> get checkBoxValue => _checkBoxValue;

  void onCheckBoxChange(int index, bool value) {
    _checkBoxValue[index] = value;
    if (index == 1) {
      _checkBoxValue[index - 1] = !value;
    } else
      _checkBoxValue[index + 1] = !value;

    notifyListeners();
  }
}
