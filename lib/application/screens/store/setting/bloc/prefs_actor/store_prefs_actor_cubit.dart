import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/bloc/store_view_cubit.dart';
import 'package:fluttertaladsod/domain/store/i_store_repository.dart';
import 'package:fluttertaladsod/domain/store/location/store_location.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/domain/store/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_prefs_actor_state.dart';
part 'store_prefs_actor_cubit.freezed.dart';

// do not create this cubit if the store if not succesfully loaded
class StorePrefsActorCubit extends Cubit<StorePrefsActorState> {
  final IStoreRepository iStoreRepository;
  final StoreViewCubit storeViewCubit;
  StreamSubscription _storeSubscription;
  Store _store;

  StorePrefsActorCubit({
    @required this.iStoreRepository,
    @required this.storeViewCubit,
  }) : super(StorePrefsActorState.initial()) {
    _store = storeViewCubit.state.maybeMap(
      success: (s) => s.store,
      orElse: () => throw 'StorePrefsCubit: init store is null',
    );
    _storeSubscription = storeViewCubit.listen(
      (state) => state.map(
        inital: (s) => null,
        loading: (s) => null,
        success: (s) => _store = s.store,
        failure: (s) => null,
      ),
    );
  }

  Future<void> storeOpenChange({bool isOpen}) async {
    final fOrUnit = await iStoreRepository.update(
      _store.copyWith(
        prefs: _store.prefs.copyWith(isOpen: isOpen),
      ),
    );
  }

  Future<void> storeNotificationChange({bool isOn}) async {
    final fOrUnit = await iStoreRepository.update(
      _store.copyWith(
        prefs: _store.prefs.copyWith(isNotificationOn: isOn),
      ),
    );
  }

  Future<void> updateLocation(StoreLocation l) async {
    final fOrUnit = await iStoreRepository.update(
      _store.copyWith(location: l),
    );
  }

  Future<void> updateSellingRange(SellingRange r) async {
    final fOrUnit = await iStoreRepository.update(
      _store.copyWith(
        prefs: _store.prefs.copyWith(sellingRange: r),
      ),
    );
  }

  @override
  Future<void> close() {
    _storeSubscription.cancel();
    return super.close();
  }
}
