import 'package:flutter/material.dart';

import '../style/colors.dart';

class PAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> actions;
  final Widget leading;
  final Color backgroundColor;
  final double elevation;

  const PAppBar({
    super.key,
    this.actions = const [],
    this.leading = const Icon(Icons.menu),
    this.backgroundColor = Colors.blue,
    this.elevation = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          // Solid Icon
          Icons.arrow_back_ios,
          size: 12.5,
          color: black[950]!,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
