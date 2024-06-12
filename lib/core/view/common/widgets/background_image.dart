import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key, required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {


    return Stack(
      children: [
        SvgPicture.asset(
        "image/background.svg",
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        ),
        child
      ],
    );


  }
}
