import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_form_state.dart';
part 'location_form_cubit.freezed.dart';

class LocationFormCubit extends Cubit<LocationFormState> {
  LocationFormCubit() : super(LocationFormState.initial());
}
