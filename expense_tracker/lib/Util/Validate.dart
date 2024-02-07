class AppValidation {
  String? isEmptyCheck(value) {
    if (value!.isEmpty) {
      return "Fill in Details";
    }
    return null;
  }
}
