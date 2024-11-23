import 'package:core/component/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../styles/style.dart';
import '../fields/text.dart';
import '../loading.dart';
import 'button_size.dart';
import 'index.dart';

class GSOutlinedButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? borderSideColor;
  final Color? textColor;
  final String? prefixPathSvgIcon;
  final String? assetPackage;
  final double? fontSize;
  final double? padding;
  final bool? loading;
  final double? width;
  final ButtonSize? buttonSize;

  final VoidCallback? onPress;

  const GSOutlinedButton(
      {Key? key,
      required this.text,
      this.backgroundColor,
      this.borderSideColor,
      this.prefixPathSvgIcon,
      this.fontSize,
      this.loading,
      this.padding,
      this.onPress,
      this.textColor,
      this.buttonSize,
      this.width,
      this.assetPackage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: OutlinedButton(
        onPressed: onPress,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: padding ?? 0),
          backgroundColor: optionalColor500,
          side:
              BorderSide(width: 1.0, color: borderSideColor ?? primaryColor500),
        ),
        child: SizedBox(
          height: buttonSize?.height ?? ButtonSize.veryBig.height,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(child: SizedBox()),
              (prefixPathSvgIcon?.isNotEmpty ?? false)
                  ? Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: SvgPicture.asset(
                        prefixPathSvgIcon ?? "",
                        height: 20,
                        width: 20,
                        package: assetPackage,
                      ),
                    )
                  : const SizedBox(),
              Row(
                children: [
                  (loading ?? false)
                      ? Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: GSThreeBounceLoading(
                              color: borderSideColor ?? errorColor500,
                              size: 10),
                        )
                      : const SizedBox(),
                  GSText(
                    text,
                    style: bodyStyle.copyWith(
                      color: textColor ?? borderSideColor ?? primaryColor500,
                      fontSize: fontSize,
                    ),
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
