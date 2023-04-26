import 'package:flutter/material.dart';
import 'package:foody/constants/constants.dart';
import 'package:foody/data_layer/apiModels/dishModel.dart';
import 'package:foody/presentation/dishDetails/dishDetails.dart';

class SpecialHome extends StatelessWidget {
  final List<Specials> specialDish;
  const SpecialHome({Key? key, required this.specialDish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KSizedBoxH10,
          const Text(
            'Food Special',
            style: KTextStyle17,
            // textAlign: TextAlign.left,
          ),
          KSizedBoxH10,
          SizedBox(
            height: 100,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 600,
                  childAspectRatio: 2 / 6,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: specialDish.length,
              itemBuilder: (BuildContext ctx, index) {
                Specials special = specialDish[index];
                return GestureDetector(
                  onTap:() {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          DishDetails(
                              dishesName: special.name.toString(),
                              dishDescription: special.description.toString(),
                              calories: "${special.calories} Calories",
                              image: special.image.toString(),
                            dishId: special.id!,),
                    ),);
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                              height: 50,
                              width: 50,
                              child: Image.network(special.image ?? "N/A")),
                          KSizedBoxH10,
                          Column(
                            children: [
                              SizedBox(
                                width: 200,
                                height: 20,
                                child: Text(
                                  special.description.toString(),
                                  style: KTextStyle13,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              KSizedBox5,
                              Text(
                                special.name.toString(),
                                style: KTextStyle13,
                              ),
                              KSizedBox5,
                              Text(
                                special.calories.toString(),
                                style: KTextStyle13,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  });
              },
            ),
          ),
        ],
      ),
    );
  }
}
