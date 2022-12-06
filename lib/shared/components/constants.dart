void printFullText(String text) {
  final pattern = RegExp('.{1.000}');
  pattern.allMatches(text).forEach((element) {
    print(element.group(0));
  });
}
String? token = '';
