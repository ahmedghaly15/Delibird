import 'package:flutter/material.dart';

import '../../../../core/utils/helper.dart';

class AddToCartIconButton extends StatelessWidget {
  const AddToCartIconButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        gradient: Helper.primaryColorLinearGradient(),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
