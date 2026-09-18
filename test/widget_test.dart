import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:kaspium_wallet/kafeeds/kafeeds_home.dart';
import 'package:kaspium_wallet/social/social_models.dart';

void main() {
  testWidgets('Kafeeds detail screen shows the selected post and title', (
    WidgetTester tester,
  ) async {
    final post = KafeedsPost(
      id: 'post-123',
      author: const KafeedsUser(
        id: 'author-1',
        username: 'alice',
        displayName: 'Alice Kafeeds',
        avatarUrl: 'https://example.com/avatar.png',
      ),
      text: 'Launching the new Kafeeds detail view with real post data.',
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      likes: 42,
      replies: 7,
      reposts: 3,
    );

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: KafeedsPostDetailScreen(post: post),
        ),
      ),
    );

    expect(find.text('Postingan'), findsOneWidget);
    expect(find.text('Alice Kafeeds'), findsOneWidget);
    expect(find.text('@alice'), findsOneWidget);
    expect(find.textContaining('Launching the new Kafeeds detail view'), findsOneWidget);
  });
}
