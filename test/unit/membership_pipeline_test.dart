import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:todoapp_flutter/core/network/api_exception.dart';
import 'package:todoapp_flutter/data/datasources/membership_datasource.dart';
import 'package:todoapp_flutter/data/repositories/membership_repository_impl.dart';
import 'package:todoapp_flutter/domain/models/models.dart';
import 'package:todoapp_flutter/domain/usecases/get_members.dart';
import 'package:todoapp_flutter/domain/usecases/add_member.dart';
import 'package:todoapp_flutter/domain/usecases/remove_member.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late MembershipRepositoryImpl repository;
  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'https://test.example'));
    adapter = DioAdapter(dio: dio);
    repository = MembershipRepositoryImpl(MembershipDataSource(dio));
  });
  test('GetMembers: ruta, parámetros y contrato', () async {
    adapter.onGet(
      '/api/v1/boards/2/members/',
      (s) => s.reply(200, <String, dynamic>{
        "count": 1,
        "next": null,
        "previous": null,
        "results": [
          <String, dynamic>{
            "id": 1,
            "board_id": 2,
            "user": <String, dynamic>{
              "id": 7,
              "username": "user",
              "email": "user@example.com",
            },
            "role": "member",
            "created": "2026-01-01",
          },
        ],
      }),
      queryParameters: <String, dynamic>{"page": 1},
    );
    final result = await GetMembers(repository)(2, 1);
    expect(result.count, 1);
    expect(result.results.single.id, 1);
  });
  test('GetMembers: propaga error del servidor', () async {
    adapter.onGet(
      '/api/v1/boards/2/members/',
      (s) => s.reply(403, {'detail': 'Sin permiso'}),
      queryParameters: <String, dynamic>{"page": 1},
    );
    await expectLater(
      GetMembers(repository)(2, 1),
      throwsA(
        isA<ApiError>().having((e) => e.message, 'message', 'Sin permiso'),
      ),
    );
  });
  test('GetMembers: rechaza contrato roto', () async {
    adapter.onGet(
      '/api/v1/boards/2/members/',
      (s) => s.reply(200, {'unexpected': true}),
      queryParameters: <String, dynamic>{"page": 1},
    );
    await expectLater(
      GetMembers(repository)(2, 1),
      throwsA(isA<ServerError>()),
    );
  });
  test('AddMember: ruta, parámetros y contrato', () async {
    adapter.onPost(
      '/api/v1/boards/2/members/',
      (s) => s.reply(201, <String, dynamic>{
        "id": 1,
        "board_id": 2,
        "user": <String, dynamic>{
          "id": 7,
          "username": "user",
          "email": "user@example.com",
        },
        "role": "member",
        "created": "2026-01-01",
      }),
      data: <String, dynamic>{"email": "user@example.com", "role": "member"},
    );
    final result = await AddMember(repository)(
      2,
      BoardMembershipInput.fromJson(<String, dynamic>{
        "email": "user@example.com",
        "role": "member",
      }),
    );
    expect(result.id, 1);
  });
  test('AddMember: propaga error del servidor', () async {
    adapter.onPost(
      '/api/v1/boards/2/members/',
      (s) => s.reply(403, {'detail': 'Sin permiso'}),
      data: <String, dynamic>{"email": "user@example.com", "role": "member"},
    );
    await expectLater(
      AddMember(repository)(
        2,
        BoardMembershipInput.fromJson(<String, dynamic>{
          "email": "user@example.com",
          "role": "member",
        }),
      ),
      throwsA(
        isA<ApiError>().having((e) => e.message, 'message', 'Sin permiso'),
      ),
    );
  });
  test('AddMember: rechaza contrato roto', () async {
    adapter.onPost(
      '/api/v1/boards/2/members/',
      (s) => s.reply(200, {'unexpected': true}),
      data: <String, dynamic>{"email": "user@example.com", "role": "member"},
    );
    await expectLater(
      AddMember(repository)(
        2,
        BoardMembershipInput.fromJson(<String, dynamic>{
          "email": "user@example.com",
          "role": "member",
        }),
      ),
      throwsA(isA<ServerError>()),
    );
  });
  test('RemoveMember: ruta, parámetros y contrato', () async {
    adapter.onDelete('/api/v1/boards/2/members/1/', (s) => s.reply(204, null));
    await RemoveMember(repository)(2, 1);
  });
  test('RemoveMember: propaga error del servidor', () async {
    adapter.onDelete(
      '/api/v1/boards/2/members/1/',
      (s) => s.reply(403, {'detail': 'Sin permiso'}),
    );
    await expectLater(
      RemoveMember(repository)(2, 1),
      throwsA(
        isA<ApiError>().having((e) => e.message, 'message', 'Sin permiso'),
      ),
    );
  });
}
