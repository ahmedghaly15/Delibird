import 'package:flutter/material.dart';
import 'package:nexo_app/core/widgets/custom_text_form_field.dart';

import '../../../../core/utils/size_config.dart';

class VerifyBox extends StatelessWidget {
  const VerifyBox({
    Key? key,
    required this.controller,
    this.onSubmit,
    this.onChanged,
  }) : super(key: key);

  final TextEditingController controller;

  final void Function(String)? onChanged;

  final void Function(String)? onSubmit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight! * 0.09,
      width: SizeConfig.screenWidth! * 0.18,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(2, 5),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: CustomTextFormField(
        hint: "",
        controller: controller,
        textCapitalization: TextCapitalization.none,
        keyboardType: TextInputType.phone,
        onSubmit: onSubmit,
        onChanged: onChanged,
      ),
    );
  }
}
