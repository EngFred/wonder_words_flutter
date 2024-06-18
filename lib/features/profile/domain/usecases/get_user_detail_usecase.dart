import 'package:wonder_words/core/usecase/base_usecase.dart';
import 'package:wonder_words/features/profile/domain/entities/user_entity.dart';
import 'package:wonder_words/features/profile/domain/repository/user_detail_repository.dart';

class GetUserDetailUsecase extends StreamBaseUsecase<UserEntity, String> {
  final UserDetailRepository _userDetailRepository;

  GetUserDetailUsecase({required UserDetailRepository userDetailRepository})
      : _userDetailRepository = userDetailRepository;

  @override
  Stream<UserEntity> call({required String params}) {
    return _userDetailRepository.getUser(params);
  }
}
