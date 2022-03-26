import 'package:flutter/material.dart';
import 'package:health/ui/shared/app_colors.dart';
import 'package:health/ui/shared/shared_styles.dart';
import 'package:health/ui/shared/ui_helpers.dart';
import 'package:health/ui/shared/widgets/kunet_app_bar.dart';
import 'package:health/ui/views/about/about_view.dart';
import 'package:health/ui/widgets/dumb_widgets/app_button.dart';
import 'package:health/ui/widgets/dumb_widgets/image_builder.dart';
import 'package:stacked/stacked.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AboutViewModel>.reactive(
      viewModelBuilder: () => AboutViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: hulunfechiAppbar(
          title: 'Upload Prescription',
          onBackButtonTap: model.onBack,
        ),
        body: SafeArea(
          child: Padding(
            padding: appSymmetricEdgePadding,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                verticalSpaceMedium,
                Padding(
                  padding: appSymmetricEdgePadding,
                  child: Text(
                    'Upload prescription',
                    style: ktsDarkSmallTextStyle.copyWith(fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                ),
                verticalSpaceMedium,
                Spacer(),
                Container(
                  color: kcPrimaryColor,
                  height: screenHeight(context) / 2,
                  child: model.imageSelected
                      ? Image.file(model.selectedImage)
                      : Center(
                          child: Padding(
                            padding: appSymmetricEdgePadding,
                            child: AppButton(
                              title: 'Tap to add Prescription',
                              onTap: () => model.selectPhoto(),
                              busy: model.isBusy,
                            ),
                          ),
                        ),
                ),
                Spacer(
                  flex: 2,
                ),
                Padding(
                  padding: appSymmetricEdgePadding,
                  child: AppButton(
                    title: 'Upload',
                    onTap: () => model.onUpload(),
                    enabled: model.imageSelected,
                    busy: model.isBusy,
                  ),
                ),
                verticalSpaceMedium,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
