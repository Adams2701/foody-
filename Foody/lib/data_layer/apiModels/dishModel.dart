

class DishCategoriesResponse {
  int? status;
  String? message;
  Data? data;

  DishCategoriesResponse({this.status, this.message, this.data});

  DishCategoriesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Categories>? categories;
  List<Populars>? populars;
  List<Specials>? specials;

  Data({this.categories, this.populars, this.specials});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add( Categories.fromJson(v));
      });
    }
    if (json['populars'] != null) {
      populars = <Populars>[];
      json['populars'].forEach((v) {
        populars!.add( Populars.fromJson(v));
      });
    }
    if (json['specials'] != null) {
      specials = <Specials>[];
      json['specials'].forEach((v) {
        specials!.add( Specials.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (populars != null) {
      data['populars'] = populars!.map((v) => v.toJson()).toList();
    }
    if (specials != null) {
      data['specials'] = specials!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String? id;
  String? title;
  String? image;

  Categories({this.id, this.title, this.image});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    return data;
  }
}
class Populars {
  String? id;
  String? name;
  String? description;
  String? image;
  int? calories;

  Populars({this.id, this.name, this.description, this.image, this.calories});

  Populars.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    calories = json['calories'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['calories'] = calories;
    return data;
  }
}
class Specials {
  String? id;
  String? name;
  String? description;
  String? image;
  int? calories;

  Specials({this.id, this.name, this.description, this.image, this.calories});

  Specials.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    calories = json['calories'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['calories'] = calories;
    return data;
  }
}