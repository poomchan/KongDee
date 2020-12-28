// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'input_bar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$InputBarStateTearOff {
  const _$InputBarStateTearOff();

// ignore: unused_element
  _InputBarState call(
      {@required
          Option<MessageDomain> uploadingChat,
      @required
          MessageDomain chat,
      @required
          bool isUploading,
      @required
          Option<Either<ChatFailure, Unit>> uploadSuccessOrFailureOption}) {
    return _InputBarState(
      uploadingChat: uploadingChat,
      chat: chat,
      isUploading: isUploading,
      uploadSuccessOrFailureOption: uploadSuccessOrFailureOption,
    );
  }
}

// ignore: unused_element
const $InputBarState = _$InputBarStateTearOff();

mixin _$InputBarState {
  Option<MessageDomain> get uploadingChat;
  MessageDomain get chat;
  bool get isUploading;
  Option<Either<ChatFailure, Unit>> get uploadSuccessOrFailureOption;

  $InputBarStateCopyWith<InputBarState> get copyWith;
}

abstract class $InputBarStateCopyWith<$Res> {
  factory $InputBarStateCopyWith(
          InputBarState value, $Res Function(InputBarState) then) =
      _$InputBarStateCopyWithImpl<$Res>;
  $Res call(
      {Option<MessageDomain> uploadingChat,
      MessageDomain chat,
      bool isUploading,
      Option<Either<ChatFailure, Unit>> uploadSuccessOrFailureOption});

  $MessageDomainCopyWith<$Res> get chat;
}

class _$InputBarStateCopyWithImpl<$Res>
    implements $InputBarStateCopyWith<$Res> {
  _$InputBarStateCopyWithImpl(this._value, this._then);

  final InputBarState _value;
  // ignore: unused_field
  final $Res Function(InputBarState) _then;

  @override
  $Res call({
    Object uploadingChat = freezed,
    Object chat = freezed,
    Object isUploading = freezed,
    Object uploadSuccessOrFailureOption = freezed,
  }) {
    return _then(_value.copyWith(
      uploadingChat: uploadingChat == freezed
          ? _value.uploadingChat
          : uploadingChat as Option<MessageDomain>,
      chat: chat == freezed ? _value.chat : chat as MessageDomain,
      isUploading:
          isUploading == freezed ? _value.isUploading : isUploading as bool,
      uploadSuccessOrFailureOption: uploadSuccessOrFailureOption == freezed
          ? _value.uploadSuccessOrFailureOption
          : uploadSuccessOrFailureOption as Option<Either<ChatFailure, Unit>>,
    ));
  }

  @override
  $MessageDomainCopyWith<$Res> get chat {
    if (_value.chat == null) {
      return null;
    }
    return $MessageDomainCopyWith<$Res>(_value.chat, (value) {
      return _then(_value.copyWith(chat: value));
    });
  }
}

abstract class _$InputBarStateCopyWith<$Res>
    implements $InputBarStateCopyWith<$Res> {
  factory _$InputBarStateCopyWith(
          _InputBarState value, $Res Function(_InputBarState) then) =
      __$InputBarStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Option<MessageDomain> uploadingChat,
      MessageDomain chat,
      bool isUploading,
      Option<Either<ChatFailure, Unit>> uploadSuccessOrFailureOption});

  @override
  $MessageDomainCopyWith<$Res> get chat;
}

class __$InputBarStateCopyWithImpl<$Res>
    extends _$InputBarStateCopyWithImpl<$Res>
    implements _$InputBarStateCopyWith<$Res> {
  __$InputBarStateCopyWithImpl(
      _InputBarState _value, $Res Function(_InputBarState) _then)
      : super(_value, (v) => _then(v as _InputBarState));

  @override
  _InputBarState get _value => super._value as _InputBarState;

  @override
  $Res call({
    Object uploadingChat = freezed,
    Object chat = freezed,
    Object isUploading = freezed,
    Object uploadSuccessOrFailureOption = freezed,
  }) {
    return _then(_InputBarState(
      uploadingChat: uploadingChat == freezed
          ? _value.uploadingChat
          : uploadingChat as Option<MessageDomain>,
      chat: chat == freezed ? _value.chat : chat as MessageDomain,
      isUploading:
          isUploading == freezed ? _value.isUploading : isUploading as bool,
      uploadSuccessOrFailureOption: uploadSuccessOrFailureOption == freezed
          ? _value.uploadSuccessOrFailureOption
          : uploadSuccessOrFailureOption as Option<Either<ChatFailure, Unit>>,
    ));
  }
}

class _$_InputBarState implements _InputBarState {
  const _$_InputBarState(
      {@required this.uploadingChat,
      @required this.chat,
      @required this.isUploading,
      @required this.uploadSuccessOrFailureOption})
      : assert(uploadingChat != null),
        assert(chat != null),
        assert(isUploading != null),
        assert(uploadSuccessOrFailureOption != null);

  @override
  final Option<MessageDomain> uploadingChat;
  @override
  final MessageDomain chat;
  @override
  final bool isUploading;
  @override
  final Option<Either<ChatFailure, Unit>> uploadSuccessOrFailureOption;

  @override
  String toString() {
    return 'InputBarState(uploadingChat: $uploadingChat, chat: $chat, isUploading: $isUploading, uploadSuccessOrFailureOption: $uploadSuccessOrFailureOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _InputBarState &&
            (identical(other.uploadingChat, uploadingChat) ||
                const DeepCollectionEquality()
                    .equals(other.uploadingChat, uploadingChat)) &&
            (identical(other.chat, chat) ||
                const DeepCollectionEquality().equals(other.chat, chat)) &&
            (identical(other.isUploading, isUploading) ||
                const DeepCollectionEquality()
                    .equals(other.isUploading, isUploading)) &&
            (identical(other.uploadSuccessOrFailureOption,
                    uploadSuccessOrFailureOption) ||
                const DeepCollectionEquality().equals(
                    other.uploadSuccessOrFailureOption,
                    uploadSuccessOrFailureOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(uploadingChat) ^
      const DeepCollectionEquality().hash(chat) ^
      const DeepCollectionEquality().hash(isUploading) ^
      const DeepCollectionEquality().hash(uploadSuccessOrFailureOption);

  @override
  _$InputBarStateCopyWith<_InputBarState> get copyWith =>
      __$InputBarStateCopyWithImpl<_InputBarState>(this, _$identity);
}

abstract class _InputBarState implements InputBarState {
  const factory _InputBarState(
          {@required
              Option<MessageDomain> uploadingChat,
          @required
              MessageDomain chat,
          @required
              bool isUploading,
          @required
              Option<Either<ChatFailure, Unit>> uploadSuccessOrFailureOption}) =
      _$_InputBarState;

  @override
  Option<MessageDomain> get uploadingChat;
  @override
  MessageDomain get chat;
  @override
  bool get isUploading;
  @override
  Option<Either<ChatFailure, Unit>> get uploadSuccessOrFailureOption;
  @override
  _$InputBarStateCopyWith<_InputBarState> get copyWith;
}
