import 'package:flutter/material.dart';
import 'package:pulsa/core/presentation/atoms/style/colors.dart';

import '../../../../core/presentation/atoms/text/p_text.dart';
import '../../../../core/presentation/atoms/utils/copy.dart';

class PlnToken extends StatelessWidget {
  final String textToCopy;

  const PlnToken({super.key, required this.textToCopy});

  @override
  Widget build(BuildContext context) {
    if (textToCopy.isEmpty) return SizedBox.shrink();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            PText.body1Bold('Token'),
            Expanded(child: SizedBox(width: 8)),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    color: natural[100],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: PText.heading4Bold(
                      formatText(textToCopy),
                      textAlign: TextAlign.center,
                      color: bluePothan[700],
                    ),
                  )),
            ),
            IconButton(
              icon: Icon(Icons.copy),
              onPressed: () => copyToClipboard(context, textToCopy),
            ),
          ],
        ),
      ],
    );
  }
}
