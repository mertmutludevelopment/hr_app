

import 'package:get/get.dart';
import 'package:hr_app/utils/routes/app_routes.dart';

class AppRouter{
  static const String initialPath=AppRoutes.INIT_PATH;
  static final List<GetPage<dynamic>> getPages=AppRoutes.get_routes;
  static final GetPage<dynamic> unknownRoute=AppRoutes.unknownRoute;
}