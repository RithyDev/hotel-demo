class UniqueOnly<T> {
  T? value;
  Function(T? newValue) onValueChange;

  UniqueOnly({required this.onValueChange});

  void setValue(T? newValue) {
    if (value != newValue) {
      value = newValue;
      onValueChange(value);
    }
  }
}
