import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/convert.dart';


double convertToRating(double number) {
  final hasDecimal = number % 1 != 0.0;
  int integerPart = number.floor();
  return convertToDouble(hasDecimal ? (integerPart + 0.5) : number);
}

class GSRatingBar extends StatelessWidget {
  const GSRatingBar(
      {Key? key,
      this.function,
      this.initialRating,
      this.ignoreGestures,
      this.itemSize,
      this.itemPadding,
      this.allowHalfRating})
      : super(key: key);
  final Function(double value)? function;
  final double? initialRating;
  final bool? ignoreGestures;
  final double? itemSize;
  final double? itemPadding;
  final bool? allowHalfRating;

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: initialRating ?? 0,
      direction: Axis.horizontal,
      allowHalfRating: allowHalfRating ?? false,
      itemCount: 5,
      glow: false,
      itemSize: itemSize ?? 25,
      ignoreGestures: ignoreGestures ?? false,
      ratingWidget: RatingWidget(
        full: SvgPicture.asset("assets/rating_full.svg"),
        empty: SvgPicture.asset("assets/rating_empty.svg"),
        half: SvgPicture.asset("assets/rating_half.svg"),
      ),
      itemPadding: EdgeInsets.symmetric(horizontal: itemPadding ?? 5.0),
      onRatingUpdate: function ?? (double value) {},
    );
  }
}
