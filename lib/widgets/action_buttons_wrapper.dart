import 'package:flutter/widgets.dart';

class ActionButtonsWrapper extends StatelessWidget {
  final List<Widget> buttons;

  const ActionButtonsWrapper({super.key, required this.buttons});

  @override
  Widget build(BuildContext context) {
    final child = switch (buttons.length) {
      0 => SizedBox(),
      1 => buttons.first,
      _ => Column(
        children: [
          buttons.first,
          for (final button in buttons.skip(1)) ...[
            const SizedBox(height: 16),
            button,
          ],
        ],
      ),
    };

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
      child: child,
    );
  }
}
