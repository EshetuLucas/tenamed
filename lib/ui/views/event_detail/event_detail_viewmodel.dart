import 'package:health/app/app.locator.dart';
import 'package:health/app/app.logger.dart';
import 'package:health/datamodels/app_data_model.dart';
import 'package:health/enums/bottom_sheet_type.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EventDetailViewModel extends BaseViewModel {
  final log = getLogger('EntertainersViewModel');
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  void onBackButtonTap() => _navigationService.back();

  Future<void> onMoreTap(Event event) async {
    await _bottomSheetService.showCustomSheet(
      isScrollControlled: false,
      variant: BottomSheetType.EVENT_MORE_TYPE,
      data: event,
    );
  }
}
