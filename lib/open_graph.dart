import 'package:html/dom.dart' as _dom;
import 'package:html/parser.dart';
import 'package:http/http.dart' as _http;

class OpenGraphRepository {
  static Future<Map<String, String>> openGraphData(String url) async {
    final Uri videoUrl = Uri.parse(url);
    final Map<String, String> headers = {
      'User-Agent':
          'Mozilla/5.0 (compatible; googlebot/2.1; + https://www.google.com/bot.html)'
    };

    _http.Response response;
    try {
      response = await _http.get(videoUrl, headers: headers);
    } catch (_) {
      throw _;
    }
    final Map<String, String> og = {};

    final _dom.Document doc = parse(response.body);
    doc.getElementsByTagName('meta').forEach((element) {
      if (element.attributes['property'] == "og:description") {
        og['description'] = element.attributes['content'] ?? "";
      }
      if (element.attributes['property'] == "og:url") {
        og['url'] = element.attributes['content'] ?? "";
      }
    });

    return og;
  }
}
