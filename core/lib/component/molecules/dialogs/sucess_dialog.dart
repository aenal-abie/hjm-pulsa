import 'package:core/component/atoms/buttons/index.dart';
import 'package:core/component/atoms/fields/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GSSuccessDialog extends StatelessWidget {
  final String? textMessage;
  final Function? submit;
  final String? cancelText;

  const GSSuccessDialog(
      {Key? key, this.submit, this.textMessage, this.cancelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          SvgPicture.asset("assets/icons/success.svg"),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GSText.headingSeven(
              textMessage,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.05),
                  offset: Offset(0, -1),
                  blurRadius: 2,
                ),
              ],
            ),
            child: confirmButton(context),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget confirmButton(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SizedBox(
          width: 100,
          child: GSPrimaryButton(
            buttonSize: ButtonSize.small,
            onPress: submit as Function(),
            text: "OK",
          ),
        ));
  }
}
