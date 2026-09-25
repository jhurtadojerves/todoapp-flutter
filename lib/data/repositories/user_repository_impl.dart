import '../../domain/models/models.dart';
import '../../domain/models/pagination.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_datasource.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this.source);
  final UserDataSource source;
  @override
  Future<Paginated<User>> fetchUsers(int page) => source.fetchUsers(page);
}
