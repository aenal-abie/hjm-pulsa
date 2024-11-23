import 'package:core/component/styles/colors.dart';
import 'package:core/component/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../atoms/fields/text.dart';

class GSCsConfirmHelp extends StatelessWidget {
  const GSCsConfirmHelp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GSText("Geser untuk mengkonfirmasi",
            textAlign: TextAlign.left,
            style: bodyStyle.copyWith(
              color: neutralColor500,
            )),
        InkWell(
          onTap: () async {
            var urlWA = "whatsapp://send?phone=+6282160062022"
                "&text=${Uri.encodeComponent("Hallo Tim GetSurvey. Mohon informasi mengenai GetSurvey")}";

            // var urlWA =
            //     "https://wa.me/+6282160062022?text=Hallo Tim GetSurvey. Mohon informasi mengenai GetSurvey";
            launch(urlWA);
          },
          child: GSText(
            "Butuh bantuan?",
            textAlign: TextAlign.left,
            style: bodyStyle.copyWith(color: primaryColor500),
          ),
        )
      ],
    );
  }
}
