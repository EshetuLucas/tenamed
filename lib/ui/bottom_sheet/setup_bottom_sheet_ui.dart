import 'package:health/app/app.locator.dart';
import 'package:health/enums/bottom_sheet_type.dart';
import 'package:health/ui/bottom_sheet/all_platform.dart';
import 'package:health/ui/bottom_sheet/country_picker.dart';
import 'package:health/ui/bottom_sheet/date_picker.dart';
import 'package:health/ui/bottom_sheet/filter/filter_sheet.dart';
import 'package:health/ui/bottom_sheet/media_uploading/media_uploading_sheet.dart';
import 'package:health/ui/bottom_sheet/post_option/post_option_sheet.dart';
import 'package:stacked_services/stacked_services.dart';

void setupBottomSheetUi() {
  final bottomSheetService = locator<BottomSheetService>();

  final builders = {
    BottomSheetType.EVENT_MORE_TYPE: (context, sheetRequest, completer) =>
        AllPlatformBottomSheet(
          completer: completer,
          request: sheetRequest,
        ),
    BottomSheetType.FILTER: (context, sheetRequest, completer) =>
        FilterBottomSheet(
          completer: completer,
          request: sheetRequest,
        ),
    BottomSheetType.DATE_PICKER: (context, sheetRequest, completer) =>
        DatePickerBottomSheet(
          completer: completer,
          request: sheetRequest,
        ),
    BottomSheetType.MEDIA_UPLOADING: (context, sheetRequest, completer) =>
        MediaUploadBottomSheet(
          completer: completer,
          request: sheetRequest,
        ),
    BottomSheetType.COUNTRY_PICKER: (context, sheetRequest, completer) =>
        CountryPickerBottomSheet(
          completer: completer,
          request: sheetRequest,
        ),
    BottomSheetType.POST_OPTIONS: (context, sheetRequest, completer) =>
        PostOpetions(
          completer: completer,
          request: sheetRequest,
        ),
  };

  bottomSheetService.setCustomSheetBuilders(builders);
}
