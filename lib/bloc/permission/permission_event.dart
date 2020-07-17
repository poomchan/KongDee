part of 'permission_bloc.dart';

abstract class PermissionEvent extends Equatable {
  const PermissionEvent();
}

class LocationPermissionStarted extends PermissionEvent {
  @override
  List<Object> get props => [];
}

class LocationPermissionRequested extends PermissionEvent {
  @override
  List<Object> get props => [];
}
