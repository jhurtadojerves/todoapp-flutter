import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/pagination.dart';

class PageState<T> {
  const PageState(
    this.items,
    this.page,
    this.hasMore, {
    this.isLoadingMore = false,
    this.moreError,
  });
  final List<T> items;
  final int page;
  final bool hasMore;
  final bool isLoadingMore;
  final Object? moreError;
}

abstract class PaginatedNotifier<T> extends AsyncNotifier<PageState<T>> {
  int _revision = 0;
  Future<Paginated<T>> load(int page);
  @override
  Future<PageState<T>> build() async {
    _revision++;
    final result = await load(1);
    return PageState(result.results, 1, result.next != null);
  }

  Future<void> loadMore() async {
    final revision = _revision;
    final previous = state.value;
    if (previous == null || !previous.hasMore || previous.isLoadingMore) return;
    state = AsyncData(
      PageState(previous.items, previous.page, true, isLoadingMore: true),
    );
    try {
      final result = await load(previous.page + 1);
      if (!ref.mounted || revision != _revision) return;
      state = AsyncData(
        PageState(
          [...previous.items, ...result.results],
          previous.page + 1,
          result.next != null,
        ),
      );
    } catch (e) {
      if (ref.mounted && revision == _revision) {
        state = AsyncData(
          PageState(previous.items, previous.page, true, moreError: e),
        );
      }
    }
  }

  void reload() => ref.invalidateSelf();
}
