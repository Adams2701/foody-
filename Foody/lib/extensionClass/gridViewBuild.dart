import 'package:flutter/material.dart';
import '../models/categoriesHomeModel.dart';

class GridViewBuilder extends StatelessWidget {
  GridViewBuilder({
    Key? key,
    required this.maxCrossAxisExtent,
    required this.childAspectRatio,
    required this.crossAxisSpacing,
    required this.mainAxisSpacing,
    required this.rowColum,
    required this.onPress,
    required this.itemCount,
  }) : super(key: key);

  // final foodCategoriesData = foodyCategories[index];
  final double maxCrossAxisExtent,
      childAspectRatio,
      crossAxisSpacing,
      mainAxisSpacing;
  final Widget rowColum;
  final Function onPress;
  int itemCount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress(),
      child: GridView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: maxCrossAxisExtent,
              childAspectRatio: childAspectRatio,
              crossAxisSpacing: crossAxisSpacing,
              mainAxisSpacing: mainAxisSpacing),
          itemCount: itemCount,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: rowColum);
          }),
    );
  }
}
