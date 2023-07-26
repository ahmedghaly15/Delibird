import 'package:flutter/material.dart';
import 'package:nexo_app/features/layout/presentation/widgets/layout_view_body.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LayoutViewBody(),
    );
  }
}
