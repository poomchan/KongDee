// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ChatTearOff {
  const _$ChatTearOff();

// ignore: unused_element
  _Chat call(
      {@required UniqueId id,
      @required List<MessageDomain> messages,
      @required DocumentSnapshot lastDoc}) {
    return _Chat(
      id: id,
      messages: messages,
      lastDoc: lastDoc,
    );
  }
}

// ignore: unused_element
const $Chat = _$ChatTearOff();

mixin _$Chat {
  UniqueId get id;
  List<MessageDomain> get messages;
  DocumentSnapshot get lastDoc;

  $ChatCopyWith<Chat> get copyWith;
}

abstract class $ChatCopyWith<$Res> {
  factory $ChatCopyWith(Chat value, $Res Function(Chat) then) =
      _$ChatCopyWithImpl<$Res>;
  $Res call(
      {UniqueId id, List<MessageDomain> messages, DocumentSnapshot lastDoc});
}

class _$ChatCopyWithImpl<$Res> implements $ChatCopyWith<$Res> {
  _$ChatCopyWithImpl(this._value, this._then);

  final Chat _value;
  // ignore: unused_field
  final $Res Function(Chat) _then;

  @override
  $Res call({
    Object id = freezed,
    Object messages = freezed,
    Object lastDoc = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as UniqueId,
      messages: messages == freezed
          ? _value.messages
          : messages as List<MessageDomain>,
      lastDoc:
          lastDoc == freezed ? _value.lastDoc : lastDoc as DocumentSnapshot,
    ));
  }
}

abstract class _$ChatCopyWith<$Res> implements $ChatCopyWith<$Res> {
  factory _$ChatCopyWith(_Chat value, $Res Function(_Chat) then) =
      __$ChatCopyWithImpl<$Res>;
  @override
  $Res call(
      {UniqueId id, List<MessageDomain> messages, DocumentSnapshot lastDoc});
}

class __$ChatCopyWithImpl<$Res> extends _$ChatCopyWithImpl<$Res>
    implements _$ChatCopyWith<$Res> {
  __$ChatCopyWithImpl(_Chat _value, $Res Function(_Chat) _then)
      : super(_value, (v) => _then(v as _Chat));

  @override
  _Chat get _value => super._value as _Chat;

  @override
  $Res call({
    Object id = freezed,
    Object messages = freezed,
    Object lastDoc = freezed,
  }) {
    return _then(_Chat(
      id: id == freezed ? _value.id : id as UniqueId,
      messages: messages == freezed
          ? _value.messages
          : messages as List<MessageDomain>,
      lastDoc:
          lastDoc == freezed ? _value.lastDoc : lastDoc as DocumentSnapshot,
    ));
  }
}

@Implements(IEntity)
class _$_Chat implements _Chat {
  const _$_Chat(
      {@required this.id, @required this.messages, @required this.lastDoc})
      : assert(id != null),
        assert(messages != null),
        assert(lastDoc != null);

  @override
  final UniqueId id;
  @override
  final List<MessageDomain> messages;
  @override
  final DocumentSnapshot lastDoc;

  @override
  String toString() {
    return 'Chat(id: $id, messages: $messages, lastDoc: $lastDoc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Chat &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.messages, messages) ||
                const DeepCollectionEquality()
                    .equals(other.messages, messages)) &&
            (identical(other.lastDoc, lastDoc) ||
                const DeepCollectionEquality().equals(other.lastDoc, lastDoc)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(messages) ^
      const DeepCollectionEquality().hash(lastDoc);

  @override
  _$ChatCopyWith<_Chat> get copyWith =>
      __$ChatCopyWithImpl<_Chat>(this, _$identity);
}

abstract class _Chat implements Chat, IEntity {
  const factory _Chat(
      {@required UniqueId id,
      @required List<MessageDomain> messages,
      @required DocumentSnapshot lastDoc}) = _$_Chat;

  @override
  UniqueId get id;
  @override
  List<MessageDomain> get messages;
  @override
  DocumentSnapshot get lastDoc;
  @override
  _$ChatCopyWith<_Chat> get copyWith;
}
