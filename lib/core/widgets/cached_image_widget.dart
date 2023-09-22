import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CachedImageWidget extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final double? radius;
  final double? borderRadiusCircular;
  final BorderRadiusGeometry? borderRadius;
  final Alignment alignment;
  final BoxFit fit;
  final Widget? errorWidget;

  const CachedImageWidget(
      {super.key, required this.url,
      this.height,
      this.width,
      this.borderRadius,
      this.errorWidget,
      this.alignment = Alignment.center,
      this.fit = BoxFit.cover,
      this.radius, this.borderRadiusCircular});

  @override
  Widget build(BuildContext context) {
    return radius == null
        ? ClipRRect(
            borderRadius: borderRadius ?? BorderRadius.circular(borderRadiusCircular ?? 0),
            child: Container(
              color: Colors.transparent,
              child: CachedNetworkImage(
                  imageUrl: url,
                  height: height,
                  width: width,
                  alignment: alignment,
                  errorWidget: (context, url, error) => errorWidget ?? Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                        'assets/images/logo.png'),
                  ),
                  fit: fit),
            ),
          )
        : ClipOval(
          child: SizedBox.fromSize(
            size: Size.fromRadius(radius!),
            child: CachedNetworkImage(
              imageUrl: url,
              fit: BoxFit.cover,
              height: height,
              width: width,
              errorWidget: (context, url, error) => errorWidget ?? Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                    'assets/images/logo.png'),
              ),
            ),
          ),
        );
  }
}
