import 'package:flutter/material.dart';

/// A tappable answer tile. Once the question is answered, it colors
/// itself green (correct), red (wrong pick), or stays neutral —
/// so the user gets immediate visual feedback.
class AnswerButton extends StatelessWidget {
  final String optionText;
  final int optionIndex;
  final int? selectedIndex;
  final int correctIndex;
  final bool answered;
  final VoidCallback onTap;

  const AnswerButton({
    super.key,
    required this.optionText,
    required this.optionIndex,
    required this.selectedIndex,
    required this.correctIndex,
    required this.answered,
    required this.onTap,
  });

  Color _backgroundColor(BuildContext context) {
    if (!answered) {
      return Theme.of(context).colorScheme.surfaceContainerHighest;
    }
    if (optionIndex == correctIndex) {
      return Colors.green.shade400;
    }
    if (optionIndex == selectedIndex) {
      return Colors.red.shade400;
    }
    return Theme.of(context).colorScheme.surfaceContainerHighest;
  }

  IconData? _trailingIcon() {
    if (!answered) return null;
    if (optionIndex == correctIndex) return Icons.check_circle;
    if (optionIndex == selectedIndex) return Icons.cancel;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final bg = _backgroundColor(context);
    final icon = _trailingIcon();
    final isHighlighted = answered &&
        (optionIndex == correctIndex || optionIndex == selectedIndex);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Material(
        color: bg,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: answered ? null : onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    optionText,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: isHighlighted ? Colors.white : null,
                    ),
                  ),
                ),
                if (icon != null)
                  Icon(icon, color: Colors.white, size: 22),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
