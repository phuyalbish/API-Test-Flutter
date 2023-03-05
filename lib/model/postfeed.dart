// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<PostFeed> postFromJsonFeed(String str) =>
    List<PostFeed>.from(json.decode(str).map((x) => PostFeed.fromJson(x)));

String postToJson(List<PostFeed> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostFeed {
  PostFeed({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory PostFeed.fromJson(Map<String, dynamic> json) => PostFeed(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
