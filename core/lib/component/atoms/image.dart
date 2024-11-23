import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/component/atoms/index.dart';
import 'package:core/component/styles/colors.dart';
import 'package:flutter/material.dart';

import '../../assets/manager/assets.gen.dart';

class GSCircleImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? bgColor;
  final bool isProfile;
  final String? char;
  final Color? charColor;

  const GSCircleImage(this.imageUrl,
      {Key? key,
      this.width,
      this.height,
      this.bgColor,
      this.borderRadius,
      this.char,
      this.charColor,
      this.isProfile = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width ?? 42,
      imageUrl: imageUrl ?? "",
      placeholder: (context, url) => SizedBox(
        width: width ?? 42.0,
        height: height ?? 42.0,
        child: Center(
          child: SizedBox(
              width: width ?? 42,
              height: height ?? 42,
              child: GSThreeBounceLoading(
                color: primaryColor200,
                size: (width ?? 42) / 2,
              )),
        ),
      ),
      imageBuilder: (context, imageProvider) => Container(
        width: width ?? 42.0,
        height: height ?? 42.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      errorWidget: (context, url, error) => SizedBox(
          width: width ?? 42.0,
          height: height ?? 42.0,
          child: isProfile
              ? Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Assets.icons.profile.svg())
              : CircleAvatar(
                  backgroundColor: bgColor,
                  child: GSText.headingSevenMedium(
                    char ?? "",
                    color: charColor ?? neutralColor200,
                  ),
                )),
      // cacheManager: _cacheManager,
    );
  }
}
