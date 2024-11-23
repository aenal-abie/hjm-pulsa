import 'package:core/component/atoms/gap.dart';
import 'package:core/component/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../assets/manager/assets.gen.dart';
import '../../atoms/fields/text.dart';

void gsBottomSheet(Widget body,
    {required String title,
    bool showDivider = false,
    VoidCallback? barrierDismiss,
    double? horizontalPadding}) {
  Get.dialog(
    _BottomSheetDialog(
      body: body,
      title: title,
      showDivider: showDivider,
      barrierDismiss: barrierDismiss,
      horizontalPadding: horizontalPadding,
    ),
    useSafeArea: false,
    barrierColor: Colors.transparent,
  );
}

class _BottomSheetDialog extends StatelessWidget {
  const _BottomSheetDialog(
      {Key? key,
      required this.body,
      required this.title,
      required this.barrierDismiss,
      required this.horizontalPadding,
      required this.showDivider})
      : super(key: key);
  final Widget body;
  final String title;
  final bool showDivider;
  final VoidCallback? barrierDismiss;
  final double? horizontalPadding;

  @override
  Widget build(BuildContext context) {
    var padding = horizontalPadding != null
        ? const EdgeInsets.symmetric(horizontal: 20)
        : const EdgeInsets.only();
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          _TransparentSpace(barrierDismiss: barrierDismiss),
          Container(
            color: Colors.white,
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: horizontalPadding ?? 20.0),
              child: Column(
                children: [
                  if (showDivider)
                    Padding(
                      padding: padding,
                      child: _Divider(
                        title: title,
                      ),
                    )
                  // const GSGap(10),
                  else
                    Padding(
                      padding: padding,
                      child: _Title(
                        title: title,
                        showDivider: showDivider,
                      ),
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  body
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GSGap(40),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                height: 4,
                width: 42,
                decoration: BoxDecoration(
                    color: neutralColor200,
                    borderRadius: BorderRadius.circular(2)),
              ),
            ),
            const GSGap(10),
            GSText.headingSevenMedium(
              title,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.fromLTRB(14, 14, 0, 14),
              child: Assets.icons.closeNormal.svg(),
            ))
      ],
    );
  }
}

class _TransparentSpace extends StatelessWidget {
  const _TransparentSpace({required this.barrierDismiss});

  final VoidCallback? barrierDismiss;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          if (barrierDismiss == null) {
            Get.back();
          } else {
            barrierDismiss;
          }
        },
        child: Container(
          color: Colors.black.withOpacity(.5),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    required this.title,
    this.showDivider = false,
  });

  final String title;
  final bool? showDivider;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: GSText.headingSevenMedium(
                title,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          showDivider == false
              ? Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        padding: const EdgeInsets.fromLTRB(14, 14, 0, 14),
                        child: Assets.icons.closeNormal.svg(),
                      )),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
