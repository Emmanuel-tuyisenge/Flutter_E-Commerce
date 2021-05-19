import 'package:flutter/material.dart';
import '/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Wilder Shop App".text.xl5.bold.color(context.theme.accentColor).make(),
        "Current trend".text.xl2.make(),
      ],
    );
  }
}
