// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'store_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$StoreFormStateTearOff {
  const _$StoreFormStateTearOff();

// ignore: unused_element
  _StoreFormState call(
      {@required bool isCreating,
      @required UniqueId storeId,
      @required UniqueId ownerId,
      @required TextEditingController nameController,
      @required TextEditingController menuController,
      @required Either<File, String> banner,
      @required List<Either<File, String>> pics,
      @required StorePrefs storePrefs,
      @required StoreLocation storeLocation,
      @required Map<String, bool> blockedUsers}) {
    return _StoreFormState(
      isCreating: isCreating,
      storeId: storeId,
      ownerId: ownerId,
      nameController: nameController,
      menuController: menuController,
      banner: banner,
      pics: pics,
      storePrefs: storePrefs,
      storeLocation: storeLocation,
      blockedUsers: blockedUsers,
    );
  }
}

// ignore: unused_element
const $StoreFormState = _$StoreFormStateTearOff();

mixin _$StoreFormState {
  bool get isCreating;
  UniqueId get storeId;
  UniqueId get ownerId;
  TextEditingController get nameController;
  TextEditingController get menuController;
  Either<File, String> get banner;
  List<Either<File, String>> get pics;
  StorePrefs get storePrefs;
  StoreLocation get storeLocation;
  Map<String, bool> get blockedUsers;

  $StoreFormStateCopyWith<StoreFormState> get copyWith;
}

abstract class $StoreFormStateCopyWith<$Res> {
  factory $StoreFormStateCopyWith(
          StoreFormState value, $Res Function(StoreFormState) then) =
      _$StoreFormStateCopyWithImpl<$Res>;
  $Res call(
      {bool isCreating,
      UniqueId storeId,
      UniqueId ownerId,
      TextEditingController nameController,
      TextEditingController menuController,
      Either<File, String> banner,
      List<Either<File, String>> pics,
      StorePrefs storePrefs,
      StoreLocation storeLocation,
      Map<String, bool> blockedUsers});

  $StorePrefsCopyWith<$Res> get storePrefs;
  $StoreLocationCopyWith<$Res> get storeLocation;
}

class _$StoreFormStateCopyWithImpl<$Res>
    implements $StoreFormStateCopyWith<$Res> {
  _$StoreFormStateCopyWithImpl(this._value, this._then);

  final StoreFormState _value;
  // ignore: unused_field
  final $Res Function(StoreFormState) _then;

  @override
  $Res call({
    Object isCreating = freezed,
    Object storeId = freezed,
    Object ownerId = freezed,
    Object nameController = freezed,
    Object menuController = freezed,
    Object banner = freezed,
    Object pics = freezed,
    Object storePrefs = freezed,
    Object storeLocation = freezed,
    Object blockedUsers = freezed,
  }) {
    return _then(_value.copyWith(
      isCreating:
          isCreating == freezed ? _value.isCreating : isCreating as bool,
      storeId: storeId == freezed ? _value.storeId : storeId as UniqueId,
      ownerId: ownerId == freezed ? _value.ownerId : ownerId as UniqueId,
      nameController: nameController == freezed
          ? _value.nameController
          : nameController as TextEditingController,
      menuController: menuController == freezed
          ? _value.menuController
          : menuController as TextEditingController,
      banner:
          banner == freezed ? _value.banner : banner as Either<File, String>,
      pics: pics == freezed ? _value.pics : pics as List<Either<File, String>>,
      storePrefs:
          storePrefs == freezed ? _value.storePrefs : storePrefs as StorePrefs,
      storeLocation: storeLocation == freezed
          ? _value.storeLocation
          : storeLocation as StoreLocation,
      blockedUsers: blockedUsers == freezed
          ? _value.blockedUsers
          : blockedUsers as Map<String, bool>,
    ));
  }

  @override
  $StorePrefsCopyWith<$Res> get storePrefs {
    if (_value.storePrefs == null) {
      return null;
    }
    return $StorePrefsCopyWith<$Res>(_value.storePrefs, (value) {
      return _then(_value.copyWith(storePrefs: value));
    });
  }

  @override
  $StoreLocationCopyWith<$Res> get storeLocation {
    if (_value.storeLocation == null) {
      return null;
    }
    return $StoreLocationCopyWith<$Res>(_value.storeLocation, (value) {
      return _then(_value.copyWith(storeLocation: value));
    });
  }
}

abstract class _$StoreFormStateCopyWith<$Res>
    implements $StoreFormStateCopyWith<$Res> {
  factory _$StoreFormStateCopyWith(
          _StoreFormState value, $Res Function(_StoreFormState) then) =
      __$StoreFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isCreating,
      UniqueId storeId,
      UniqueId ownerId,
      TextEditingController nameController,
      TextEditingController menuController,
      Either<File, String> banner,
      List<Either<File, String>> pics,
      StorePrefs storePrefs,
      StoreLocation storeLocation,
      Map<String, bool> blockedUsers});

  @override
  $StorePrefsCopyWith<$Res> get storePrefs;
  @override
  $StoreLocationCopyWith<$Res> get storeLocation;
}

class __$StoreFormStateCopyWithImpl<$Res>
    extends _$StoreFormStateCopyWithImpl<$Res>
    implements _$StoreFormStateCopyWith<$Res> {
  __$StoreFormStateCopyWithImpl(
      _StoreFormState _value, $Res Function(_StoreFormState) _then)
      : super(_value, (v) => _then(v as _StoreFormState));

  @override
  _StoreFormState get _value => super._value as _StoreFormState;

  @override
  $Res call({
    Object isCreating = freezed,
    Object storeId = freezed,
    Object ownerId = freezed,
    Object nameController = freezed,
    Object menuController = freezed,
    Object banner = freezed,
    Object pics = freezed,
    Object storePrefs = freezed,
    Object storeLocation = freezed,
    Object blockedUsers = freezed,
  }) {
    return _then(_StoreFormState(
      isCreating:
          isCreating == freezed ? _value.isCreating : isCreating as bool,
      storeId: storeId == freezed ? _value.storeId : storeId as UniqueId,
      ownerId: ownerId == freezed ? _value.ownerId : ownerId as UniqueId,
      nameController: nameController == freezed
          ? _value.nameController
          : nameController as TextEditingController,
      menuController: menuController == freezed
          ? _value.menuController
          : menuController as TextEditingController,
      banner:
          banner == freezed ? _value.banner : banner as Either<File, String>,
      pics: pics == freezed ? _value.pics : pics as List<Either<File, String>>,
      storePrefs:
          storePrefs == freezed ? _value.storePrefs : storePrefs as StorePrefs,
      storeLocation: storeLocation == freezed
          ? _value.storeLocation
          : storeLocation as StoreLocation,
      blockedUsers: blockedUsers == freezed
          ? _value.blockedUsers
          : blockedUsers as Map<String, bool>,
    ));
  }
}

class _$_StoreFormState extends _StoreFormState {
  const _$_StoreFormState(
      {@required this.isCreating,
      @required this.storeId,
      @required this.ownerId,
      @required this.nameController,
      @required this.menuController,
      @required this.banner,
      @required this.pics,
      @required this.storePrefs,
      @required this.storeLocation,
      @required this.blockedUsers})
      : assert(isCreating != null),
        assert(storeId != null),
        assert(ownerId != null),
        assert(nameController != null),
        assert(menuController != null),
        assert(banner != null),
        assert(pics != null),
        assert(storePrefs != null),
        assert(storeLocation != null),
        assert(blockedUsers != null),
        super._();

  @override
  final bool isCreating;
  @override
  final UniqueId storeId;
  @override
  final UniqueId ownerId;
  @override
  final TextEditingController nameController;
  @override
  final TextEditingController menuController;
  @override
  final Either<File, String> banner;
  @override
  final List<Either<File, String>> pics;
  @override
  final StorePrefs storePrefs;
  @override
  final StoreLocation storeLocation;
  @override
  final Map<String, bool> blockedUsers;

  @override
  String toString() {
    return 'StoreFormState(isCreating: $isCreating, storeId: $storeId, ownerId: $ownerId, nameController: $nameController, menuController: $menuController, banner: $banner, pics: $pics, storePrefs: $storePrefs, storeLocation: $storeLocation, blockedUsers: $blockedUsers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StoreFormState &&
            (identical(other.isCreating, isCreating) ||
                const DeepCollectionEquality()
                    .equals(other.isCreating, isCreating)) &&
            (identical(other.storeId, storeId) ||
                const DeepCollectionEquality()
                    .equals(other.storeId, storeId)) &&
            (identical(other.ownerId, ownerId) ||
                const DeepCollectionEquality()
                    .equals(other.ownerId, ownerId)) &&
            (identical(other.nameController, nameController) ||
                const DeepCollectionEquality()
                    .equals(other.nameController, nameController)) &&
            (identical(other.menuController, menuController) ||
                const DeepCollectionEquality()
                    .equals(other.menuController, menuController)) &&
            (identical(other.banner, banner) ||
                const DeepCollectionEquality().equals(other.banner, banner)) &&
            (identical(other.pics, pics) ||
                const DeepCollectionEquality().equals(other.pics, pics)) &&
            (identical(other.storePrefs, storePrefs) ||
                const DeepCollectionEquality()
                    .equals(other.storePrefs, storePrefs)) &&
            (identical(other.storeLocation, storeLocation) ||
                const DeepCollectionEquality()
                    .equals(other.storeLocation, storeLocation)) &&
            (identical(other.blockedUsers, blockedUsers) ||
                const DeepCollectionEquality()
                    .equals(other.blockedUsers, blockedUsers)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isCreating) ^
      const DeepCollectionEquality().hash(storeId) ^
      const DeepCollectionEquality().hash(ownerId) ^
      const DeepCollectionEquality().hash(nameController) ^
      const DeepCollectionEquality().hash(menuController) ^
      const DeepCollectionEquality().hash(banner) ^
      const DeepCollectionEquality().hash(pics) ^
      const DeepCollectionEquality().hash(storePrefs) ^
      const DeepCollectionEquality().hash(storeLocation) ^
      const DeepCollectionEquality().hash(blockedUsers);

  @override
  _$StoreFormStateCopyWith<_StoreFormState> get copyWith =>
      __$StoreFormStateCopyWithImpl<_StoreFormState>(this, _$identity);
}

abstract class _StoreFormState extends StoreFormState {
  const _StoreFormState._() : super._();
  const factory _StoreFormState(
      {@required bool isCreating,
      @required UniqueId storeId,
      @required UniqueId ownerId,
      @required TextEditingController nameController,
      @required TextEditingController menuController,
      @required Either<File, String> banner,
      @required List<Either<File, String>> pics,
      @required StorePrefs storePrefs,
      @required StoreLocation storeLocation,
      @required Map<String, bool> blockedUsers}) = _$_StoreFormState;

  @override
  bool get isCreating;
  @override
  UniqueId get storeId;
  @override
  UniqueId get ownerId;
  @override
  TextEditingController get nameController;
  @override
  TextEditingController get menuController;
  @override
  Either<File, String> get banner;
  @override
  List<Either<File, String>> get pics;
  @override
  StorePrefs get storePrefs;
  @override
  StoreLocation get storeLocation;
  @override
  Map<String, bool> get blockedUsers;
  @override
  _$StoreFormStateCopyWith<_StoreFormState> get copyWith;
}
