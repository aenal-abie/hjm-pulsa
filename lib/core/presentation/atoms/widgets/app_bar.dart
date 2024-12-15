import 'package:flutter/material.dart';
import 'package:pulsa/core/presentation/atoms/text/p_text.dart';

import '../style/colors.dart';

class PAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> actions;
  final Widget leading;
  final Color backgroundColor;
  final double elevation;
  final String title;

  const PAppBar({
    super.key,
    this.actions = const [],
    this.leading = const Icon(Icons.menu),
    this.backgroundColor = Colors.white,
    this.elevation = 4.0,
    this.title = '',
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: PText.heading6Semibold(title),
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
