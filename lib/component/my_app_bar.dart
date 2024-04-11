import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String pageTitle;

  const MyAppBar({
    super.key,
    required this.pageTitle,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        pageTitle,
        style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
