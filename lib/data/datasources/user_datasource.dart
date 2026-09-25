import 'package:dio/dio.dart';
import '../../core/network/api_call.dart';
import '../../domain/models/models.dart';
import '../../domain/models/pagination.dart';

class UserDataSource {
  UserDataSource(this.dio);
  final Dio dio;
  Future<Paginated<User>> fetchUsers(int page) => apiCall(
    () => dio.request(
      '/api/v1/users/',
      options: Options(method: 'GET'),
      queryParameters: {'page': page}
        ..removeWhere((key, value) => value == null),
    ),
    (data) => Paginated.fromJson(data, User.fromJson),
  );
}
