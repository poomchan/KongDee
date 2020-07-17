part of 'permission_bloc.dart';

abstract class PermissionState extends Equatable {
  const PermissionState();
}

class PermissionInitial extends PermissionState {
  @override
  List<Object> get props => [];
}

class LocationPermissionChecking extends PermissionState {
  @override
  List<Object> get props => [];
}

class LocationPermissionGranted extends PermissionState {
  @override
  List<Object> get props => [];
}

class LocationPermissionNotGranted extends PermissionState {
  @override
  List<Object> get props => [];
}

class PermissionError extends PermissionState {
  final String error;
  PermissionError({this.error});
  @override
  List<Object> get props => [];
}
