import 'package:flutter/material.dart';

class MainDrawerOptions extends StatelessWidget {
  const MainDrawerOptions({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });
  final IconData icon;
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
          Icon(icon, color: Theme.of(context).colorScheme.onSurface, size: 24),
      title: Text(
        text,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Theme.of(context).colorScheme.onSurface, fontSize: 24),
      ),
      onTap: onTap,
    );
  }
}
