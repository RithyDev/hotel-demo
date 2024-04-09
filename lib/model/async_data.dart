class RestApiResponse<T> {
  T? data;
  RestApiResponse(this.data);
}

abstract class AsyncData<T> {
  T? get data;

  AsyncState get state;
}

class Loading<T> extends AsyncData<T> {
  @override
  T? get data => null;
  
  @override
  AsyncState get state => AsyncState.loading;
}

class Success<T> extends AsyncData<T> {
  T value;
  Success(this.value);

  @override
  T? get data => value;

  T getSafeData() => value;

  @override
  AsyncState get state => AsyncState.success;
}

class Fail<T> extends AsyncData<T> {

  Exception throwable;

  Fail(this.throwable);

  @override
  T? get data => null;

  @override
  AsyncState get state => AsyncState.falied;

}

enum AsyncState {
  loading, success, falied;
}