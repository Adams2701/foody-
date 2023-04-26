import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/bloc/order_bloc/order_bloc.dart';
import 'package:foody/bloc/order_bloc/order_state.dart';
import 'package:foody/constants/constants.dart';
import 'package:foody/networking/networkService.dart';

import '../../bloc/order_bloc/order_event.dart';

class DishDetails extends StatelessWidget {
  final String dishesName;
  final String dishDescription;
  final String calories;
  final String image;
  final String dishId;

  const DishDetails(
      {super.key,
      required this.dishesName,
      required this.dishDescription,
      required this.calories,
      required this.image,
      required this.dishId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            dishesName.toString(),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.network(
                  image,
                ),
                KSizedBoxH10,
                Row(
                  children: [
                    Text(
                      dishesName.toString(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      "$calories Calories",
                      style: const TextStyle(color: Colors.redAccent),
                    ),
                  ],
                ),
                KSizedBoxH10,
                ConstrainedBox(
                  constraints:
                      const BoxConstraints(minHeight: 0.0, minWidth: 0.0),
                  child: Text(dishDescription.toString(),
                      textAlign: TextAlign.start),
                ),
                KSizedBoxH10,
                 TextField(
                  decoration: const InputDecoration(
                    labelText: "Name Field",
                    hintText: "Name Field",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (nameInput){
                    context.read<OrderBloc>().add(NameChangedEvent(name: nameInput));
                  },
                ),
                KSizedBoxH10,
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      )),
                  child: SizedBox(
                    height: 50,
                    width: 200,
                    child:  BlocBuilder<OrderBloc, OrderState>(
                      builder: (BuildContext context, state) {
                        return TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.black,
                              textStyle: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              state is NameValidated ? showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Confirm Order"),
                                    content: const Text(
                                        "Are you sure you want to place the order?"),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text("Cancel"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: const Text("Confirm Order"),
                                        onPressed: () {
                                          context.read<OrderBloc>().add(
                                              LoadOrderEvent(
                                                  dishId: dishId, name: dishesName));
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ) : null;
                            },
                            child:  Center(
                              child: state is OrderLoading ?  const SizedBox(
                                height: 15,
                                width: 15,
                                child: CircularProgressIndicator(
                                  strokeWidth: 3,
                                  value: 3,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                                )): const Text(
                                "Place Order",
                              ),
                            ),
                          );

                      }),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
