import 'dart:convert';
import 'package:flutter/material.dart';
import 'foodModel.dart';
import 'networkHelper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
List<DishCategory> dishCategories = [];

  @override
  void initState() {
    _getCategoriesData();
    super.initState();
  }

  _getCategoriesData() {
    CallApi callApi = CallApi();
    callApi.getCategories('dish-categories').then((response) {
      Iterable foodResponse = json.decode(response.body);
      dishCategories = foodResponse.map((map) => DishCategory.fromJson(map)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API TEST'),
      ),
      body: Container(
        child: Column(
          children: [
            FutureBuilder<DishCategory>(
              future: _getCategoriesData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.data.categories.length,
                      itemBuilder: (context, index) {
                        var dishcategoryData = snapshot.data!.data.categories[index];
                        return Container(
                          height: 100,
                          margin: const EdgeInsets.all(8),
                          child: Row(
                            children: <Widget>[
                              Card(
                                clipBehavior: Clip.antiAlias,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: AspectRatio(
                                    aspectRatio: 1,
                                    child: Image.network(
                                      dishcategoryData.image[index],
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              SizedBox(width: 16),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      dishcategoryData.title,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                } else
                  return Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }
}
