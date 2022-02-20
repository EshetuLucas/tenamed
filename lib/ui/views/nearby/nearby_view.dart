import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'nearby_viewmodel.dart';

class NearByView extends StatelessWidget {
  const NearByView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NearByViewModel>.reactive(
      viewModelBuilder: () => NearByViewModel(),
      builder: (
        BuildContext context,
        NearByViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Center(
            child: Text(
              'NearByView',
            ),
          ),
        );
      },
    );
  }
}
