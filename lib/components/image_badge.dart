import 'package:flutter/material.dart';
import 'package:uikit/images/flat_image.dart';
import 'package:uikit/text/flat_text.dart';
import 'package:uikit/utils/colors.dart';
import 'package:uikit/utils/screen_size.dart';
import 'package:uikit/utils/settings.dart';

/// An image badge ui component that shows image with text in the header section.
/// Image icon is assumed to be square thats why only height.
class ImageBadge extends StatelessWidget {
  final double imageHeight;
  final String imageName;
  final String value;
  final Color valueColor;
  final double valueSize;
  const ImageBadge({
    Key? key,
    required this.imageName,
    required this.value,
    this.imageHeight = 30,
    this.valueSize = baseFontSizeSmall,
    this.valueColor = colorWhite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double padding = ScreenSize.isTablet() ? tabletScaleFactor * 3 : 3;
    double borderRadius = ScreenSize.isTablet() ? tabletScaleFactor * 5 : 5;
    double minWidth = ScreenSize.isTablet() ? tabletScaleFactor * 70 : 70;
    double sizedBoxHeight =
        ScreenSize.isTablet() ? tabletScaleFactor * imageHeight : imageHeight;
    return SizedBox(
      height: sizedBoxHeight,
      child: Stack(children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Container(
            constraints: BoxConstraints(minWidth: minWidth),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [colorDark, colorDarkTranslucent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.1],
                tileMode: TileMode.clamp,
              ),
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            ),
            padding: EdgeInsets.fromLTRB(
                sizedBoxHeight + padding, padding, padding * 2, padding),
            child: FlatText(
              value,
              size: valueSize,
              color: valueColor,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.end,
            ),
          ),
        ),
        FlatImage(
          name: imageName,
          width: imageHeight,
          height: imageHeight,
        ),
      ]),
    );
  }
}
