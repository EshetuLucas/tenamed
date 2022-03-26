import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:health/datamodels/pharmacy/pharmacy_model.dart';
import 'package:health/ui/shared/app_colors.dart';
import 'package:health/ui/shared/shared_styles.dart';
import 'package:health/ui/shared/ui_helpers.dart';

import 'package:health/ui/widgets/dumb_widgets/image_builder.dart';
import 'package:health/ui/widgets/dumb_widgets/map_view.dart';
import 'package:health/ui/widgets/dumb_widgets/placeholder_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

import 'nearby_viewmodel.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const double DEFAULT_HEIGHT = 250;
final kDefaultLogo = '';

class NearbyView extends StatelessWidget {
  const NearbyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    return ViewModelBuilder<NearbyViewModel>.reactive(
      viewModelBuilder: () => NearbyViewModel(),
      builder: (
        BuildContext context,
        NearbyViewModel model,
        Widget? child,
      ) {
        return Scaffold(
            body: model.isBusy
                ? Center(
                    child: CircularProgressIndicator(
                      color: kcPrimaryColor,
                    ),
                  )
                : Stack(
                    children: [
                      if (!model.busy(LOCATION_BUSY_KEY) && !model.isBusy)
                        GoogleMapPage(
                          lat: model.lat,
                          long: model.lng,
                          items: model.allPharmacies,
                          markerbitmap: model.markerbitmap,
                          nearbyMarkerbitmap: model.nearbyMarkerbitmap,
                        ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: _PharmacyPreviewCarousel(
                          items: model.allPharmacies,
                          height: 188,
                          width: width,
                        ),
                      ),
                      //  Align(
                      //    alignment: Alignment,
                      //   child: Container(
                      //     height: 200,
                      //     width: 200,
                      //     decoration: BoxDecoration(
                      //       color: kcPrimaryColor,
                      //       shape: BoxShape.circle,
                      //     ),
                      //     child: Center(),
                      //   ),
                      // ),
                    ],
                  ));
      },
    );
  }
}

class _PharmacyPreviewCarousel extends ViewModelWidget<NearbyViewModel> {
  final double height;
  final double width;
  final List<Pharmacy> items;

  const _PharmacyPreviewCarousel({
    Key? key,
    required this.items,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, NearbyViewModel model) {
    return CarouselSlider(
      options: CarouselOptions(
        height: height,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        onPageChanged: (index, reason) => model.setActivePharmacy(items[index]),
      ),
      items: items.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return PharmacyCard(
              height: height,
              width: width,
              pharmacy: item,
            );
          },
        );
      }).toList(),
    );
  }
}

class PharmacyCard extends ViewModelWidget<NearbyViewModel> {
  final double? height;
  final double? width;
  final Pharmacy pharmacy;
  final VoidCallback? onTap;
  final VoidCallback? onTapFavorite;
  final String? venuePreference;
  final bool isUserAuthenticated;
  final Function()? onNavigate;

  const PharmacyCard(
      {Key? key,
      this.height = 235,
      this.width,
      this.onTap,
      this.onTapFavorite,
      this.venuePreference,
      this.isUserAuthenticated = false,
      required this.pharmacy,
      this.onNavigate})
      : super(key: key);

  @override
  Widget build(BuildContext context, NearbyViewModel model) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.antiAlias,
        height: height ?? DEFAULT_HEIGHT,
        width: width,
        decoration: BoxDecoration(
          color: kcPrimaryColor,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                  alignment: Alignment.topLeft,
                  height: height,
                  child: Stack(
                    children: [
                      PlaceholderImage(
                        imageUrl: pharmacy.images.isNotEmpty
                            ? pharmacy.images.first
                            : 'assets/images/intro_images/tenaMedLogo.png',
                        fit: pharmacy.images.isNotEmpty
                            ? BoxFit.cover
                            : BoxFit.cover,
                        cornerRadius: 0,
                        showGreyBackground: false,
                        placeHolder: Container(
                            alignment: Alignment.center,
                            color: kcPrimaryColor,
                            child: Shimmer.fromColors(
                              baseColor: kcPrimaryColor,
                              highlightColor: kcAppBackgroundColor,
                              child: ImageBuilder(
                                  fit: BoxFit.cover,
                                  height: 160,
                                  width: 180,
                                  assetName:
                                      'assets/images/intro_images/tenaMedLogo.png'),
                              enabled: true,
                            )),
                      ),
                      if (pharmacy.distance < 0.4)
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            decoration: BoxDecoration(
                              color: kcPrimaryColor.withOpacity(0.5),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                'Nearby',
                                style: ktsWhiteMediumTextStyle.copyWith(
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  )),
            ),
            horizontalSpaceSmall,
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpaceSmall,
                        Text(
                          pharmacy.name,
                          style: ktsWhiteMediumTextStyle.copyWith(fontSize: 13),
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                          softWrap: false,
                        ),
                        verticalSpaceTiny,
                        Row(
                          children: [
                            Icon(
                              Icons.call,
                              color: kcWhite,
                              size: 14,
                            ),
                            horizontalSpaceSmall,
                            Text(
                              pharmacy.phoneNumber1,
                              style:
                                  ktsSmallWhiteTextStyle.copyWith(fontSize: 13),
                            ),
                          ],
                        ),
                        verticalSpaceTiny,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: kcWhite,
                              size: 14,
                            ),
                            horizontalSpaceSmall,
                            if (pharmacy.city != null)
                              Expanded(
                                child: Text(
                                  "${pharmacy.city ?? ''}, ${pharmacy.subCity ?? ''} ",
                                  style: ktsSmallWhiteTextStyle.copyWith(
                                      fontSize: 12),
                                ),
                              ),
                          ],
                        ),
                        verticalSpaceSmall,
                      ],
                    ),
                  ),
                  verticalSpaceSmall,
                  GestureDetector(
                    onTap: () => model.launchMapsUrl(
                      pharmacy.lat,
                      pharmacy.lng,
                    ),
                    child: DottedBorder(
                      color: kcWhite,
                      strokeWidth: 1,
                      strokeCap: StrokeCap.round,
                      dashPattern: [3],
                      radius: Radius.circular(8),
                      borderType: BorderType.RRect,
                      padding: EdgeInsets.zero,
                      child: Material(
                        color: kcWhite.withOpacity(0.05),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        elevation: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: kcWhite.withOpacity(0.05),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          alignment: Alignment.center,
                          height: 40,
                          child: Text(
                            'Navigate',
                            style:
                                ktsSmallWhiteTextStyle.copyWith(fontSize: 13),
                          ),
                        ),
                      ),
                    ),
                  ),
                  verticalSpaceSmall,
                ],
              ),
            ),
            horizontalSpaceSmall,
          ],
        ),
      ),
    );
  }
}
