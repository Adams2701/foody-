

class OrderDish {
  final String name;
  final String dishId;

  OrderDish({required this.name, required this.dishId});

  factory OrderDish.fromJson(Map<String, dynamic> json) {
    return OrderDish(
      name: json['name'],
      dishId: json['dishId'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'dishId': dishId,
    };
  }
}


//The fromJson method is useful for creating an instance of OrderDish from JSON
// data received from a server, while the toJson method is useful for converting
// an instance of OrderDish to JSON data before sending it to a server.