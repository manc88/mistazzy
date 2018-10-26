// import 'package:html_unescape/html_unescape.dart';

void main() {
  String text =
      "the clean text (6) test fo the 6 , and then (7) thats \n for 7";
  RegExp regExp = new RegExp(
    r"\([0-9]{1,3}\)",
    caseSensitive: false,
    multiLine: true,
  );

  final newtext = text.replaceAllMapped(
      regExp,
      (match) =>
          "<mistazy href=${match.group(0).replaceAll(RegExp(r'\('), "").replaceAll(RegExp(r'\)'), "")}>");

  print(newtext);
}
