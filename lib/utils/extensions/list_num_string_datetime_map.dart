extension ExtensionForNumList on List<num> {
  List<String> get convertToStrings {
    return map((num value) => value.toString()).toList();
  }
}
