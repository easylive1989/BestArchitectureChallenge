import "package:best_architecture_challenge/domain/entity/post.dart";

Post post({int? id, String? title, String? body}) {
  return Post(
      id: id ?? 1,
      userId: 123,
      title: title ?? "no need to read",
      body: body ?? "nothing important");
}
