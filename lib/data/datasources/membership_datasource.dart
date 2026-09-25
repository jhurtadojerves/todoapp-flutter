import 'package:dio/dio.dart';
import '../../core/network/api_call.dart';
import '../../domain/models/models.dart';
import '../../domain/models/pagination.dart';

class MembershipDataSource {
  MembershipDataSource(this.dio);
  final Dio dio;
  Future<Paginated<BoardMembership>> fetchMembers(int boardId, int page) =>
      apiCall(
        () => dio.request(
          '/api/v1/boards/$boardId/members/',
          options: Options(method: 'GET'),
          queryParameters: {'page': page}
            ..removeWhere((key, value) => value == null),
        ),
        (data) => Paginated.fromJson(data, BoardMembership.fromJson),
      );
  Future<BoardMembership> addMember(int boardId, BoardMembershipInput input) =>
      apiCall(
        () => dio.request(
          '/api/v1/boards/$boardId/members/',
          options: Options(method: 'POST'),
          data: input.toJson(),
        ),
        (data) => BoardMembership.fromJson(data as Map<String, dynamic>),
      );
  Future<void> removeMember(int boardId, int id) => apiCall(
    () => dio.request(
      '/api/v1/boards/$boardId/members/$id/',
      options: Options(method: 'DELETE'),
    ),
    (_) {},
  );
}
