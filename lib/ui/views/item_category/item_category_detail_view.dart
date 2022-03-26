import 'package:flutter/material.dart';
import 'package:health/ui/shared/app_colors.dart';
import 'package:health/ui/shared/shared_styles.dart';
import 'package:health/ui/shared/ui_helpers.dart';
import 'package:health/ui/shared/widgets/kunet_app_bar.dart';
import 'package:health/ui/widgets/dumb_widgets/image_builder.dart';
import 'package:stacked/stacked.dart';

import 'item_category_viewmodel.dart';

class IteamCategoryView extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final String name;
  final String? buttonName;
  const IteamCategoryView({
    this.buttonName,
    required this.name,
    required this.items,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool hasButtonName = buttonName != null;

    double childAspectRatios = hasButtonName ? 1.1 / 1.6 : 1.1 / 1.2;
    if (name == 'Appointment') childAspectRatios = 2 / 1;
    return ViewModelBuilder<IteamCategoryViewModel>.reactive(
      viewModelBuilder: () => IteamCategoryViewModel(),
      builder: (
        BuildContext context,
        IteamCategoryViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: hulunfechiAppbar(
            onBackButtonTap: name != 'Appointment' ? model.goBack : null,
            title: name,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              padding: appSymmetricEdgePadding,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 4,
                childAspectRatio: childAspectRatios,
                mainAxisSpacing: 4,
                crossAxisCount: 3,
              ),
              itemCount: items.length,
              itemBuilder: (BuildContext ctx, index) {
                return SkeletonLoader(
                  loading: false,
                  startColor: kcAppBackgroundColor.withOpacity(0.5),
                  endColor: kcAppBackgroundColor,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    clipBehavior: Clip.antiAlias,
                    elevation: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (name != 'Appointment')
                          ImageBuilder(
                            height: screenWidthFraction(
                              context,
                              dividedBy: 7,
                            ),
                            width: screenWidthFraction(
                              context,
                              dividedBy: 7,
                            ),
                            assetName: items[index]['iconData'],
                          ),
                        verticalSpaceSmall,
                        FittedBox(
                          child: Text(
                            items[index]['title'],
                          ),
                        ),
                        if (items[index]['price'] != null)
                          FittedBox(
                            child: Text(
                              items[index]['price'],
                              style: ktsLightGreySmallTextStyle.copyWith(
                                color: kcLightBlue,
                              ),
                            ),
                          ),
                        if (items[index]['price'] != null) verticalSpaceSmall,
                        if (hasButtonName)
                          Card(
                            color: kcPrimaryColor,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 3),
                              child: Text(
                                buttonName!,
                                style: ktsWhiteSmallTextStyle.copyWith(
                                  color: kcAppBackgroundColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
