import 'package:course_getx/language/fr.dart';
import 'package:get/route_manager.dart';

import '../utils/my_string.dart';
import 'ar.dart';
import 'en.dart';

class LoclizationApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ene: en,
        ara: ar,
        fra: fr,
      };
}
