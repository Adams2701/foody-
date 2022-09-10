
import 'dart:convert';

class ArticleInfo{
  int id=0;
  String article_content="";
  String title="";
  String description="";
  String img="";
  ArticleInfo(String img,int id,
      String article_content, String title,
      String description, String created_at, String author){
    this.id=id;
    this.article_content=article_content;
    this.description=description;
    this.title=title;
    this.img=img;
  }
  ArticleInfo.fromJson(Map json)
      :id=json['id'],
        article_content=json['article_content'],
        description=json['description'],
        title=json['title'],
        img=json['img'];
}

DishCategory dishCategoryFromJson(String str) => DishCategory.fromJson(json.decode(str));

String dishCategoryToJson(DishCategory data) => json.encode(data.toJson());

class DishCategory {
  DishCategory({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  Data data;

  factory DishCategory.fromJson(Map<String, dynamic> json) => DishCategory(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.categories,
    required this.populars,
    required this.specials,
  });

  List<Category> categories;
  List<Popular> populars;
  List<Popular> specials;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    populars: List<Popular>.from(json["populars"].map((x) => Popular.fromJson(x))),
    specials: List<Popular>.from(json["specials"].map((x) => Popular.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "populars": List<dynamic>.from(populars.map((x) => x.toJson())),
    "specials": List<dynamic>.from(specials.map((x) => x.toJson())),
  };
}

class Category {
  Category({
    required this.id,
    required this.title,
    required this.image,
  });

  String id;
  String title;
  String image;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    title: json["title"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
  };
}

class Popular {
  Popular({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.calories,
  });

  String id;
  String name;
  String description;
  String image;
  int calories;

  factory Popular.fromJson(Map<String, dynamic> json) => Popular(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
    calories: json["calories"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "image": image,
    "calories": calories,
  };
}


