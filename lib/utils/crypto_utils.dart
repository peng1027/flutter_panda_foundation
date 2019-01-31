import 'dart:convert';
import 'dart:typed_data';

import '../utils/strings_utils.dart';

String base64(String source) {
  Int8List byteSource = Utf8Encoder().convert(source);
  String base64Str = Base64Encoder().convert(byteSource);
  return base64Str;
}

/// This method requires padding with “=“, the length of the string must be multiple of 4.
/// - Note: Must add this "=" padding, otherwise, the system base64 encode method not working.
String paddingBase64(String source) {
  return stringsPadding(source, ((source.length + 3) / 4 * 4).toInt(), "=", 0);
}
