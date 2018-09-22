import 'package:html_unescape/html_unescape.dart';

void main() {
  String t =
      "OFF: \u0413\u0435\u043e\u043f\u043e\u043b\u0438\u0442\u0438\u043a\u0430. \u041f\u043e\u0440\u043e\u0448\u0435\u043d\u043a\u043e \u043e\u0431\u044a\u044f\u0432\u0438\u043b \u043e &quot;\u043f\u043e\u0431\u0435\u0434\u0435 \u043d\u0430\u0434 \u0420\u043e\u0441\u0441\u0438\u0435\u0439&quot; (649)";

  var unescape = new HtmlUnescape();
  var text = unescape.convert(t);
  print(text);
}
