import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

enum DevicePermission { granted, denied, blocked }

abstract interface class DevicePermissions {
  Future<DevicePermission> camera();
  Future<DevicePermission> location();
  Future<void> settings();
}

abstract interface class CameraService {
  Future<String?> capture();
}

abstract interface class LocationService {
  Future<({double latitude, double longitude})> locate();
}

class NativePermissions implements DevicePermissions {
  Future<DevicePermission> _request(Permission permission) async {
    final status = await permission.request();
    return status.isGranted
        ? DevicePermission.granted
        : status.isPermanentlyDenied || status.isRestricted
        ? DevicePermission.blocked
        : DevicePermission.denied;
  }

  @override
  Future<DevicePermission> camera() => _request(Permission.camera);
  @override
  Future<DevicePermission> location() => _request(Permission.locationWhenInUse);
  @override
  Future<void> settings() async {
    await openAppSettings();
  }
}

class NativeCamera implements CameraService {
  @override
  Future<String?> capture() async => (await ImagePicker().pickImage(
    source: ImageSource.camera,
    imageQuality: 60,
  ))?.path;
}

class NativeLocation implements LocationService {
  @override
  Future<({double latitude, double longitude})> locate() async {
    final position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.medium,
        timeLimit: Duration(seconds: 15),
      ),
    );
    return (latitude: position.latitude, longitude: position.longitude);
  }
}
