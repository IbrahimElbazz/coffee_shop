import 'package:coffee_shop/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PassContainer extends StatefulWidget {
  const PassContainer({super.key});

  @override
  State<PassContainer> createState() => _PassContainerState();
}

class _PassContainerState extends State<PassContainer> {
  bool obsecure = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      obsecure: obsecure,
      hint: 'Type your password',
      icon: IconButton(
        onPressed: () {
          setState(() {
            obsecure = !obsecure;
          });
        },

        icon:
            obsecure
                ? SvgPicture.asset('assets/icons/eyeHide.svg')
                : SvgPicture.asset('assets/icons/eye.svg'),
      ),
    );
  }
}
