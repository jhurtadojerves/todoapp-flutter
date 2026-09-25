import 'package:dio/dio.dart';
import '../../core/network/api_call.dart';
import '../../domain/models/models.dart';
import '../../domain/models/pagination.dart';

class BoardDataSource {
  BoardDataSource(this.dio);
  final Dio dio;
  Future<Paginated<Board>> fetchBoards(int page) => apiCall(
    () => dio.request(
      '/api/v1/boards/',
      options: Options(method: 'GET'),
      queryParameters: {'page': page}
        ..removeWhere((key, value) => value == null),
    ),
    (data) => Paginated.fromJson(data, Board.fromJson),
  );
  Future<Board> fetchBoard(int id) => apiCall(
    () => dio.request('/api/v1/boards/$id/', options: Options(method: 'GET')),
    (data) => Board.fromJson(data as Map<String, dynamic>),
  );
  Future<Board> createBoard(BoardInput input) => apiCall(
    () => dio.request(
      '/api/v1/boards/',
      options: Options(method: 'POST'),
      data: input.toJson(),
    ),
    (data) => Board.fromJson(data as Map<String, dynamic>),
  );
  Future<Board> updateBoard(int id, BoardInput input) => apiCall(
    () => dio.request(
      '/api/v1/boards/$id/',
      options: Options(method: 'PATCH'),
      data: input.toJson(),
    ),
    (data) => Board.fromJson(data as Map<String, dynamic>),
  );
  Future<void> deleteBoard(int id) => apiCall(
    () =>
        dio.request('/api/v1/boards/$id/', options: Options(method: 'DELETE')),
    (_) {},
  );
}
