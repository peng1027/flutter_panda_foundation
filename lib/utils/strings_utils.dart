/*
 * strings_utils.dart
 * flutter_panda_foundation
 *
 * Developed by zhudelun on 2/8/19 1:49 AM.
 * Copyright (c) 2019 by Farfetch. All rights reserved.
 *
 */

String stringsPadding(String source, int toLength, String component, int startIndex) {
  if (source.length > toLength) {
    return source.substring(0, toLength);
  }

  var finalComp = component;

  if (startIndex > 0 && startIndex < component.length) {
    finalComp = component.substring(startIndex, component.length);
    finalComp += component.substring(0, startIndex);
  }

  num spaceToFulfill = toLength - source.length;
  num count = 0.5 + spaceToFulfill / component.length;
  int intCount = count.round();

  StringBuffer buf = StringBuffer();
  buf.write(source);
  for (int idx = 0; idx < intCount; ++idx) {
    buf.write(finalComp);
  }

  return buf.toString().substring(0, toLength);
}
