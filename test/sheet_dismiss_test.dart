import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaspium_wallet/themes/kaspium_dark_theme.dart';
import 'package:kaspium_wallet/widgets/sheet_util.dart';

void main() {
  Future<void> pumpSheetHost(
    WidgetTester tester, {
    required bool canPop,
    required List<bool> popInvocations,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => Center(
              child: TextButton(
                onPressed: () => Sheets.showAppHeightNineSheet<void>(
                  context: context,
                  theme: KaspiumDarkTheme(),
                  widget: PopScope(
                    canPop: canPop,
                    onPopInvokedWithResult: (didPop, _) {
                      popInvocations.add(didPop);
                    },
                    child: const SizedBox.expand(
                      child: Text('sheet-content'),
                    ),
                  ),
                ),
                child: const Text('open'),
              ),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    expect(find.text('sheet-content'), findsOneWidget);
  }

  testWidgets('drag-dismiss veto restores the sheet', (tester) async {
    final popInvocations = <bool>[];
    await pumpSheetHost(tester, canPop: false, popInvocations: popInvocations);

    final restRect = tester.getRect(find.byType(BottomSheet));

    await tester.drag(find.byType(BottomSheet), const Offset(0, 500));
    await tester.pumpAndSettle();

    expect(popInvocations, [false], reason: 'pop should have been vetoed');
    expect(find.text('sheet-content'), findsOneWidget,
        reason: 'route should still be present');

    final settledRect = tester.getRect(find.byType(BottomSheet));
    expect(settledRect.top, moreOrLessEquals(restRect.top, epsilon: 1),
        reason: 'sheet should have animated back to its resting position');
  });

  testWidgets('drag-dismiss pops the sheet when allowed', (tester) async {
    final popInvocations = <bool>[];
    await pumpSheetHost(tester, canPop: true, popInvocations: popInvocations);

    await tester.drag(find.byType(BottomSheet), const Offset(0, 500));
    await tester.pumpAndSettle();

    expect(popInvocations, [true]);
    expect(find.text('sheet-content'), findsNothing);
  });
}
