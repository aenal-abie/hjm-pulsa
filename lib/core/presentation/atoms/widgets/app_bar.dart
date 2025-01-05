import 'package:flutter/material.dart';
import 'package:pulsa/core/presentation/atoms/text/p_text.dart';

import '../style/colors.dart';
import '../utils/gap.dart';

class PAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> actions;
  final Widget leading;
  final Color backgroundColor;
  final double elevation;
  final String title;
  final bool backIconVisible;
  final VoidCallback? onPressed;

  const PAppBar({
    super.key,
    this.actions = const [],
    this.leading = const Icon(Icons.menu),
    this.backgroundColor = Colors.white,
    this.elevation = 4.0,
    this.title = '',
    this.onPressed,
    this.backIconVisible = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: PText.heading6Semibold(title),
      centerTitle: !backIconVisible,
      leading: backIconVisible
          ? IconButton(
              onPressed: onPressed ?? backPressed,
              icon: Icon(
                // Solid Icon
                Icons.arrow_back_ios,
                size: 12.5,
                color: black[950]!,
              ),
            )
          : SizedBox.shrink(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void backPressed() {
    Get.back();
  }
}
