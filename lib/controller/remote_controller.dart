import 'package:facebook_with_api/model/post.dart';
import 'package:facebook_with_api/model/postfeed.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    } else {
      throw Exception('Failed to load post');
    }
  }
}

class RemoteServiceFeed {
  Future<List<PostFeed>?> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJsonFeed(json);
    } else {
      throw Exception('Failed to load post');
    }
  }
}

class RemoteServiceFeed {
  Future<List<PostFeed>?> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJsonFeed(json);
    } else {
      throw Exception('Failed to load post');
    }
  }
}
