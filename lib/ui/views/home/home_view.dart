import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health/app/app.constant.dart';

import 'package:health/ui/shared/app_colors.dart';
import 'package:health/ui/views/account/account_view.dart';
import 'package:health/ui/views/entertainers/entertainers_view.dart';
import 'package:health/ui/views/gigs/gigs_view.dart';
import 'package:health/ui/views/item_category/item_category_detail_view.dart';
import 'package:health/ui/views/nearby/nearby_view.dart';

import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        body: getViewForIndex(model.currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: model.currentIndex,
          onTap: model.setIndex,
          selectedItemColor: kcPrimaryColor,
          unselectedItemColor: kcDarkGreyColor.withOpacity(0.5),
          backgroundColor: kcAppBackgroundColor,
          items: [
            bottomNavigationBarItem('Home', CupertinoIcons.home),
            bottomNavigationBarItem(
                'Appointment', FontAwesomeIcons.calendarPlus),
            bottomNavigationBarItem(
                'Nearby', CupertinoIcons.location_north_fill),
            bottomNavigationBarItem('Account', CupertinoIcons.person),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem bottomNavigationBarItem(String label, IconData icon) {
    return BottomNavigationBarItem(
      label: label.toUpperCase(),
      icon: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
        child: Icon(icon),
      ),
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return EntertainersView();
      case 1:
        return IteamCategoryView(
          items: Appointment,
          name: 'Appointment',
        );
      case 2:
        return NearbyView();

      case 3:
        return AccountView();

      default:
        return GigsView();
    }
  }
}
