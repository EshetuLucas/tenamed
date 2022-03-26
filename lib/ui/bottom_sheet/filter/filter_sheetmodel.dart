import 'package:health/app/app.constant.dart';
import 'package:health/app/app.locator.dart';
import 'package:health/app/app.logger.dart';
import 'package:health/datamodels/app_data_model.dart';
import 'package:health/datamodels/post/post_model.dart';
import 'package:health/enums/bottom_sheet_type.dart';
import 'package:health/enums/snackbar_type.dart';
import 'package:health/services/post_service.dart';
import 'package:health/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class FilterSheetViewModel extends BaseViewModel {
  final log = getLogger('FilterSheetViewModel ');
  final NavigationService _navigationService = locator<NavigationService>();
  final _userService = locator<PostService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _snackbarService = locator<SnackbarService>();

  List<String> _tags = [
    'All Brands',
    'All',
    'All Form',
    'All',
  ];
  List<Sector> get sectors =>
      [Sector(id: -1, name: 'All'), ..._userService.sectors];
  List<Platform> get platforms =>
      [Platform(id: -1, name: 'All Platform'), ..._userService.platforms];
  List<Category> get categories => _userService.categories;
  List<SubCategory> get subCategories => _userService.subCategories;

  List<List<dynamic>> get _subLists => [
        ['Nivea', 'Dove'],
        ['Less than 10%', '10% & above', '20% & above'],
        ['Capsule', 'Tablet', 'Oil', 'Soap', 'Powder', 'Cream'],
        ['All', 'Child', 'Adult', 'Elderly'],
      ];

  List<String> get tags => _tags;

  void updateTags(int index, String value) {
    _tags[index] = value;
    notifyListeners();
  }

  Filter filterList = Filter();

  Future<void> onCategories(int index) async {
    log.i('index:$index');

    if (index == 3 && _tags[2] == 'All Category') {
      _snackbarService.showCustomSnackBar(
        variant: SnackbarType.BASIC,
        message: 'Please select category',
        duration: const Duration(seconds: 2),
      );
      notifyListeners();
      return;
    }
    log.i('');
    final resut = await _bottomSheetService.showCustomSheet(
      isScrollControlled: false,
      variant: BottomSheetType.EVENT_MORE_TYPE,
      customData: _subLists[index],
    );
    if (resut != null) {
      // int id = _subLists[index][resut.data].id;
      // switch (index) {
      //   case 0:
      //     filterList = filterList.copyWith(
      //         countryName: _subLists[index][resut.data].name);
      //     break;
      //   case 1:
      //     filterList = filterList.copyWith(platformId: id);
      //     break;
      //   case 2:
      //     filterList = filterList.copyWith(categoryId: id);
      //     break;
      //   case 3:
      //     filterList = filterList.copyWith(subCategoryId: id);
      //     break;

      //   default:
      // }
      updateTags(index, _subLists[index][resut.data]);
    }
  }

  Future<void> onPickCountry() async {
    onCategories(0);
    // log.i('');
    // final result = await _bottomSheetService.showCustomSheet(
    //   isScrollControlled: false,
    //   variant: BottomSheetType.COUNTRY_PICKER,
    // );
    // if (result != null) {
    //   filterList = filterList.copyWith(countryName: result.data.name);
    //   updateTags(0, result.data.name);
    // }
  }

  void onDone() {
    log.v(filterList);
    _navigationService.back(result: SheetResponse(data: filterList));
  }
}
