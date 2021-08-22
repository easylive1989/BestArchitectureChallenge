// Imports the Flutter Driver API.
import 'package:best_architecture_challenge/main.dart' as app;
import 'package:best_architecture_challenge/ui/post/post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  tearDown(() async {
    await app.dispose();
  });

  testWidgets('show app bar title when app start', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.text("FlutterTaipei :)"), findsOneWidget);
  });

  testWidgets('show sort menu item when user click more button',
      (tester) async {
    app.main();
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.more_vert));

    await tester.pump();

    expect(find.byKey(ValueKey("menu_sort_by_id")), findsOneWidget);
    expect(find.byKey(ValueKey("menu_sort_by_title")), findsOneWidget);
  });

  testWidgets('show post when app is ready', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.more_vert));

    await tester.pump();

    expect(find.byType(PostCard), findsWidgets);
  });
}
