class Field {
  final String value;
  final String errorMessage;
  final bool isValid;

  Field({
    required this.value,
    this.errorMessage = '',
    this.isValid = false,
  });

  Field copyWith({
    String? value,
    String? errorMessage,
    bool? isValid,
  }) {
    return Field(
      value: value ?? this.value,
      errorMessage: errorMessage ?? this.errorMessage,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Field &&
          runtimeType == other.runtimeType &&
          value == other.value &&
          errorMessage == other.errorMessage &&
          isValid == other.isValid;

  @override
  int get hashCode => value.hashCode ^ errorMessage.hashCode ^ isValid.hashCode;

  @override
  String toString() {
    return 'Field(value: $value, errorMessage: $errorMessage, isValid: $isValid)';
  }
}
