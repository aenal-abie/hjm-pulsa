import 'package:core/component/styles/colors.dart';
import 'package:core/component/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../fields/text.dart';

class GSBottomNavigationBar extends StatelessWidget {
  const GSBottomNavigationBar(
      {Key? key, this.text, this.enable, this.loading, this.onTap})
      : super(key: key);
  final bool? enable;
  final bool? loading;
  final String? text;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: enable ?? false ? primaryColor500 : primaryColor200,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            loading ?? false
                ? const SpinKitCircle(
                    color: Colors.white,
                    size: 20.0,
                  )
                : const SizedBox(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GSText(
                text ?? "Selanjutnya",
                style: bodyStyle.copyWith(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
