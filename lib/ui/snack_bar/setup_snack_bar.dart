import 'package:flutter/cupertino.dart';
import 'package:health/app/app.locator.dart';
import 'package:health/enums/snackbar_type.dart';
import 'package:health/ui/shared/app_colors.dart';
import 'package:stacked_services/stacked_services.dart';

void setupSnackbarUi() {
  final service = locator<SnackbarService>();

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.BASIC,
    config: SnackbarConfig(
      textColor: kcDarkGreyColor,
      backgroundColor: kcWhite,
      dismissDirection: DismissDirection.down,
      snackStyle: SnackStyle.FLOATING,
    ),
  );
}
