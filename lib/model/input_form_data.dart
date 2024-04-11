class InputFormData<T> {
   
  T? value;
  String? errorMessage;
  
  InputFormData(this.value, {this.errorMessage});

  void clear() {
    errorMessage = null;
    value = null;
  }

  factory InputFormData.error(String message) => InputFormData(null, errorMessage: message);
}