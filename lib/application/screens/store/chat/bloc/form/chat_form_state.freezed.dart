// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'chat_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ChatFormStateTearOff {
  const _$ChatFormStateTearOff();

// ignore: unused_element
  _ChatFormState call(
      {@required
          Option<MessageDomain> uploadingChat,
      @required
          MessageDomain chat,
      @required
          bool isUploading,
      @required
          Option<Either<MessageFailure, Unit>> uploadSuccessOrFailureOption}) {
    return _ChatFormState(
      uploadingChat: uploadingChat,
      chat: chat,
      isUploading: isUploading,
      uploadSuccessOrFailureOption: uploadSuccessOrFailureOption,
    );
  }
}

// ignore: unused_element
const $ChatFormState = _$ChatFormStateTearOff();

mixin _$ChatFormState {
  Option<MessageDomain> get uploadingChat;
  MessageDomain get chat;
  bool get isUploading;
  Option<Either<MessageFailure, Unit>> get uploadSuccessOrFailureOption;

  $ChatFormStateCopyWith<ChatFormState> get copyWith;
}

abstract class $ChatFormStateCopyWith<$Res> {
  factory $ChatFormStateCopyWith(
          ChatFormState value, $Res Function(ChatFormState) then) =
      _$ChatFormStateCopyWithImpl<$Res>;
  $Res call(
      {Option<MessageDomain> uploadingChat,
      MessageDomain chat,
      bool isUploading,
      Option<Either<MessageFailure, Unit>> uploadSuccessOrFailureOption});

  $MessageDomainCopyWith<$Res> get chat;
}

class _$ChatFormStateCopyWithImpl<$Res>
    implements $ChatFormStateCopyWith<$Res> {
  _$ChatFormStateCopyWithImpl(this._value, this._then);

  final ChatFormState _value;
  // ignore: unused_field
  final $Res Function(ChatFormState) _then;

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
          : uploadSuccessOrFailureOption
              as Option<Either<MessageFailure, Unit>>,
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

abstract class _$ChatFormStateCopyWith<$Res>
    implements $ChatFormStateCopyWith<$Res> {
  factory _$ChatFormStateCopyWith(
          _ChatFormState value, $Res Function(_ChatFormState) then) =
      __$ChatFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Option<MessageDomain> uploadingChat,
      MessageDomain chat,
      bool isUploading,
      Option<Either<MessageFailure, Unit>> uploadSuccessOrFailureOption});

  @override
  $MessageDomainCopyWith<$Res> get chat;
}

class __$ChatFormStateCopyWithImpl<$Res>
    extends _$ChatFormStateCopyWithImpl<$Res>
    implements _$ChatFormStateCopyWith<$Res> {
  __$ChatFormStateCopyWithImpl(
      _ChatFormState _value, $Res Function(_ChatFormState) _then)
      : super(_value, (v) => _then(v as _ChatFormState));

  @override
  _ChatFormState get _value => super._value as _ChatFormState;

  @override
  $Res call({
    Object uploadingChat = freezed,
    Object chat = freezed,
    Object isUploading = freezed,
    Object uploadSuccessOrFailureOption = freezed,
  }) {
    return _then(_ChatFormState(
      uploadingChat: uploadingChat == freezed
          ? _value.uploadingChat
          : uploadingChat as Option<MessageDomain>,
      chat: chat == freezed ? _value.chat : chat as MessageDomain,
      isUploading:
          isUploading == freezed ? _value.isUploading : isUploading as bool,
      uploadSuccessOrFailureOption: uploadSuccessOrFailureOption == freezed
          ? _value.uploadSuccessOrFailureOption
          : uploadSuccessOrFailureOption
              as Option<Either<MessageFailure, Unit>>,
    ));
  }
}

class _$_ChatFormState implements _ChatFormState {
  const _$_ChatFormState(
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
  final Option<Either<MessageFailure, Unit>> uploadSuccessOrFailureOption;

  @override
  String toString() {
    return 'ChatFormState(uploadingChat: $uploadingChat, chat: $chat, isUploading: $isUploading, uploadSuccessOrFailureOption: $uploadSuccessOrFailureOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ChatFormState &&
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
  _$ChatFormStateCopyWith<_ChatFormState> get copyWith =>
      __$ChatFormStateCopyWithImpl<_ChatFormState>(this, _$identity);
}

abstract class _ChatFormState implements ChatFormState {
  const factory _ChatFormState(
      {@required
          Option<MessageDomain> uploadingChat,
      @required
          MessageDomain chat,
      @required
          bool isUploading,
      @required
          Option<Either<MessageFailure, Unit>>
              uploadSuccessOrFailureOption}) = _$_ChatFormState;

  @override
  Option<MessageDomain> get uploadingChat;
  @override
  MessageDomain get chat;
  @override
  bool get isUploading;
  @override
  Option<Either<MessageFailure, Unit>> get uploadSuccessOrFailureOption;
  @override
  _$ChatFormStateCopyWith<_ChatFormState> get copyWith;
}
