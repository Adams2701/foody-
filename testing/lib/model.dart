



class DishCategoriesResponse {
  int status;
  String message;
  List<Category> categories;
  List<Dish> populars;
  List<Dish> specials;

  DishCategoriesResponse({
    required this.status,
    required this.message,
    required this.categories,
    required this.populars,
    required this.specials,
  });

  factory DishCategoriesResponse.fromJson(Map<String, dynamic> json) {
    List<Category> categories = List<Category>.from(
        json['data']['categories'].map((x) => Category.fromJson(x)));
    List<Dish> populars = List<Dish>.from(
        json['data']['populars'].map((x) => Dish.fromJson(x)));
    List<Dish> specials = List<Dish>.from(
        json['data']['specials'].map((x) => Dish.fromJson(x)));

    return DishCategoriesResponse(
      status: json['status'],
      message: json['message'],
      categories: categories,
      populars: populars,
      specials: specials,
    );
  }
}

class Category {
  String id;
  String title;
  String image;

  Category({
    required this.id,
    required this.title,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      title: json['title'],
      image: json['image'],
    );
  }
}

class Dish {
  String id;
  String name;
  String description;
  String image;
  int calories;

  Dish({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.calories,
  });

  factory Dish.fromJson(Map<String, dynamic> json) {
    return Dish(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      calories: json['calories'],
    );
  }
}

//In this implementation, the DishCategoriesResponse class has properties for the
// status, message, categories, populars, and specials fields of the JSON response.
// The Category and Dish classes are used to represent the individual objects within
// the categories, populars, and specials arrays. The fromJson factory method is used
// to create a DishCategoriesResponse object from the JSON data.