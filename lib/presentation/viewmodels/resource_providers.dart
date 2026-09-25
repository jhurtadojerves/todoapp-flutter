import '../providers/usecase_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/models.dart';
import '../../domain/models/pagination.dart';
import '../providers/session_provider.dart';
import 'paginated_notifier.dart';

final boardsProvider =
    AsyncNotifierProvider.autoDispose<BoardsNotifier, PageState<Board>>(
      BoardsNotifier.new,
    );

class BoardsNotifier extends PaginatedNotifier<Board> {
  @override
  Future<PageState<Board>> build() {
    ref.watch(userIdProvider);
    return super.build();
  }

  @override
  Future<Paginated<Board>> load(int page) => ref.read(getBoardsProvider)(page);
}

final usersProvider =
    AsyncNotifierProvider.autoDispose<UsersNotifier, PageState<User>>(
      UsersNotifier.new,
    );

class UsersNotifier extends PaginatedNotifier<User> {
  @override
  Future<PageState<User>> build() {
    ref.watch(userIdProvider);
    return super.build();
  }

  @override
  Future<Paginated<User>> load(int page) => ref.read(getUsersProvider)(page);
}

final membersProvider = AsyncNotifierProvider.autoDispose
    .family<MembersNotifier, PageState<BoardMembership>, int>(
      MembersNotifier.new,
    );

class MembersNotifier extends PaginatedNotifier<BoardMembership> {
  MembersNotifier(this.id);
  final int id;
  @override
  Future<PageState<BoardMembership>> build() {
    ref.watch(userIdProvider);
    return super.build();
  }

  @override
  Future<Paginated<BoardMembership>> load(int page) =>
      ref.read(getMembersProvider)(id, page);
}

final statusesProvider = AsyncNotifierProvider.autoDispose
    .family<StatusesNotifier, PageState<BoardStatus>, int>(
      StatusesNotifier.new,
    );

class StatusesNotifier extends PaginatedNotifier<BoardStatus> {
  StatusesNotifier(this.id);
  final int id;
  @override
  Future<PageState<BoardStatus>> build() {
    ref.watch(userIdProvider);
    return super.build();
  }

  @override
  Future<Paginated<BoardStatus>> load(int page) =>
      ref.read(getStatusesProvider)(id, page);
}

final sprintsProvider = AsyncNotifierProvider.autoDispose
    .family<SprintsNotifier, PageState<Sprint>, int>(SprintsNotifier.new);

class SprintsNotifier extends PaginatedNotifier<Sprint> {
  SprintsNotifier(this.id);
  final int id;
  @override
  Future<PageState<Sprint>> build() {
    ref.watch(userIdProvider);
    return super.build();
  }

  @override
  Future<Paginated<Sprint>> load(int page) =>
      ref.read(getSprintsProvider)(id, page);
}

final commentsProvider = AsyncNotifierProvider.autoDispose
    .family<CommentsNotifier, PageState<Comment>, int>(CommentsNotifier.new);

class CommentsNotifier extends PaginatedNotifier<Comment> {
  CommentsNotifier(this.id);
  final int id;
  @override
  Future<PageState<Comment>> build() {
    ref.watch(userIdProvider);
    return super.build();
  }

  @override
  Future<Paginated<Comment>> load(int page) =>
      ref.read(getCommentsProvider)(id, page);
}

typedef TaskListKey = ({int boardId, int? status});
final tasksProvider = AsyncNotifierProvider.autoDispose
    .family<TasksNotifier, PageState<Task>, TaskListKey>(TasksNotifier.new);

class TasksNotifier extends PaginatedNotifier<Task> {
  TasksNotifier(this.key);
  final TaskListKey key;
  @override
  Future<Paginated<Task>> load(int page) =>
      ref.read(getTasksProvider)(key.boardId, page, status: key.status);
}

final boardDetailProvider = FutureProvider.autoDispose.family<Board, int>((
  ref,
  id,
) {
  ref.watch(userIdProvider);
  return ref.watch(getBoardProvider)(id);
});
final taskDetailProvider = FutureProvider.autoDispose.family<Task, int>((
  ref,
  id,
) {
  ref.watch(userIdProvider);
  return ref.watch(getTaskProvider)(id);
});
