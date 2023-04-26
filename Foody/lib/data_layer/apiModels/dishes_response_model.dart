
class DishesResponses {
  int? status;
  String? message;
  List<Data2>? data;

  DishesResponses({this.status, this.message, this.data});

  DishesResponses.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data2>[];
      json['data'].forEach((v) {
        data!.add(new Data2.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data2 {
  String? id;
  String? name;
  String? description;
  String? image;
  int? calories;
  String? category;

  Data2(
      {this.id,
        this.name,
        this.description,
        this.image,
        this.calories,
        this.category});

  Data2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    calories = json['calories'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['calories'] = this.calories;
    data['category'] = this.category;
    return data;
  }
}
