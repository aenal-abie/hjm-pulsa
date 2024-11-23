import 'package:core/component/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../assets/manager/assets.gen.dart';
import '../atoms/fields/text.dart';

class GSAppBar extends AppBar {
  final Color? iconColor;
  final String? titleText;
  final Color? titleColor;
  final double? titleFontSize;
  final FontWeight? titleFontWeight;
  final VoidCallback? backIconClick;
  final bool showBackButton;
  final Widget? titleWidget;
  final Widget? customLeading;
  final bool? isTransparent;

  GSAppBar({
    super.key,
    this.iconColor,
    this.titleText,
    this.titleColor,
    this.titleFontSize,
    this.titleFontWeight,
    this.isTransparent,
    this.customLeading,
    super.actions,
    this.showBackButton = true,
    this.backIconClick,
    this.titleWidget,
  }) : super(
    centerTitle: true,
          titleSpacing: 0,
          elevation: 0,
          leading: customLeading ??
              (showBackButton
                  ? Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: IconButton(
                        icon: Assets.icons.back
                            .svg(color: iconColor ?? primaryColor500),
                        color: iconColor,
                        onPressed: backIconClick ??
                            () {
                              Get.back();
                            },
                      ),
                    )
                  : const SizedBox.shrink()),
          backgroundColor:
              isTransparent ?? false ? Colors.transparent : Colors.white,
          title: titleWidget ??
              GSText.headingSevenMedium(
                titleText,
              ),
        );

  factory GSAppBar.emptyLabel() => GSAppBar(titleText: "");
}
