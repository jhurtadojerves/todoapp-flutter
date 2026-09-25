import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/models.dart';
import '../../domain/models/pagination.dart';
import '../providers/usecase_providers.dart';

Future<List<T>> allPages<T>(Future<Paginated<T>> Function(int) fetch) async {
  final items = <T>[];
  var page = 1;
  while (true) {
    final result = await fetch(page++);
    items.addAll(result.results);
    if (result.next == null) return items;
  }
}

final taskOptionsProvider = FutureProvider.autoDispose
    .family<
      ({
        List<BoardStatus> statuses,
        List<Sprint> sprints,
        List<BoardMembership> members,
      }),
      int
    >((ref, id) async {
      final result = await Future.wait<Object>([
        allPages((page) => ref.read(getStatusesProvider)(id, page)),
        allPages((page) => ref.read(getSprintsProvider)(id, page)),
        allPages((page) => ref.read(getMembersProvider)(id, page)),
      ]);
      return (
        statuses: result[0] as List<BoardStatus>,
        sprints: result[1] as List<Sprint>,
        members: result[2] as List<BoardMembership>,
      );
    });
