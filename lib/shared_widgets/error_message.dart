import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      color: theme.primaryColor,
      child: Center(
        child: Text(
          text,
          style: theme.textTheme.bodyLarge,
        ),
      ),
    );
  }
}
