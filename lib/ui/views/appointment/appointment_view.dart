import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'appointment_viewmodel.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppointmentViewModel>.reactive(
      viewModelBuilder: () => AppointmentViewModel(),
      builder: (
        BuildContext context,
        AppointmentViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Center(
            child: Text(
              'AppointmentView',
            ),
          ),
        );
      },
    );
  }
}
