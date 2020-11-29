import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/bloc/store_view_cubit.dart';
import 'package:fluttertaladsod/domain/store/i_store_repository.dart';
import 'package:fluttertaladsod/domain/store/location/store_location.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/domain/store/value_objects.dart';
import 'package:fluttertaladsod/injection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/instance_manager.dart';

part 'store_prefs_actor_state.dart';
part 'store_prefs_actor_cubit.freezed.dart';

// do not create this cubit if the store if not succesfully loaded
class StorePrefsActorCubit extends Cubit<StorePrefsActorState> {
  final IStoreRepository iStoreRepository = getIt<IStoreRepository>();
  final StoreViewCubit _storeViewCubit = Get.find<StoreViewCubit>();
  StreamSubscription _storeSubscription;
  Store _store;

  StorePrefsActorCubit() : super(StorePrefsActorState.initial()) {
    _store = _storeViewCubit.state.maybeMap(
      success: (s) => s.store,
      orElse: () => throw 'StorePrefsCubit: init store is null',
    );
    _storeSubscription = _storeViewCubit.listen(
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
