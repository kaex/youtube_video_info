import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:youtube_video_info/open_graph.dart';

part './model.dart';

class YoutubeData {
  static Future<YoutubeDataModel> getData(String link) async {
    final Uri uri =
        Uri.parse('https://www.youtube.com/oembed?url=$link&format=json');
    final Uri ytUri = Uri.parse(link);

    http.Response result;
    http.Response resultYt;

    try {
      result = await http.get(uri);
      resultYt = await http.get(ytUri);
    } catch (e) {
      throw e;
    }

    var regexYoutube = RegExp(r'ytInitialPlayerResponse\s*=\s*({.+?}}})\s*;')
        .firstMatch(resultYt.body);

    final Map<String, dynamic> resultJson = json.decode(result.body);

    final Map<String, dynamic> resultJsonPlayer =
        json.decode(regexYoutube!.group(1) ?? '')['videoDetails'];

    final ogData = await OpenGraphRepository.openGraphData(link);

    resultJson.addAll(resultJsonPlayer);
    resultJson.addAll(ogData);

    return YoutubeDataModel.fromMap(resultJson);
  }
}
