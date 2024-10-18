import 'package:codelab/app/modules/baca_page/views/baca_view.dart';
import 'package:codelab/app/modules/edit_postingan/views/edit_postingan_view.dart';
import 'package:codelab/app/modules/landingpage/bindings/landingpage_binding.dart';
import 'package:codelab/app/modules/landingpage/views/landingpage_view.dart';
import 'package:codelab/app/modules/landingpage/views/landingpage_web_view.dart';
import 'package:codelab/app/modules/login/bindings/login_binding.dart';
import 'package:codelab/app/modules/login/views/login_view.dart';
import 'package:codelab/app/modules/profile/views/profile_view.dart';
import 'package:codelab/app/modules/register/views/register_view.dart';
import 'package:get/get.dart';

// import '../modules/home/bindings/home_binding.dart';
// import '../modules/home/views/home_view.dart';
import '../modules/new_postingan/views/new_postingan_view.dart';
//import '../modules/new_postingan/bindings/new_postingan_binding.dart';
import '../modules/new_bab/views/new_bab_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.HOME;
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    // GetPage(
    //   name: _Paths.HOME,
    //   page: () => const HomeView(),
    //   binding: HomeBinding(),
    // ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
    ),
    GetPage(
      name: _Paths.LANDINGPAGE,
      page: () => LandingpageView(),
    ),
    GetPage(
      name: _Paths.NEWPOSTINGAN,
      page: () => newPostView(),
      //binding: newPostinganBinding(),
    ),
    GetPage(
      name: _Paths.NEWBAB,
      page: () => newBabView(),
      // binding: newBabBinding(),
    ),
    GetPage(
      name: _Paths.EDITPOSTINGAN,
      page: () => editPostView(),
      // binding: editPostBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => profileView(),
      // binding: profileBinding(),
    ),
    GetPage(
      name: _Paths.BACA,
      page: () => bacaView(),
      // binding: profileBinding(),
    ),
    GetPage(
        name: _Paths.LANDINGPAGE_WEBVIEW,
        page: () => LandingpageWebView(previewLink: Get.arguments),
        binding: LandingpageBinding()
        // binding: profileBinding(),
        ),
  ];
}
