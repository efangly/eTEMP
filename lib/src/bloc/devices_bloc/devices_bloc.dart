import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:temp_noti/src/models/devices.dart';
import 'package:temp_noti/src/services/api.dart';

part 'devices_event.dart';
part 'devices_state.dart';

class DevicesBloc extends Bloc<DevicesEvent, DevicesState> {
  DevicesBloc() : super(const DevicesState()) {
    on<GetAllDevices>((event, emit) async {
      List<DeviceList> result = await Api.getDevice();
      emit(state.copyWith(devices: result));
    });
  }
}
