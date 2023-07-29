import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexo_app/features/home/presentation/widgets/home_view_body.dart';

import '../../../../core/utils/helper.dart';
import '../../../layout/presentation/views/manager/delibird_app_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DelibirdAppCubit, DelibirdAppStates>(
      builder: (context, state) {
        DelibirdAppCubit cubit = DelibirdAppCubit.getObject(context);
        return Scaffold(
          body: GestureDetector(
            onTap: () => Helper.unFocus(context),
            child: HomeViewBody(
              cubit: cubit,
              state: state,
            ),
          ),
        );
      },
    );
  }
}
