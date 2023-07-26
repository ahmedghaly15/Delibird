import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/global/app_text_styles.dart';
import '../views/manager/get_help_cubit.dart';

class HelpDataItem extends StatelessWidget {
  const HelpDataItem({
    super.key,
    required this.cubit,
    required this.index,
  });

  final GetHelpCubit cubit;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: const Offset(2, 2),
                color: AppColors.kShadowColor,
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
          child: ScrollOnExpand(
            scrollOnExpand: true,
            scrollOnCollapse: true,
            child: ExpandablePanel(
              theme: const ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.center,
                tapBodyToCollapse: true,
                iconSize: 30,
                iconColor: Color(0xFF464646),
              ),
              header: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  cubit.getHelpModel!.help[index].question!,
                  style: AppTextStyles.helpHeader,
                ),
              ),
              collapsed: Container(),
              expanded: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 10,
                ),
                child: Text(
                  cubit.getHelpModel!.help[index].answer!,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                  style: AppTextStyles.helpHeader.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
