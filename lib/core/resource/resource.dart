abstract class Resource<T> {
  final T? data;
  final String? error;

  Resource({this.data, this.error});
}

class Success<T> extends Resource<T> {
  Success(T data) : super(data: data);
}

class Error<T> extends Resource<T> {
  Error(String errorMessage) : super(error: errorMessage);
}
