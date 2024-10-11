class ApiResource<T> {
  ApiResource(
    this.status,
    this.message,
    this.data
  );

  int status;
  String message = '';
  T? data;
}