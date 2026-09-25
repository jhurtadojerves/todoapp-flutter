import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../domain/models/models.dart';
import '../presentation/providers/session_provider.dart';
import '../presentation/screens/auth_screen.dart';
import '../presentation/screens/boards_screen.dart';
import '../presentation/screens/tasks_screen.dart';
import '../presentation/viewmodels/resource_providers.dart';
import '../presentation/widgets/common.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final refresh = ValueNotifier(0);
  ref.listen(sessionProvider, (previous, next) {
    refresh.value++;
  });
  final router = GoRouter(
    initialLocation: '/home',
    refreshListenable: refresh,
    redirect: (context, state) {
      final session = ref.read(sessionProvider);
      if (session.isLoading) return null;
      if (state.uri.path.startsWith('/board/') && session.value == null) {
        return '/boards';
      }
      if (state.pathParameters.values.any((v) => int.tryParse(v) == null)) {
        return '/boards';
      }
      return null;
    },
    routes: [
      GoRoute(path: '/', redirect: (_, _) => '/home'),
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => Scaffold(
          body: shell,
          bottomNavigationBar: NavigationBar(
            selectedIndex: shell.currentIndex,
            onDestinationSelected: (index) {
              HapticFeedback.selectionClick();
              shell.goBranch(
                index,
                initialLocation: index == shell.currentIndex,
              );
            },
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(
                icon: Icon(Icons.grid_view),
                label: 'Boards',
              ),
              NavigationDestination(icon: Icon(Icons.people), label: 'Users'),
            ],
          ),
        ),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (_, _) => const AppScaffold(
                  title: 'Home',
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bienvenido a TodoApp',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text('Organiza tus tableros, tareas y equipos.'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/boards',
                builder: (_, _) => const AuthGate(child: BoardsScreen()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/users',
                builder: (_, _) => const AuthGate(child: UsersScreen()),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/register',
        builder: (_, _) => const AuthScreen(register: true),
      ),
      GoRoute(
        path: '/board/new',
        builder: (_, _) => const AuthGate(child: BoardFormScreen()),
      ),
      GoRoute(
        path: '/board/:id',
        builder: (_, s) => AuthGate(
          child: BoardDetailScreen(id: int.parse(s.pathParameters['id']!)),
        ),
        routes: [
          GoRoute(
            path: 'edit',
            builder: (_, s) => AuthGate(
              child: BoardFormScreen(id: int.parse(s.pathParameters['id']!)),
            ),
          ),
          GoRoute(
            path: 'tasks',
            builder: (_, s) => AuthGate(
              child: TasksScreen(boardId: int.parse(s.pathParameters['id']!)),
            ),
            routes: [
              GoRoute(
                path: 'new',
                builder: (_, s) => AuthGate(
                  child: TaskFormScreen(
                    boardId: int.parse(s.pathParameters['id']!),
                  ),
                ),
              ),
              GoRoute(
                path: ':taskId',
                builder: (_, s) => AuthGate(
                  child: TaskDetailScreen(
                    boardId: int.parse(s.pathParameters['id']!),
                    taskId: int.parse(s.pathParameters['taskId']!),
                  ),
                ),
                routes: [
                  GoRoute(
                    path: 'edit',
                    builder: (_, s) => AuthGate(
                      child: TaskFormScreen(
                        boardId: int.parse(s.pathParameters['id']!),
                        taskId: int.parse(s.pathParameters['taskId']!),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => AppScaffold(
      title: 'Página no encontrada',
      fallback: '/home',
      child: const Center(child: Text('La ruta solicitada no existe.')),
    ),
  );
  ref.listen(sessionExpiredProvider, (_, _) => router.go('/boards'));
  ref.onDispose(() {
    router.dispose();
    refresh.dispose();
  });
  return router;
});

class AuthGate extends ConsumerWidget {
  const AuthGate({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context, WidgetRef ref) => ref
      .watch(sessionProvider)
      .when(
        data: (session) => session == null ? const AuthScreen() : child,
        error: (error, stack) => AppScaffold(
          title: 'Sesión',
          child: Column(
            children: [
              Text(error.toString()),
              AppButton(
                'Reintentar',
                onPressed: () => ref.invalidate(sessionProvider),
              ),
            ],
          ),
        ),
        loading: () =>
            const Scaffold(body: Center(child: CircularProgressIndicator())),
      );
}

class UsersScreen extends ConsumerWidget {
  const UsersScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => AppScaffold(
    title: 'Listado de usuarios',
    child: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        PagedList<User>(
          value: ref.watch(usersProvider),
          retry: () => ref.invalidate(usersProvider),
          more: () => ref.read(usersProvider.notifier).loadMore(),
          item: (user) => Card(
            child: ListTile(
              title: Text(user.username),
              subtitle: Text(user.email),
            ),
          ),
        ),
      ],
    ),
  );
}
