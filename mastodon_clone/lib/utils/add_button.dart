import 'package:flutter/material.dart';
import 'package:mastodon_clone/icons/iconsax_icons.dart';
import 'package:mastodon_clone/theme/app_colors.dart';

class AddButton extends StatelessWidget {
  const AddButton({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: blueColor
      ),
      child: Icon(Iconsax.add, color: Colors.white),
    );
  }
}