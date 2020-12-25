import 'package:uuid/uuid.dart';

class UniqueId {
  final String value;

  factory UniqueId() => UniqueId._(Uuid().v1());

  @override
  String toString() => value;

  const UniqueId._(this.value);
}
