import 'package:flutter/cupertino.dart';

void precacheImages(BuildContext context) {
  const iconSize = Size(24, 24);
  precacheImage(Image.asset('assets/icons/Home.png').image, context, size: iconSize);
  precacheImage(Image.asset('assets/icons/Tax.png').image, context, size: iconSize);
  precacheImage(Image.asset('assets/icons/Help.png').image, context, size: iconSize);
  precacheImage(Image.asset('assets/icons/Profile.png').image, context, size: iconSize);

  precacheImage(Image.asset('assets/icons/Home_Active.png').image, context, size: iconSize);
  precacheImage(Image.asset('assets/icons/Tax_Active.png').image, context, size: iconSize);
  precacheImage(Image.asset('assets/icons/Help_Active.png').image, context, size: iconSize);
  precacheImage(Image.asset('assets/icons/Profile_Active.png').image, context, size: iconSize);
}