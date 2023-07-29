import 'package:flutter/material.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class SearchTextFormField extends StatelessWidget {
  const SearchTextFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      height: SizeConfig.screenHeight! * 0.06,
      width: SizeConfig.screenWidth! * 0.8,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 15,
      ),
      boxShadow: BoxShadow(
        offset: const Offset(2, 2),
        color: AppColors.kShadowColor,
        spreadRadius: 3,
        blurRadius: 8,
      ),
      hint: "Search",
      hintStyle: TextStyle(
        fontSize: 17,
        color: AppColors.kShadowColor,
      ),
      suffixIcon: IconButton(
        icon: Icon(
          Icons.search,
          color: AppColors.kShadowColor,
        ),
        onPressed: () {},
      ),
      controller: TextEditingController(),
      textCapitalization: TextCapitalization.none,
      keyboardType: TextInputType.text,
    );
  }
}
