/*
 * map_utils.dart
 * flutter_panda_foundation
 *
 * Developed by zhudelun on 2/14/19 15:35 PM.
 * Copyright (c) 2019 by Farfetch. All rights reserved.
 *
 */

class MapUtils {
  MapUtils._();

  static String generateMapQuery(Map<String, String> obj) {
    List<String> pairs = List<String>();
    obj.forEach((key, value) => pairs.add("$key=$value"));
    return pairs.join("&");
  }
}
