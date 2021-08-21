import 'dart:convert';

import 'package:best_architecture_challenge/app/app_config.dart';
import 'package:best_architecture_challenge/domain/entity/post.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@singleton
class PostApi {
  final String _domain;

  PostApi({required AppConfig appConfig}) : _domain = appConfig.apiDomain;

  Future<List<Post>> fetchPosts() async {
    var response = await http.get(Uri.https(_domain, '/posts'));
    var result = jsonDecode(response.body);
    return result.map<Post>((result) => Post.fromJson(result)).toList();
  }
}
