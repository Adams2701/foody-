import 'package:flutter/material.dart';
import '../data_layer/apiModels/dishModel.dart';

class GridViewBuilder extends StatefulWidget {
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

  final double maxCrossAxisExtent,
      childAspectRatio,
      crossAxisSpacing,
      mainAxisSpacing;
  final Widget rowColum;
  final Function onPress;
  int itemCount;

  @override
  State<GridViewBuilder> createState() => _GridViewBuilderState();
}

class _GridViewBuilderState extends State<GridViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress(),
      child: GridView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: widget.maxCrossAxisExtent,
              childAspectRatio: widget.childAspectRatio,
              crossAxisSpacing: widget.crossAxisSpacing,
              mainAxisSpacing: widget.mainAxisSpacing),
          itemCount: widget.itemCount,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: widget.rowColum);
          }),
    );
  }
}
