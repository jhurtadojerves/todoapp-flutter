import '../../domain/models/models.dart';
import '../../domain/models/pagination.dart';

abstract interface class UserRepository {
  Future<Paginated<User>> fetchUsers(int page);
}
