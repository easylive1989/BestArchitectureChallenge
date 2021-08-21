import 'package:best_architecture_challenge/ui/post/post_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixture.dart';

void main() {
  testWidgets('show post on list view', (WidgetTester tester) async {
    var posts = [
      post(id: 1, title: "first title", body: "first body"),
      post(id: 2, title: "second title", body: "second body"),
    ];

    await tester.pumpWidget(MaterialApp(home: PostListView(posts: posts)));

    await tester.pump();

    expect(findPostCardTitle("1. first title", Colors.red), findsOneWidget);
    expect(findPostCardTitle("2. second title", Colors.red), findsOneWidget);
  });
}

Finder findPostCardTitle(String title, Color color) {
  return find.byWidgetPredicate((widget) {
    if (widget is RichText) {
      var textSpan = (widget.text as TextSpan).children?[0] as TextSpan;
      return textSpan.text == title && textSpan.style?.color == color;
    }
    return false;
  });
}
