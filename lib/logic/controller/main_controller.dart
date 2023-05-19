import 'package:course_getx/view/screens/favorite_screen.dart';
import 'package:course_getx/view/screens/home_screen.dart';
import 'package:course_getx/view/screens/setting_screen.dart';
import 'package:get/get.dart';

import '../../view/screens/category_screen.dart';

class MainController extends GetxController{

  RxInt currentIndex=0.obs;
  final tabs =[
    HomeScreen(),
    CategoryScreen(),
    FavoriteScreen(),
    SettingScreen(),
  ].obs;

  final title =[
    "Asroo Shop",
    "Categories",
    "Favorites",
    "Settings",
  ].obs;
 }