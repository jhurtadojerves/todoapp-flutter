import '../models/models.dart';
import '../models/pagination.dart';
import '../repositories/user_repository.dart';

class GetUsers {
  const GetUsers(this.repository);
  final UserRepository repository;
  Future<Paginated<User>> call(int page) => repository.fetchUsers(page);
}
