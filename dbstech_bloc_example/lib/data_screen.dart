import 'package:dbstech_bloc_example/user_model.dart';
import 'package:flutter/material.dart';


class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.e}) : super(key: key);
  final UserModel e;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body:Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Center(
                  child: CircleAvatar(
                    maxRadius: 60,
                    backgroundImage: NetworkImage(e.avatar),
                  ),
                ),
                Text(
                  e.firstname + " " + e.lastname,
                ),
                Text(e.email),
              ],
            ),
          ),
        )
    );
  }
}