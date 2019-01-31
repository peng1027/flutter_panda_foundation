import 'package:uuid/uuid.dart';

class UUID {
  static String uuidString() => Uuid().v4();
}
