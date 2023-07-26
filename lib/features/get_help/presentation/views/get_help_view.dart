import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexo_app/core/utils/service_locator.dart';

import 'package:nexo_app/features/get_help/presentation/widgets/get_help_view_body.dart';

import 'manager/get_help_cubit.dart';

class GetHelpView extends StatelessWidget {
  const GetHelpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator.get<GetHelpCubit>()..getHelpData(),
      child: const Scaffold(
        body: GetHelpViewBody(),
      ),
    );
  }
}
