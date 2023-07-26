import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/global/app_text_styles.dart';
import '../../../../core/utils/helper.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    Key? key,
    required this.phoneController,
    required this.phonePassFocusNode,
    required this.onSelect,
    required this.selectedCountry,
    this.onSubmit,
  }) : super(key: key);

  final TextEditingController phoneController;
  final FocusNode phonePassFocusNode;
  final void Function(Country) onSelect;
  final Country selectedCountry;
  final void Function(String)? onSubmit;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hint: "Enter your Phone Number",
      controller: phoneController,
      focusNode: phonePassFocusNode,
      textCapitalization: TextCapitalization.none,
      keyboardType: TextInputType.number,
      prefixIcon: Container(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            showCountryPicker(
              onSelect: onSelect,
              context: context,
              countryListTheme: CountryListThemeData(
                flagSize: 25,
                backgroundColor: Colors.white,
                textStyle: AppTextStyles.hintStyle,
                bottomSheetHeight: SizeConfig.screenHeight! * 0.7,
                inputDecoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColors.kPrimaryColor,
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.kPrimaryColor,
                      width: 2,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color(0xFF8C98A8).withOpacity(0.2),
                    ),
                  ),
                ),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
              style: AppTextStyles.hintStyle,
            ),
          ),
        ),
      ),
      validating: (String? value) {
        Helper.validatingPhoneField(value, context);
        return null;
      },
      onSubmit: onSubmit,
    );
  }
}
