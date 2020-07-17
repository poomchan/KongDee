import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:permission_handler/permission_handler.dart';

part 'permission_event.dart';
part 'permission_state.dart';

class PermissionBloc extends Bloc<PermissionEvent, PermissionState> {
  PermissionBloc() : super(PermissionInitial());

  @override
  Stream<PermissionState> mapEventToState(
    PermissionEvent event,
  ) async* {
    if (event is LocationPermissionStarted) {
      yield* _mapLocationPermissionStartedToState();
    }
    if (event is LocationPermissionRequested) {
      yield* _mapLocationPermissionRequestedToState();
    }
  }

  Stream<PermissionState> _mapLocationPermissionStartedToState() async* {
    bool isGranted = await Permission.location.isGranted;
    if (isGranted) {
      yield LocationPermissionGranted();
    } else {
      yield LocationPermissionNotGranted();
    }
  }

  Stream<PermissionState> _mapLocationPermissionRequestedToState() async* {
    PermissionStatus status = await Permission.location.request();
    if (status.isDenied) {
      openAppSettings();
    }
    if (status.isGranted) {
      yield LocationPermissionGranted();
    }
  }
}
