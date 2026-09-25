import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todoapp_flutter/domain/models/pagination.dart';
import 'package:todoapp_flutter/presentation/viewmodels/paginated_notifier.dart';

class TestPages extends PaginatedNotifier<int> {
  final pending = Completer<Paginated<int>>();
  int builds = 0;
  @override
  Future<Paginated<int>> load(int page) async {
    if (page == 1) {
      builds++;
      return Paginated(
        count: 2,
        next: 'page2',
        previous: null,
        results: [builds],
      );
    }
    return pending.future;
  }
}

void main() {
  test('carga adicional tardía no sobrescribe lista recargada', () async {
    final provider = AsyncNotifierProvider<TestPages, PageState<int>>(
      TestPages.new,
    );
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final subscription = container.listen(provider, (_, _) {});
    addTearDown(subscription.close);
    await container.read(provider.future);
    final notifier = container.read(provider.notifier);
    final more = notifier.loadMore();
    notifier.reload();
    await container.read(provider.future);
    notifier.pending.complete(
      const Paginated(count: 2, next: null, previous: 'page1', results: [99]),
    );
    await more;
    expect(container.read(provider).requireValue.items, [2]);
  });
}
