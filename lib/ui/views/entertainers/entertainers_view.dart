import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health/api/faker.dart';
import 'package:health/app/app.constant.dart';

import 'package:health/datamodels/post/post_model.dart';

import 'package:health/ui/shared/app_colors.dart';

import 'package:health/ui/widgets/dumb_widgets/app_category.dart';
import 'package:health/ui/widgets/dumb_widgets/app_divider.dart';
import 'package:health/ui/widgets/dumb_widgets/hulunfechi_tags.dart';
import 'package:health/ui/widgets/dumb_widgets/image_builder.dart';

import 'package:health/ui/widgets/dumb_widgets/post.dart';
import 'package:health/ui/widgets/dumb_widgets/search_bar.dart';

import 'package:stacked/stacked.dart';

import 'entertainers_viewmodel.dart';
import 'package:health/ui/shared/shared_styles.dart';
import 'package:health/ui/shared/ui_helpers.dart';

import 'package:stacked_hooks/stacked_hooks.dart';

List<Post> FAKE_POSTS = [
  FAKE_POST,
  FAKE_POST1,
  FAKE_POST,
  FAKE_POST1,
  FAKE_POST,
  FAKE_POST1,
];

class EntertainersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EntertainersViewModel>.reactive(
      viewModelBuilder: () => EntertainersViewModel(),
      builder: (context, model, child) => Scaffold(
          floatingActionButton: FloatingActionButton(
            foregroundColor: kcWhite,
            backgroundColor: kcPrimaryColor,
            onPressed: model.onAddPost,
            child: Icon(
              Icons.message,
            ),
          ),
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: model.onRefresh,
              backgroundColor: kcBackgroundColor,
              color: kcPrimaryColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Header(),
                  verticalSpaceSmall,
                  Expanded(
                    child: false
                        // model.hasError
                        ? GestureDetector(
                            onTap: model.initialise,
                            child: Center(
                              child: Text(
                                'Something went wrong.\nTap to Try again',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: false
                                    // !model.isBusy &&
                                    //         model.listOnScreen.isEmpty
                                    ? Center(
                                        child: Text(
                                          'No Posts Yet!',
                                          style:
                                              ktsButtonTitleTextStyle.copyWith(
                                            color: kcDarkGreyColor,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    : SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: appSymmetricEdgePadding,
                                              child: SizedBox(
                                                height: 162,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Order Medicine',
                                                              style:
                                                                  ktsDarkGreyBoldTextStyle
                                                                      .copyWith(
                                                                fontSize: 18,
                                                              ),
                                                            ),
                                                            Text(
                                                              'Upload prescription and tell us what you need.We do the rest!',
                                                            ),
                                                            verticalSpaceSmall,
                                                            Row(
                                                              children: [
                                                                Card(
                                                                  color:
                                                                      kcPrimaryColor,
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            9.0),
                                                                    child: Text(
                                                                      'Order now',
                                                                      style: ktsWhiteSmallTextStyle
                                                                          .copyWith(
                                                                        color:
                                                                            kcAppBackgroundColor,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Card(
                                                                  color:
                                                                      kcPrimaryColor,
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            9.0),
                                                                    child: Text(
                                                                      'Call us',
                                                                      style: ktsWhiteSmallTextStyle
                                                                          .copyWith(
                                                                        color:
                                                                            kcAppBackgroundColor,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Colors
                                                                    .transparent,
                                                                boxShadow: [
                                                              // BoxShadow(
                                                              //     color: Colors
                                                              //         .black54,
                                                              //     blurRadius:
                                                              //         15.0,
                                                              //     offset: Offset(
                                                              //         0.0, 0.75))
                                                            ]),
                                                        child: ImageBuilder(
                                                          assetName:
                                                              'assets/images/category_images/order.png',
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 4,
                                              ),
                                              child: Padding(
                                                padding:
                                                    appSymmetricEdgePadding,
                                                child: _GeneralCategories(),
                                              ),
                                            ),
                                            verticalSpaceMedium,
                                            _BestSelling(
                                              title: 'Best Selling',
                                              products: BestSelling,
                                            ),
                                            verticalSpaceMedium,
                                            _BestSelling(
                                              title: 'Top Offers',
                                              products: BestSelling,
                                            ),
                                            verticalSpaceMedium,
                                            _HealthArticles(
                                              title: 'Health Articles',
                                              products: BestSelling,
                                            ),
                                            verticalSpaceMedium,
                                            verticalSpaceLarge,
                                          ],
                                        ),
                                      ),
                              ),
                              //_Others()
                            ],
                          ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class _GeneralCategories extends ViewModelWidget<EntertainersViewModel> {
  const _GeneralCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, EntertainersViewModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'General Categories',
          style: ktsDarkGreyBoldTextStyle.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        verticalSpaceSmall,
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 4,
            childAspectRatio: 1.1 / 1.2,
            mainAxisSpacing: 4,
            crossAxisCount: 3,
          ),
          itemCount: Categories.length,
          itemBuilder: (BuildContext ctx, index) {
            return SkeletonLoader(
              startColor: kcAppBackgroundColor.withOpacity(0.5),
              endColor: kcAppBackgroundColor,
              loading: model.busyHeader,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageBuilder(
                        height: screenWidthFraction(
                          context,
                          dividedBy: 8,
                        ),
                        width: screenWidthFraction(
                          context,
                          dividedBy: 8,
                        ),
                        assetName: Categories[index]['icon'],
                      ),
                      verticalSpaceSmall,
                      Text(
                        Categories[index]['title'],
                      ),
                      FittedBox(
                        child: Text(
                          Categories[index]['subTitle'],
                          style: ktsLightGreySmallTextStyle.copyWith(
                            color: kcLightBlue,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _BestSelling extends ViewModelWidget<EntertainersViewModel> {
  const _BestSelling({
    required this.title,
    required this.products,
    Key? key,
  }) : super(key: key);

  final String title;
  final List<Map<String, dynamic>> products;

  @override
  Widget build(BuildContext context, EntertainersViewModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: appSymmetricEdgePadding,
          child: Text(
            title,
            style: ktsDarkGreyBoldTextStyle.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
        verticalSpaceSmall,
        SizedBox(
          height: 120,
          child: GridView.builder(
            padding: appSymmetricEdgePadding,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 4,
              childAspectRatio: 1.4 / 1.3,
              mainAxisSpacing: 4,
              crossAxisCount: 1,
            ),
            itemCount: products.length,
            itemBuilder: (BuildContext ctx, index) {
              return SkeletonLoader(
                startColor: kcAppBackgroundColor.withOpacity(0.5),
                endColor: kcAppBackgroundColor,
                loading: model.busyHeader,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                  clipBehavior: Clip.antiAlias,
                  elevation: 3,
                  child: Image.asset(
                    products[index]['icon'],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _HealthArticles extends ViewModelWidget<EntertainersViewModel> {
  const _HealthArticles({
    required this.title,
    required this.products,
    Key? key,
  }) : super(key: key);

  final String title;
  final List<Map<String, dynamic>> products;

  @override
  Widget build(BuildContext context, EntertainersViewModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: appSymmetricEdgePadding,
          child: Text(
            title,
            style: ktsDarkGreyBoldTextStyle.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
        verticalSpaceSmall,
        SizedBox(
          height: 140,
          child: GridView.builder(
            padding: appSymmetricEdgePadding,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 4,
              childAspectRatio: 1.2 / 2.0,
              mainAxisSpacing: 4,
              crossAxisCount: 1,
            ),
            itemCount: products.length,
            itemBuilder: (BuildContext ctx, index) {
              return SkeletonLoader(
                startColor: kcAppBackgroundColor.withOpacity(0.5),
                endColor: kcAppBackgroundColor,
                loading: model.busyHeader,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                  clipBehavior: Clip.antiAlias,
                  elevation: 3,
                  child: Image.asset(
                    products[index]['icon'],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class Header extends HookViewModelWidget<EntertainersViewModel> {
  const Header({this.scrollToTop, Key? key}) : super(key: key);

  final ValueChanged<bool>? scrollToTop;

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    EntertainersViewModel model,
  ) {
    final searchController = useTextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpaceSmall,
        verticalSpaceSmall,
        Row(
          children: [
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  child: SearchBar(
                    onClose: () {
                      searchController.text = '';
                      model.onChange('');
                      FocusScope.of(context).unfocus();
                    },
                    onChange: model.onChange,
                    loading: model.busyHeader,
                    controller: searchController,
                  )),
            ),
            Material(
              elevation: model.isBusy ? 0 : 6,
              child: SkeletonLoader(
                startColor: kcAppBackgroundColor.withOpacity(0.5),
                endColor: kcAppBackgroundColor,
                loading: model.busyHeader,
                child: model.busyHeader
                    ? Container(
                        height: 30,
                        width: 40,
                      )
                    : Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: GestureDetector(
                          onTap: () {
                            if (model.isSearchActive) {
                              searchController.text = '';
                              model.onChange('');
                              FocusScope.of(context).unfocus();
                            }
                            model.onFilter();
                          },
                          child: Icon(
                            Icons.tune_rounded,
                            color: kcPrimaryColor,
                          ),
                        ),
                      ),
              ),
            ),
            horizontalSpaceSmall,
            Material(
              elevation: model.isBusy ? 0 : 6,
              child: SkeletonLoader(
                startColor: kcAppBackgroundColor.withOpacity(0.5),
                endColor: kcAppBackgroundColor,
                loading: model.busyHeader,
                child: model.busyHeader
                    ? Container(
                        height: 30,
                        width: 40,
                      )
                    : Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: GestureDetector(
                          onTap: () {
                            if (model.isSearchActive) {
                              searchController.text = '';
                              model.onChange('');
                              FocusScope.of(context).unfocus();
                            }
                            model.onFilter();
                          },
                          child: Icon(
                            Icons.shopping_cart_sharp,
                            color: kcPrimaryColor,
                          ),
                        ),
                      ),
              ),
            ),
            horizontalSpaceMedium,
          ],
        ),
        verticalSpaceSmall,
        // SingleChildScrollView(
        //   padding: const EdgeInsets.symmetric(horizontal: 24.0),
        //   scrollDirection: Axis.horizontal,
        //   child: Row(
        //     children: !model.busyHeader
        //         ? [
        //             for (int i = 0; i < model.sectors.length; i++) ...[
        //               AppCategory(
        //                 loading: false,
        //                 text: model.sectors[i].name,
        //                 onTap: () {
        //                   if (model.isSearchActive) {
        //                     searchController.text = '';
        //                     model.onChange('');
        //                     FocusScope.of(context).unfocus();
        //                   }
        //                   model.setQucikFilterIndex(i);
        //                 },
        //                 active: model.currentIndex == i,
        //               ),
        //               horizontalSpaceSmall,
        //             ]
        //           ]
        //         : [
        //             for (int i = 0; i < Categories.length; i++) ...[
        //               AppCategory(
        //                 loading: true,
        //                 text: Categories[i],
        //               ),
        //               horizontalSpaceSmall,
        //             ]
        //           ],
        //   ),
        // ),
      ],
    );
  }
}
