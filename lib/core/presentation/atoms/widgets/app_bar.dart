import 'package:flutter/material.dart';
import 'package:pulsa/core/presentation/atoms/text/p_text.dart';

import '../style/colors.dart';
import '../utils/gap.dart';

class PAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> actions;
  final Color backgroundColor;
  final Color? titleColor;
  final double elevation;
  final String title;
  final bool backIconVisible;
  final VoidCallback? onPressed;

  const PAppBar({
    super.key,
    this.actions = const [],
    this.backgroundColor = Colors.white,
    this.elevation = 4.0,
    this.title = '',
    this.onPressed,
    this.backIconVisible = true,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: PText.heading6Semibold(
        title,
        color: titleColor,
      ),
      centerTitle: !backIconVisible,
      leading: backIconVisible
          ? IconButton(
              onPressed: onPressed ?? backPressed,
              icon: Icon(
                // Solid Icon
                Icons.arrow_back_ios,
                size: 12.5,
                color: titleColor ?? black[950]!,
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
