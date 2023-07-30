import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:nexo_app/core/global/app_navigator.dart';
import 'package:nexo_app/core/widgets/custom_button.dart';

import '../../../../core/global/app_text_styles.dart';
import '../../../../core/utils/helper.dart';
import '../../../../core/utils/size_config.dart';
import '../views/manager/get_help_cubit.dart';
import 'help_data_item.dart';

class GetHelpViewBody extends StatelessWidget {
  const GetHelpViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetHelpCubit, GetHelpStates>(
      builder: (context, state) {
        GetHelpCubit cubit = GetHelpCubit.getObject(context);
        return Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
            gradient: Helper.buildCustomLinearGradient(),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: SizeConfig.screenHeight! * 0.09),
              Text(
                "Help",
                style: AppTextStyles.welcomeStyle.copyWith(color: Colors.white),
              ),
              Expanded(
                flex: 12,
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 36),
                  itemCount: cubit.getHelpModel?.help.length ?? 0,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 500),
                      child: SlideAnimation(
                        horizontalOffset: 300,
                        child: FadeInAnimation(
                          child: HelpDataItem(cubit: cubit, index: index),
                        ),
                      ),
                    );
                  },
                ),
              ),
              CustomButton(
                onPressed: () => AppNavigator.getBack(),
                hasIcon: false,
                text: "Continue",
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
        );
      },
    );
  }
}
