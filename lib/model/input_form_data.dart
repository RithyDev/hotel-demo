class InputFormData<T> {
   
  T? value;
  String? errorMessage;
  
  InputFormData(this.value, {this.errorMessage});

  factory InputFormData.error(String message) => InputFormData(null, errorMessage: message);
}