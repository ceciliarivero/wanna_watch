import 'package:flutter/material.dart';

class AddCheckbox extends StatelessWidget {
  const AddCheckbox({
    super.key,
    required this.isAdded,
    required this.add,
    required this.remove,
  });

  final bool isAdded;
  final VoidCallback add;
  final VoidCallback remove;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return IconButton(
      onPressed: isAdded ? remove : add,
      icon: Icon(
        isAdded ? Icons.check_circle : Icons.check_circle_outline,
        color: isAdded ? theme.primaryColorLight : theme.canvasColor,
      ),
    );
  }
}
