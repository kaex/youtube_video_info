import 'package:flutter/material.dart';
import 'package:youtube_video_info/youtube.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'youtube_video_info Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'youtube_video_info Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const String hintText = "Youtube URL...";
  static YoutubeDataModel? videoData;

  void _fetchMetadata(String link) async {
    videoData = await YoutubeData.getData(link);
    setState(() {});
  }

  Widget _boldText(boldText, normalText) {
    return new RichText(
      text: new TextSpan(
        style: new TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          new TextSpan(
              text: boldText,
              style: new TextStyle(fontWeight: FontWeight.bold)),
          new TextSpan(text: normalText),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              onSubmitted: (e) => _fetchMetadata(e),
              decoration: InputDecoration(hintText: hintText),
            ),
            SizedBox(height: 50),
            videoData == null
                ? Container()
                : Container(
                    child: Column(
                      children: [
                        Image.network(videoData!.thumbnailUrl ?? ''),
                        Divider(),
                        _boldText('videoId: ', videoData!.videoId),
                        Divider(),
                        _boldText('Title: ', videoData!.title),
                        Divider(),
                        _boldText('Channel Name: ', videoData!.authorName),
                        Divider(),
                        _boldText('Channel URL: ', videoData!.authorUrl),
                        Divider(),
                        _boldText('Duration: ',
                            videoData!.durationSeconds.toString() + ' seconds'),
                        Divider(),
                        Text('Keywords: ${videoData!.keywords}'),
                        Divider(),
                        _boldText('Average Rating: ',
                            videoData!.averageRating.toString()),
                        Divider(),
                        _boldText('View Count: ',
                            videoData!.viewCount.toString() + ' views'),
                        Divider(),
                        _boldText('Full Description: \r\n\r\n',
                            videoData!.fullDescription),
                        Divider(),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
