import 'package:best_architecture_challenge/data/external/post_api.dart';
import 'package:best_architecture_challenge/data/repository/post_api_adapter.dart';
import 'package:best_architecture_challenge/domain/entity/post.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'post_api_adapter_test.mocks.dart';

@GenerateMocks([PostApi])
main() {
  test("translate json to posts", () async {
    var mockPostApi = MockPostApi();
    when(mockPostApi.get()).thenAnswer((realInvocation) => Future.value([
          {
            "userId": 1,
            "id": 1,
            "title":
                "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
            "body":
                "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
          },
          {
            "userId": 1,
            "id": 2,
            "title": "qui est esse",
            "body":
                "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"
          },
        ]));
    var postApiAdapter = PostApiAdapter(
      postApi: mockPostApi,
    );

    var posts = await postApiAdapter.fetch();

    postShouldBe(
      posts[0],
      id: 1,
      userId: 1,
      title:
          "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
      body:
          "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
    );
    postShouldBe(
      posts[1],
      id: 2,
      userId: 1,
      title: "qui est esse",
      body:
          "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla",
    );
  });
}

void postShouldBe(
  Post post, {
  required int id,
  required int userId,
  required String title,
  required String body,
}) {
  expect(post.id, id);
  expect(post.userId, userId);
  expect(post.title, title);
  expect(post.body, body);
}
