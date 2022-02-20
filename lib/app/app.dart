import 'package:health/api/get_apis.dart';
import 'package:health/api/post_apis.dart';
import 'package:health/api/put_apis.dart';
import 'package:health/services/cloud_storage_service.dart';
import 'package:health/services/crop_image_service.dart';
import 'package:health/services/event_service.dart';
import 'package:health/services/media_services.dart';
import 'package:health/services/post_service.dart';
import 'package:health/services/shared_preferences_service.dart';
import 'package:health/services/user_service.dart';
import 'package:health/ui/views/about/about_viewmodel.dart';
import 'package:health/ui/views/account/account_view.dart';
import 'package:health/ui/views/category_view/category_view.dart';
import 'package:health/ui/views/comment/comment_view.dart';
import 'package:health/ui/views/event_detail/event_detail_view.dart';
import 'package:health/ui/views/login/login_view.dart';
import 'package:health/ui/views/post/post_view.dart';
import 'package:health/ui/views/preference/preference_view.dart';
import 'package:health/ui/views/profile_upload_view/profile_upload_view.dart';
import 'package:health/ui/views/setting/address/address_view.dart';
import 'package:health/ui/views/setting/bank_details/band_details_view.dart';
import 'package:health/ui/views/setting/personal_info/personal_info_view.dart';
import 'package:health/ui/views/setting/setting_view.dart';
import 'package:health/ui/views/signup/signup_view.dart';
import 'package:health/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/views/home/home_view.dart';

@StackedApp(
  routes: [
    CupertinoRoute(page: HomeView),
    CustomRoute(
      page: EventDetailView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CupertinoRoute(page: CategoriesView),
    CupertinoRoute(page: LoginView),
    CupertinoRoute(page: SignUpView),
    CupertinoRoute(page: AccountView),
    CupertinoRoute(page: StartupView),
    CupertinoRoute(page: SettingView),
    CupertinoRoute(page: PostView),
    CupertinoRoute(page: PreferenceView),
    CupertinoRoute(page: AboutView),
    CupertinoRoute(page: CommentView),
    CupertinoRoute(page: PersonalInfoView),
    CupertinoRoute(page: AddressView),
    CupertinoRoute(page: BankDetailView),
    CupertinoRoute(page: ProfileUploadView),
  ],
  dependencies: [
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: GetApis),
    LazySingleton(classType: PostApi),
    LazySingleton(classType: PutApis),
    LazySingleton(classType: EventService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: PostService),
    LazySingleton(classType: CropImageService),
    LazySingleton(classType: MediaService),
    LazySingleton(classType: CloudStorageService),
    Presolve(
      classType: SharedPreferencesService,
      presolveUsing: SharedPreferencesService.getInstance,
    ),
  ],
  logger: StackedLogger(),
)
class AppSetUp {}
