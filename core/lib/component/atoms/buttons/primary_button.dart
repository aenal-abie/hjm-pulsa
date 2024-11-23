import 'package:core/component/atoms/index.dart';
import 'package:core/component/styles/colors.dart';
import 'package:core/component/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GSPrimaryButton extends StatelessWidget {
  final String text;
  final bool active;
  final Color? primaryColor;
  final Color? disabledPrimaryColor;
  final Color? labelColor;
  final String? prefixPathSvgIcon;
  final SvgPicture? prefixWidgetSvgIcon;
  final double? fontSize;
  final double? padding;
  final double? width;
  final Widget? loadingWidget;
  final bool? loading;
  final ButtonSize? buttonSize;

  final VoidCallback? onPress;

  const GSPrimaryButton({
    Key? key,
    required this.text,
    this.active = true,
    this.primaryColor,
    this.disabledPrimaryColor,
    this.prefixPathSvgIcon,
    this.fontSize,
    this.padding,
    this.onPress,
    this.loading,
    this.width,
    this.labelColor,
    this.loadingWidget,
    this.buttonSize,
    this.prefixWidgetSvgIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPress,
        style: ButtonStyle(
          padding: const MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.zero),
          backgroundColor: MaterialStatePropertyAll<Color>(active
              ? (primaryColor ?? primaryColor500)
              : (disabledPrimaryColor ?? primaryColor200)),
          elevation: const MaterialStatePropertyAll<double?>(0),
        ),
        child: SizedBox(
          height: buttonSize?.height ?? ButtonSize.veryBig.height,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(child: SizedBox()),
              loading == true
                  ? const SizedBox.shrink()
                  : prefixWidgetSvgIcon != null
                      ? prefixWidgetSvgIcon!
                      : (prefixPathSvgIcon?.isNotEmpty ?? false)
                          ? Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: SvgPicture.asset(
                                prefixPathSvgIcon ?? "",
                                height: 20,
                                width: 20,
                              ),
                            )
                          : const SizedBox(),
              Row(
                children: [
                  loadingWidget ?? const SizedBox(),
                  (loading ?? false)
                      ? const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: GSThreeBounceLoading(
                              color: optionalColor500, size: 12),
                        )
                      : const SizedBox(),
                  GSText(
                    text,
                    style: bodyStyle.copyWith(
                        color: labelColor ?? optionalColor500),
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
