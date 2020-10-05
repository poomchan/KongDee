// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'store_chat_watcher_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$StoreChatWatcherStateTearOff {
  const _$StoreChatWatcherStateTearOff();

// ignore: unused_element
  _Initial inital() {
    return const _Initial();
  }

// ignore: unused_element
  _Loading loading(List<MessageDomain> previousChatList) {
    return _Loading(
      previousChatList,
    );
  }

// ignore: unused_element
  _Loaded loaded(List<MessageDomain> chatList) {
    return _Loaded(
      chatList,
    );
  }

// ignore: unused_element
  _Failure failure(MessageFailure f) {
    return _Failure(
      f,
    );
  }
}

// ignore: unused_element
const $StoreChatWatcherState = _$StoreChatWatcherStateTearOff();

mixin _$StoreChatWatcherState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result inital(),
    @required Result loading(List<MessageDomain> previousChatList),
    @required Result loaded(List<MessageDomain> chatList),
    @required Result failure(MessageFailure f),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result inital(),
    Result loading(List<MessageDomain> previousChatList),
    Result loaded(List<MessageDomain> chatList),
    Result failure(MessageFailure f),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result inital(_Initial value),
    @required Result loading(_Loading value),
    @required Result loaded(_Loaded value),
    @required Result failure(_Failure value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result inital(_Initial value),
    Result loading(_Loading value),
    Result loaded(_Loaded value),
    Result failure(_Failure value),
    @required Result orElse(),
  });
}

abstract class $StoreChatWatcherStateCopyWith<$Res> {
  factory $StoreChatWatcherStateCopyWith(StoreChatWatcherState value,
          $Res Function(StoreChatWatcherState) then) =
      _$StoreChatWatcherStateCopyWithImpl<$Res>;
}

class _$StoreChatWatcherStateCopyWithImpl<$Res>
    implements $StoreChatWatcherStateCopyWith<$Res> {
  _$StoreChatWatcherStateCopyWithImpl(this._value, this._then);

  final StoreChatWatcherState _value;
  // ignore: unused_field
  final $Res Function(StoreChatWatcherState) _then;
}

abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

class __$InitialCopyWithImpl<$Res>
    extends _$StoreChatWatcherStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'StoreChatWatcherState.inital()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result inital(),
    @required Result loading(List<MessageDomain> previousChatList),
    @required Result loaded(List<MessageDomain> chatList),
    @required Result failure(MessageFailure f),
  }) {
    assert(inital != null);
    assert(loading != null);
    assert(loaded != null);
    assert(failure != null);
    return inital();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result inital(),
    Result loading(List<MessageDomain> previousChatList),
    Result loaded(List<MessageDomain> chatList),
    Result failure(MessageFailure f),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (inital != null) {
      return inital();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result inital(_Initial value),
    @required Result loading(_Loading value),
    @required Result loaded(_Loaded value),
    @required Result failure(_Failure value),
  }) {
    assert(inital != null);
    assert(loading != null);
    assert(loaded != null);
    assert(failure != null);
    return inital(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result inital(_Initial value),
    Result loading(_Loading value),
    Result loaded(_Loaded value),
    Result failure(_Failure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (inital != null) {
      return inital(this);
    }
    return orElse();
  }
}

abstract class _Initial implements StoreChatWatcherState {
  const factory _Initial() = _$_Initial;
}

abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
  $Res call({List<MessageDomain> previousChatList});
}

class __$LoadingCopyWithImpl<$Res>
    extends _$StoreChatWatcherStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;

  @override
  $Res call({
    Object previousChatList = freezed,
  }) {
    return _then(_Loading(
      previousChatList == freezed
          ? _value.previousChatList
          : previousChatList as List<MessageDomain>,
    ));
  }
}

class _$_Loading implements _Loading {
  const _$_Loading(this.previousChatList) : assert(previousChatList != null);

  @override
  final List<MessageDomain> previousChatList;

  @override
  String toString() {
    return 'StoreChatWatcherState.loading(previousChatList: $previousChatList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Loading &&
            (identical(other.previousChatList, previousChatList) ||
                const DeepCollectionEquality()
                    .equals(other.previousChatList, previousChatList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(previousChatList);

  @override
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result inital(),
    @required Result loading(List<MessageDomain> previousChatList),
    @required Result loaded(List<MessageDomain> chatList),
    @required Result failure(MessageFailure f),
  }) {
    assert(inital != null);
    assert(loading != null);
    assert(loaded != null);
    assert(failure != null);
    return loading(previousChatList);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result inital(),
    Result loading(List<MessageDomain> previousChatList),
    Result loaded(List<MessageDomain> chatList),
    Result failure(MessageFailure f),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(previousChatList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result inital(_Initial value),
    @required Result loading(_Loading value),
    @required Result loaded(_Loaded value),
    @required Result failure(_Failure value),
  }) {
    assert(inital != null);
    assert(loading != null);
    assert(loaded != null);
    assert(failure != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result inital(_Initial value),
    Result loading(_Loading value),
    Result loaded(_Loaded value),
    Result failure(_Failure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements StoreChatWatcherState {
  const factory _Loading(List<MessageDomain> previousChatList) = _$_Loading;

  List<MessageDomain> get previousChatList;
  _$LoadingCopyWith<_Loading> get copyWith;
}

abstract class _$LoadedCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) then) =
      __$LoadedCopyWithImpl<$Res>;
  $Res call({List<MessageDomain> chatList});
}

class __$LoadedCopyWithImpl<$Res>
    extends _$StoreChatWatcherStateCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(_Loaded _value, $Res Function(_Loaded) _then)
      : super(_value, (v) => _then(v as _Loaded));

  @override
  _Loaded get _value => super._value as _Loaded;

  @override
  $Res call({
    Object chatList = freezed,
  }) {
    return _then(_Loaded(
      chatList == freezed ? _value.chatList : chatList as List<MessageDomain>,
    ));
  }
}

class _$_Loaded implements _Loaded {
  const _$_Loaded(this.chatList) : assert(chatList != null);

  @override
  final List<MessageDomain> chatList;

  @override
  String toString() {
    return 'StoreChatWatcherState.loaded(chatList: $chatList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Loaded &&
            (identical(other.chatList, chatList) ||
                const DeepCollectionEquality()
                    .equals(other.chatList, chatList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(chatList);

  @override
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result inital(),
    @required Result loading(List<MessageDomain> previousChatList),
    @required Result loaded(List<MessageDomain> chatList),
    @required Result failure(MessageFailure f),
  }) {
    assert(inital != null);
    assert(loading != null);
    assert(loaded != null);
    assert(failure != null);
    return loaded(chatList);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result inital(),
    Result loading(List<MessageDomain> previousChatList),
    Result loaded(List<MessageDomain> chatList),
    Result failure(MessageFailure f),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(chatList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result inital(_Initial value),
    @required Result loading(_Loading value),
    @required Result loaded(_Loaded value),
    @required Result failure(_Failure value),
  }) {
    assert(inital != null);
    assert(loading != null);
    assert(loaded != null);
    assert(failure != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result inital(_Initial value),
    Result loading(_Loading value),
    Result loaded(_Loaded value),
    Result failure(_Failure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements StoreChatWatcherState {
  const factory _Loaded(List<MessageDomain> chatList) = _$_Loaded;

  List<MessageDomain> get chatList;
  _$LoadedCopyWith<_Loaded> get copyWith;
}

abstract class _$FailureCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) then) =
      __$FailureCopyWithImpl<$Res>;
  $Res call({MessageFailure f});

  $MessageFailureCopyWith<$Res> get f;
}

class __$FailureCopyWithImpl<$Res>
    extends _$StoreChatWatcherStateCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(_Failure _value, $Res Function(_Failure) _then)
      : super(_value, (v) => _then(v as _Failure));

  @override
  _Failure get _value => super._value as _Failure;

  @override
  $Res call({
    Object f = freezed,
  }) {
    return _then(_Failure(
      f == freezed ? _value.f : f as MessageFailure,
    ));
  }

  @override
  $MessageFailureCopyWith<$Res> get f {
    if (_value.f == null) {
      return null;
    }
    return $MessageFailureCopyWith<$Res>(_value.f, (value) {
      return _then(_value.copyWith(f: value));
    });
  }
}

class _$_Failure implements _Failure {
  const _$_Failure(this.f) : assert(f != null);

  @override
  final MessageFailure f;

  @override
  String toString() {
    return 'StoreChatWatcherState.failure(f: $f)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Failure &&
            (identical(other.f, f) ||
                const DeepCollectionEquality().equals(other.f, f)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(f);

  @override
  _$FailureCopyWith<_Failure> get copyWith =>
      __$FailureCopyWithImpl<_Failure>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result inital(),
    @required Result loading(List<MessageDomain> previousChatList),
    @required Result loaded(List<MessageDomain> chatList),
    @required Result failure(MessageFailure f),
  }) {
    assert(inital != null);
    assert(loading != null);
    assert(loaded != null);
    assert(failure != null);
    return failure(f);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result inital(),
    Result loading(List<MessageDomain> previousChatList),
    Result loaded(List<MessageDomain> chatList),
    Result failure(MessageFailure f),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(f);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result inital(_Initial value),
    @required Result loading(_Loading value),
    @required Result loaded(_Loaded value),
    @required Result failure(_Failure value),
  }) {
    assert(inital != null);
    assert(loading != null);
    assert(loaded != null);
    assert(failure != null);
    return failure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result inital(_Initial value),
    Result loading(_Loading value),
    Result loaded(_Loaded value),
    Result failure(_Failure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements StoreChatWatcherState {
  const factory _Failure(MessageFailure f) = _$_Failure;

  MessageFailure get f;
  _$FailureCopyWith<_Failure> get copyWith;
}
