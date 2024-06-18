import 'package:wonder_words/core/resource/resource.dart';
import 'package:wonder_words/core/usecase/base_usecase.dart';
import 'package:wonder_words/features/auth/data/models/request_bodies/new_user.dart';
import 'package:wonder_words/features/auth/domain/repository/auth_repository.dart';

class CreateUserUsecase
    implements BaseUsecase<Resource<String>, NewUserRequest> {
  final AuthRepository _authRepository;

  CreateUserUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<Resource<String>> call({required NewUserRequest params}) async {
    final response = await _authRepository.createUser(params);
    return response;
  }
}
