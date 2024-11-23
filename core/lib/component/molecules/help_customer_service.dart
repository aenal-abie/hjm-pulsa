import 'package:core/assets/manager/assets.gen.dart';
import 'package:core/component/atoms/fields/index.dart';
import 'package:core/component/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpCustomerServiceWidget extends StatelessWidget {
  const HelpCustomerServiceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Flexible(
          fit: FlexFit.tight,
          child: Container(
            height: 53,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              color: secondaryColor50,
            ),
            child: InkWell(
              onTap: () {
                var urlWA = "whatsapp://send?phone=+6282160062022"
                    "&text=${Uri.encodeComponent("Hallo Tim GetSurvey. Mohon informasi mengenai GetSurvey")}";

                launch(urlWA);
              },
              child: Stack(
                children: [
                  Positioned(
                      bottom: 0,
                      top: 0,
                      left: 57,
                      child: Assets.home.helpCs.svg()),
                  Positioned(
                      bottom: 0,
                      top: 8,
                      left: 122,
                      child: GSText.bodyMedium(
                        "Butuh Bantuan?\nKami Siap Membantu Anda",
                        color: secondaryColor500,
                      )),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
