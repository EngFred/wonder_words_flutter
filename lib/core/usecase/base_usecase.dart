abstract class BaseUsecase<Type, Params> {
  Future<Type> call({required Params params});
}

abstract class StreamBaseUsecase<Type, Params> {
  Stream<Type> call({required Params params});
}
