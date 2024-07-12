
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskmanagment/core/common/snackbar_content_type.dart';
import 'dart:ui' as ui;

import '../../utils/constans/string.dart';

class CustomSnackbar extends StatelessWidget {

  /// title is the header String that will show on top
  final String title;

  /// message String is the body message which shows only 2 lines at max
  final String message;

  /// `optional` color of the SnackBar/MaterialBanner body
  final Color? color;

  /// contentType will reflect the overall theme of SnackBar/MaterialBanner: failure, success, help, warning
  final SnackBarContentType contentType;

  const CustomSnackbar({
    super.key,
    this.color,
    required this.title,
    required this.message,
    required this.contentType,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // screen dimensions
    bool isMobile = size.width <= 768;

    /// for reflecting different color shades in the SnackBar
    final hsl = HSLColor.fromColor(color ?? contentType.color!);
    final hslDark = hsl.withLightness((hsl.lightness - 0.1).clamp(0.0, 1.0));

    double horizontalPadding = 0.0;
    double leftSpace = size.width * 0.12;
    double rightSpace = size.width * 0.12;

    if (isMobile) {
      horizontalPadding = size.width * 0.01;
    } else {
      leftSpace = size.width * 0.05;
      horizontalPadding = size.width * 0.2;
    }

    return Container(
      color: Colors.transparent,
      margin: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
      ),
      height: size.height * 0.125,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          /// background container
          Container(
            width: size.width,
            decoration: BoxDecoration(
              color: color ?? contentType.color,
              borderRadius: BorderRadius.circular(20),
            ),
          ),

          /// Splash SVG asset
          Positioned(
            bottom: 0,
            left: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
              ),
              child: SvgPicture.asset(
                AssetsPath.bubbles,
                height: size.height * 0.06,
                width: size.width * 0.05,
                colorFilter:
                _getColorFilter(hslDark.toColor(), ui.BlendMode.srcIn),
              ),
            ),
          ),

          // Bubble Icon
          Positioned(
            top: -size.height * 0.02,
            left: leftSpace -
                8 -
                (isMobile ? size.width * 0.075 : size.width * 0.035),
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  AssetsPath.back,
                  height: size.height * 0.06,
                  colorFilter:
                  _getColorFilter(hslDark.toColor(), ui.BlendMode.srcIn),

                ),
                Positioned(
                  top: size.height * 0.015,
                  child: SvgPicture.asset(
                    assetSVG(contentType),
                    height: size.height * 0.022,

                  ),
                )
              ],
            ),
          ),

          /// content
          Positioned.fill(
            left: leftSpace,
            right: size.width * 0.03,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// `title` parameter
                    Expanded(
                      flex: 3,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: size.height * 0.03,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      },
                      child: SvgPicture.asset(
                        AssetsPath.failure,
                        height: size.height * 0.022,

                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.005,
                ),

                /// `message` body text parameter
                Expanded(
                  child: Text(
                    message,
                    style: TextStyle(
                      fontSize: size.height * 0.016,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Reflecting proper icon based on the contentType
  String assetSVG(SnackBarContentType contentType) {
    switch (contentType) {
      case SnackBarContentType.failure:

      /// failure will show `CROSS`
        return AssetsPath.failure;
      case SnackBarContentType.success:

      /// success will show `CHECK`
        return AssetsPath.success;
      case SnackBarContentType.warning:

      /// warning will show `EXCLAMATION`
        return AssetsPath.warning;
      case SnackBarContentType.help:

      /// help will show `QUESTION MARK`
        return AssetsPath.help;
      default:
        return AssetsPath.failure;
    }
  }

  static ColorFilter? _getColorFilter(
      ui.Color? color, ui.BlendMode colorBlendMode) =>
      color == null ? null : ui.ColorFilter.mode(color, colorBlendMode);
}
