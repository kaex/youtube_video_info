# youtube_video_info

![flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

### [pub.dev/youtube_video_info](https://pub.dev/packages/youtube_video_info)

This is a lightweight⚡ package to fetch video info for YouTube from the url

### To install, add to pubspec.yaml

```yaml
flutter:
  sdk: flutter
youtube_video_info: ^1.0.0
```

and then run `flutter pub get`

Import the library

```dart
import 'package:youtube_video_info/youtube.dart';
```

### Calling the method

```
YoutubeDataModel videoData = await YoutubeData.getData(link);
```

### Example

```dart
var title = videoData.title; // "Ed Sheeran - Bad Habits [Official Video]"
var averageRating = videoData.averageRating; // 4.13242
var durationSeconds = videoData.durationSeconds; // 167
```

![example gif](https://media0.giphy.com/media/qhrpkPloaPHcuZa9N9/giphy.gif)