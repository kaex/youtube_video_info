part of './youtube.dart';

class YoutubeDataModel {
  YoutubeDataModel({
    required this.videoId,
    required this.title,
    required this.authorName,
    required this.authorUrl,
    required this.durationSeconds,
    required this.keywords,
    required this.averageRating,
    required this.viewCount,
    required this.type,
    required this.height,
    required this.width,
    required this.version,
    required this.thumbnailHeight,
    required this.thumbnailWidth,
    required this.thumbnailUrl,
    required this.html,
    required this.url,
    required this.description,
    required this.fullDescription,
  });

  final String? videoId;
  final String? title;
  final String? authorName;
  final String? authorUrl;
  final int? durationSeconds;
  final List? keywords;
  final double? averageRating;
  final int? viewCount;
  final String? type;
  final int? height;
  final int? width;
  final String? version;
  final int? thumbnailHeight;
  final int? thumbnailWidth;
  final String? thumbnailUrl;
  final String? html;
  final String? url;
  final String? description;
  final String? fullDescription;

  factory YoutubeDataModel.fromMap(Map<String, dynamic> json) =>
      YoutubeDataModel(
        videoId: json['videoId'] ?? null,
        title: json['title'] ?? null,
        authorName: json['author_name'] ?? null,
        authorUrl: json['author_url'] ?? null,
        durationSeconds: int.tryParse(json['lengthSeconds']) ?? null,
        keywords: json['keywords'] ?? null,
        averageRating: json['averageRating'].toDouble(),
        viewCount: int.tryParse(json['viewCount']) ?? null,
        type: json['type'] ?? null,
        height: json['height'] ?? null,
        width: json['width'] ?? null,
        version: json['version'] ?? null,
        thumbnailHeight: json['thumbnail_height'] ?? null,
        thumbnailWidth: json['thumbnail_width'] ?? null,
        thumbnailUrl: json['thumbnail_url'] ?? null,
        html: json['html'] ?? null,
        url: json['url'] ?? null,
        description: json['description'] ?? null,
        fullDescription: json['shortDescription'] ?? null,
      );

  Map<String, dynamic> toMap() => {
        'videoId': videoId ?? null,
        'title': title ?? null,
        'author_name': authorName ?? null,
        'author_url': authorUrl ?? null,
        'durationSeconds': durationSeconds ?? null,
        'keywords': keywords ?? null,
        'averageRating': averageRating ?? null,
        'viewCount': viewCount ?? null,
        'type': type ?? null,
        'height': height ?? null,
        'width': width ?? null,
        'version': version ?? null,
        'thumbnail_height': thumbnailHeight ?? null,
        'thumbnail_width': thumbnailWidth ?? null,
        'thumbnail_url': thumbnailUrl ?? null,
        'html': html ?? null,
        'url': url ?? null,
        'description': description ?? null,
        'fullDescription': fullDescription ?? null,
      };
}
