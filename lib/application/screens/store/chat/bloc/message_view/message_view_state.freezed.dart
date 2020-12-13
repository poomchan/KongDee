// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'message_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$MessageViewStateTearOff {
  const _$MessageViewStateTearOff();

// ignore: unused_element
  _MessageViewState call({@required List<MessageDomain> messageList}) {
    return _MessageViewState(
      messageList: messageList,
    );
  }
}

// ignore: unused_element
const $MessageViewState = _$MessageViewStateTearOff();

mixin _$MessageViewState {
  List<MessageDomain> get messageList;

  $MessageViewStateCopyWith<MessageViewState> get copyWith;
}

abstract class $MessageViewStateCopyWith<$Res> {
  factory $MessageViewStateCopyWith(
          MessageViewState value, $Res Function(MessageViewState) then) =
      _$MessageViewStateCopyWithImpl<$Res>;
  $Res call({List<MessageDomain> messageList});
}

class _$MessageViewStateCopyWithImpl<$Res>
    implements $MessageViewStateCopyWith<$Res> {
  _$MessageViewStateCopyWithImpl(this._value, this._then);

  final MessageViewState _value;
  // ignore: unused_field
  final $Res Function(MessageViewState) _then;

  @override
  $Res call({
    Object messageList = freezed,
  }) {
    return _then(_value.copyWith(
      messageList: messageList == freezed
          ? _value.messageList
          : messageList as List<MessageDomain>,
    ));
  }
}

abstract class _$MessageViewStateCopyWith<$Res>
    implements $MessageViewStateCopyWith<$Res> {
  factory _$MessageViewStateCopyWith(
          _MessageViewState value, $Res Function(_MessageViewState) then) =
      __$MessageViewStateCopyWithImpl<$Res>;
  @override
  $Res call({List<MessageDomain> messageList});
}

class __$MessageViewStateCopyWithImpl<$Res>
    extends _$MessageViewStateCopyWithImpl<$Res>
    implements _$MessageViewStateCopyWith<$Res> {
  __$MessageViewStateCopyWithImpl(
      _MessageViewState _value, $Res Function(_MessageViewState) _then)
      : super(_value, (v) => _then(v as _MessageViewState));

  @override
  _MessageViewState get _value => super._value as _MessageViewState;

  @override
  $Res call({
    Object messageList = freezed,
  }) {
    return _then(_MessageViewState(
      messageList: messageList == freezed
          ? _value.messageList
          : messageList as List<MessageDomain>,
    ));
  }
}

class _$_MessageViewState implements _MessageViewState {
  const _$_MessageViewState({@required this.messageList})
      : assert(messageList != null);

  @override
  final List<MessageDomain> messageList;

  @override
  String toString() {
    return 'MessageViewState(messageList: $messageList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MessageViewState &&
            (identical(other.messageList, messageList) ||
                const DeepCollectionEquality()
                    .equals(other.messageList, messageList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(messageList);

  @override
  _$MessageViewStateCopyWith<_MessageViewState> get copyWith =>
      __$MessageViewStateCopyWithImpl<_MessageViewState>(this, _$identity);
}

abstract class _MessageViewState implements MessageViewState {
  const factory _MessageViewState({@required List<MessageDomain> messageList}) =
      _$_MessageViewState;

  @override
  List<MessageDomain> get messageList;
  @override
  _$MessageViewStateCopyWith<_MessageViewState> get copyWith;
}
