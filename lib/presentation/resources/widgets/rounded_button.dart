import 'package:flutter/material.dart';
import 'package:search_restaurants/presentation/theme/theme.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final bool isEnabled;

  const RoundedButton({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.isEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: isEnabled ? theme.colorScheme.primary : AppColors.greyDisabled,
        elevation: 8,
        minimumSize: const Size(240, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      onPressed: isEnabled
          ? () {
              onPressed();
            }
          : null,
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
