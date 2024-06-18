import 'package:wonder_words/features/auth/data/models/request_bodies/user_session.dart';

import '../../../../core/resource/resource.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../repository/auth_repository.dart';

class CreateUserSessionUsecase
    implements BaseUsecase<Resource<String>, UserSessionRequest> {
  final AuthRepository _authRepository;

  CreateUserSessionUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<Resource<String>> call({required UserSessionRequest params}) async {
    final response = await _authRepository.loginUser(params);
    return response;
  }
}
