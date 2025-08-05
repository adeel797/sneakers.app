import 'package:sneakers_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:sneakers_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:sneakers_app/ui/views/home/home_view.dart';
import 'package:sneakers_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:sneakers_app/services/cart_service.dart';
import 'package:sneakers_app/services/theme_service.dart';
import 'package:sneakers_app/ui/views/cart/cart_view.dart';
import 'package:sneakers_app/ui/views/login/login_view.dart';
import 'package:sneakers_app/ui/views/signup/signup_view.dart';
import 'package:sneakers_app/ui/views/shop/shop_view.dart';
import 'package:sneakers_app/ui/views/settings/settings_view.dart';
import 'package:sneakers_app/ui/views/order_history/order_history_view.dart';
import 'package:sneakers_app/services/database_service.dart';
import 'package:sneakers_app/services/auth_service.dart';
import 'package:sneakers_app/ui/views/see_all/see_all_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: CartView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignupView),
    MaterialRoute(page: ShopView),
    MaterialRoute(page: SettingsView),
    MaterialRoute(page: OrderHistoryView),
    MaterialRoute(page: SeeAllView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: CartService),
    LazySingleton(classType: ThemeService),
    LazySingleton(classType: DatabaseService),
    LazySingleton(classType: AuthService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
