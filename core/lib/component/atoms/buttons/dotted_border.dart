import 'package:core/component/atoms/index.dart';
import 'package:core/component/styles/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../assets/manager/assets.gen.dart';
import '../fields/text.dart';

class GSButtonDottedBorder extends StatelessWidget {
  final String text;
  final double? width;
  final double? iconLeftPadding;
  final bool? centered;
  final Widget? prefixIcon;
  final VoidCallback? onTap;
  final bool loading;

  const GSButtonDottedBorder(
      {Key? key,
      required this.text,
      this.width,
      this.iconLeftPadding,
      this.prefixIcon,
      this.centered = false,
      this.onTap,
      this.loading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 200,
      child: InkWell(
        onTap: onTap,
        child: DottedBorder(
          color: const Color(0xffA3A3A3),
          borderType: BorderType.RRect,
          radius: const Radius.circular(5),
          dashPattern: const <double>[3, 3],
          child: SizedBox(
            height: 51,
            child: loading
                ? const Center(child: GSThreeBounceLoading())
                : ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: Row(
                      mainAxisAlignment: centered == true
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.start,
                      children: [
                        GSGap(
                          iconLeftPadding ?? 25,
                        ),
                        prefixIcon ?? Assets.icons.up.svg(),
                        const SizedBox(
                          width: 10,
                        ),
                        GSText.body(
                          text,
                          overflow: TextOverflow.ellipsis,
                          color: neutralColor200,
                        ),
                        if (centered == false)
                          const Expanded(child: SizedBox()),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
