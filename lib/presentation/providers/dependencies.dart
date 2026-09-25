import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/api_client.dart';
import '../../core/network/auth_interceptor.dart';
import 'session_provider.dart';
import '../../domain/repositories/board_repository.dart';
import '../../data/repositories/board_repository_impl.dart';
import '../../data/datasources/board_datasource.dart';
import '../../domain/repositories/task_repository.dart';
import '../../data/repositories/task_repository_impl.dart';
import '../../data/datasources/task_datasource.dart';
import '../../domain/repositories/user_repository.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../data/datasources/user_datasource.dart';
import '../../domain/repositories/membership_repository.dart';
import '../../data/repositories/membership_repository_impl.dart';
import '../../data/datasources/membership_datasource.dart';
import '../../domain/repositories/status_repository.dart';
import '../../data/repositories/status_repository_impl.dart';
import '../../data/datasources/status_datasource.dart';
import '../../domain/repositories/sprint_repository.dart';
import '../../data/repositories/sprint_repository_impl.dart';
import '../../data/datasources/sprint_datasource.dart';
import '../../domain/repositories/comment_repository.dart';
import '../../data/repositories/comment_repository_impl.dart';
import '../../data/datasources/comment_datasource.dart';

final apiClientProvider = Provider((ref) {
  final dio = createDio();
  dio.interceptors.add(
    AuthInterceptor(
      dio: dio,
      accessToken: () => ref.read(sessionProvider).value?.access,
      refresh: () => ref.read(sessionProvider.notifier).refresh(),
      onUnauthorized: () async {
        await ref.read(sessionProvider.notifier).logout();
        if (ref.mounted) ref.read(sessionExpiredProvider.notifier).notify();
      },
    ),
  );
  ref.onDispose(() => dio.close());
  return dio;
});
final boardRepositoryProvider = Provider<BoardRepository>(
  (ref) => BoardRepositoryImpl(BoardDataSource(ref.watch(apiClientProvider))),
);
final taskRepositoryProvider = Provider<TaskRepository>(
  (ref) => TaskRepositoryImpl(TaskDataSource(ref.watch(apiClientProvider))),
);
final userRepositoryProvider = Provider<UserRepository>(
  (ref) => UserRepositoryImpl(UserDataSource(ref.watch(apiClientProvider))),
);
final membershipRepositoryProvider = Provider<MembershipRepository>(
  (ref) => MembershipRepositoryImpl(
    MembershipDataSource(ref.watch(apiClientProvider)),
  ),
);
final statusRepositoryProvider = Provider<StatusRepository>(
  (ref) => StatusRepositoryImpl(StatusDataSource(ref.watch(apiClientProvider))),
);
final sprintRepositoryProvider = Provider<SprintRepository>(
  (ref) => SprintRepositoryImpl(SprintDataSource(ref.watch(apiClientProvider))),
);
final commentRepositoryProvider = Provider<CommentRepository>(
  (ref) =>
      CommentRepositoryImpl(CommentDataSource(ref.watch(apiClientProvider))),
);
