import 'package:flutter/cupertino.dart';

void precacheImages(BuildContext context) {
  const iconSize = Size(24, 24);
  precacheImage(Image.asset('assets/icons/bottom_field.png').image, context, size: iconSize);
  precacheImage(Image.asset('assets/icons/bottom_meteo.png').image, context, size: iconSize);
  precacheImage(Image.asset('assets/icons/bottom_works.png').image, context, size: iconSize);
  precacheImage(Image.asset('assets/icons/bottom_notes.png').image, context, size: iconSize);
  precacheImage(Image.asset('assets/icons/bottom_profile.png').image, context, size: iconSize);

  precacheImage(Image.asset('assets/icons/bottom_fields_active.png').image, context, size: iconSize);
  precacheImage(Image.asset('assets/icons/bottom_meteo_active.png').image, context, size: iconSize);
  precacheImage(Image.asset('assets/icons/bottom_works_active.png').image, context, size: iconSize);
  precacheImage(Image.asset('assets/icons/bottom_notes_active.png').image, context, size: iconSize);
  precacheImage(Image.asset('assets/icons/bottom_profile_active.png').image, context, size: iconSize);
}