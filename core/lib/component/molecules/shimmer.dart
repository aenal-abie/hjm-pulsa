import 'package:core/component/atoms/gap.dart';
import 'package:core/component/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GSShimmer extends StatelessWidget {
  const GSShimmer({Key? key, this.height, this.numberLines}) : super(key: key);

  final double? height;
  final int? numberLines;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[700]!,
      highlightColor: Colors.grey[200]!,
      child: Container(
        height: height ?? 90,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                  color: neutralColor50.withOpacity(0.1),
                  blurRadius: 0.5,
                  offset: const Offset(0, 1))
            ]),
        child: Column(
          children: [
            const GSGap(10),
            ...List.generate(
                numberLines ?? 1,
                (_) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            color: neutralColor50.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16.0),
                            boxShadow: [
                              BoxShadow(
                                  color: neutralColor50.withOpacity(0.1),
                                  blurRadius: 0.5,
                                  offset: const Offset(0, 1))
                            ]),
                        height: 10,
                      ),
                    )),
          ],
        ),
      ),
    );
  }
}
