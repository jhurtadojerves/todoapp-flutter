import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dependencies.dart';
import '../../domain/usecases/get_boards.dart';
import '../../domain/usecases/get_board.dart';
import '../../domain/usecases/create_board.dart';
import '../../domain/usecases/update_board.dart';
import '../../domain/usecases/delete_board.dart';
import '../../domain/usecases/get_tasks.dart';
import '../../domain/usecases/get_task.dart';
import '../../domain/usecases/create_task.dart';
import '../../domain/usecases/update_task.dart';
import '../../domain/usecases/delete_task.dart';
import '../../domain/usecases/get_users.dart';
import '../../domain/usecases/get_members.dart';
import '../../domain/usecases/add_member.dart';
import '../../domain/usecases/remove_member.dart';
import '../../domain/usecases/get_statuses.dart';
import '../../domain/usecases/create_status.dart';
import '../../domain/usecases/update_status.dart';
import '../../domain/usecases/delete_status.dart';
import '../../domain/usecases/get_sprints.dart';
import '../../domain/usecases/create_sprint.dart';
import '../../domain/usecases/update_sprint.dart';
import '../../domain/usecases/delete_sprint.dart';
import '../../domain/usecases/get_comments.dart';
import '../../domain/usecases/create_comment.dart';
import '../../domain/usecases/update_comment.dart';
import '../../domain/usecases/delete_comment.dart';

final getBoardsProvider = Provider(
  (ref) => GetBoards(ref.watch(boardRepositoryProvider)),
);
final getBoardProvider = Provider(
  (ref) => GetBoard(ref.watch(boardRepositoryProvider)),
);
final createBoardProvider = Provider(
  (ref) => CreateBoard(ref.watch(boardRepositoryProvider)),
);
final updateBoardProvider = Provider(
  (ref) => UpdateBoard(ref.watch(boardRepositoryProvider)),
);
final deleteBoardProvider = Provider(
  (ref) => DeleteBoard(ref.watch(boardRepositoryProvider)),
);
final getTasksProvider = Provider(
  (ref) => GetTasks(ref.watch(taskRepositoryProvider)),
);
final getTaskProvider = Provider(
  (ref) => GetTask(ref.watch(taskRepositoryProvider)),
);
final createTaskProvider = Provider(
  (ref) => CreateTask(ref.watch(taskRepositoryProvider)),
);
final updateTaskProvider = Provider(
  (ref) => UpdateTask(ref.watch(taskRepositoryProvider)),
);
final deleteTaskProvider = Provider(
  (ref) => DeleteTask(ref.watch(taskRepositoryProvider)),
);
final getUsersProvider = Provider(
  (ref) => GetUsers(ref.watch(userRepositoryProvider)),
);
final getMembersProvider = Provider(
  (ref) => GetMembers(ref.watch(membershipRepositoryProvider)),
);
final addMemberProvider = Provider(
  (ref) => AddMember(ref.watch(membershipRepositoryProvider)),
);
final removeMemberProvider = Provider(
  (ref) => RemoveMember(ref.watch(membershipRepositoryProvider)),
);
final getStatusesProvider = Provider(
  (ref) => GetStatuses(ref.watch(statusRepositoryProvider)),
);
final createStatusProvider = Provider(
  (ref) => CreateStatus(ref.watch(statusRepositoryProvider)),
);
final updateStatusProvider = Provider(
  (ref) => UpdateStatus(ref.watch(statusRepositoryProvider)),
);
final deleteStatusProvider = Provider(
  (ref) => DeleteStatus(ref.watch(statusRepositoryProvider)),
);
final getSprintsProvider = Provider(
  (ref) => GetSprints(ref.watch(sprintRepositoryProvider)),
);
final createSprintProvider = Provider(
  (ref) => CreateSprint(ref.watch(sprintRepositoryProvider)),
);
final updateSprintProvider = Provider(
  (ref) => UpdateSprint(ref.watch(sprintRepositoryProvider)),
);
final deleteSprintProvider = Provider(
  (ref) => DeleteSprint(ref.watch(sprintRepositoryProvider)),
);
final getCommentsProvider = Provider(
  (ref) => GetComments(ref.watch(commentRepositoryProvider)),
);
final createCommentProvider = Provider(
  (ref) => CreateComment(ref.watch(commentRepositoryProvider)),
);
final updateCommentProvider = Provider(
  (ref) => UpdateComment(ref.watch(commentRepositoryProvider)),
);
final deleteCommentProvider = Provider(
  (ref) => DeleteComment(ref.watch(commentRepositoryProvider)),
);
