part of 'devices_bloc.dart';

class DevicesState extends Equatable {
  final List<DeviceList> devices;
  const DevicesState({this.devices = const []});

  DevicesState copyWith({List<DeviceList>? devices}) {
    return DevicesState(devices: devices ?? this.devices);
  }

  @override
  List<Object> get props => [devices];
}
