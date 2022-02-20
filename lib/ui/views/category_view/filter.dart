import 'package:flutter/material.dart';
import 'package:health/ui/shared/shared_styles.dart';
import 'package:health/ui/shared/ui_helpers.dart';
import 'package:health/ui/views/category_view/category_viewmodel.dart';

import 'package:stacked/stacked.dart';

class EntertainersTitle extends ViewModelWidget<CategoryViewModel> {
  const EntertainersTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, CategoryViewModel model) {
    return Row(
      children: [
        horizontalSpaceSmall,
        Text(
          'Schedule a LiveBurst',
          style: ktsAppTitleTextStyle,
        ),
      ],
    );
  }
}
