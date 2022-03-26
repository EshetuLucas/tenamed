import 'package:health/api/get_apis.dart';
import 'package:health/app/app.locator.dart';
import 'package:health/app/app.logger.dart';
import 'package:health/app/app.router.dart';
import 'package:health/datamodels/app_data_model.dart';
import 'package:health/services/event_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CategoryViewModel extends FutureViewModel<void> {
  final log = getLogger('CategoryViewModel');
  final _navigationService = locator<NavigationService>();
  final _eventService = locator<EventService>();

  final String eventCategoryId;
  CategoryViewModel({required this.eventCategoryId});

  List<Event> _listToShow = [];
  List<Event> get listToShow => _listToShow;
  List<Event> get savedEvents => _eventService.savedEvents;
  bool get hasEvent => !isBusy && _listToShow.isNotEmpty;

  @override
  void onError(error) {
    log.e('Something went wrong');
    super.onError(error);
  }

  void onEventTap(Event event) {
    // _navigationService.navigateTo(Routes.eventDetailView,
    //     arguments: EventDetailViewArguments(event: event));
  }

  void onBackButtonTap() => _navigationService.back();

  @override
  Future<void> futureToRun() async {
    log.i('');
    // return await _eventService.searchEventByCategory(
    //     eventCategoryId: eventCategoryId, perPage: 10, currentPage: 1);
  }

  // @override
  // void onData(List<Event>? data) {
  //   if (data != null) {
  //     _listToShow = data;
  //   }
  //   super.onData(data);
  // }
}
