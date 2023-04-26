import 'package:flutter/material.dart';
import 'package:foody/constants/constants.dart';
import 'package:foody/data_layer/apiModels/dishModel.dart';
import 'package:foody/presentation/dishDetails/dishDetails.dart';

class PopularHome extends StatelessWidget {
  final List<Populars> popularDish;

  const PopularHome({Key? key, required this.popularDish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KSizedBoxH10,
          const Text(
            'Popular Dishes',
            style: KTextStyle17,
          ),
          KSizedBoxH10,
          SizedBox(
            height: 200,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              gridDelegate:
              const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 500,
                  childAspectRatio: 5 / 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: popularDish.length,
              itemBuilder: (BuildContext ctx, index) {
                Populars popular = popularDish[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder:
                        (context) =>
                          DishDetails(
                            dishId: popular.id!,
                            image: popular.image.toString(),
                            dishesName: popular.name.toString(),
                            dishDescription: popular.description.toString(),
                            calories: popular.calories.toString(),
                          ),
                        ),);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          popular.name.toString(),
                          style: KTextStyle13,
                        ),
                        SizedBox(
                          width: 150,
                          height: 110,
                          child: Image.network(
                            popular.image = popular.image ?? "https://th.bing.com/th/id/OIP.1gj6qiafv0QzHk1JPev_MgHaFN?pid=ImgDet&rs=1",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${popular.calories} calories",
                              style: KTextStyle13,
                            ),
                            Text(
                              popular.description.toString(),
                              style: KTextStyle13,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
