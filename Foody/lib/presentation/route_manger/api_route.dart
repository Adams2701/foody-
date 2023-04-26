

class Route {
  static const String baseUrl = "https://yummie.glitch.me";
  static const String fetchAllCategories = "/dish-categories";
  static String fetchCategoryDishes(String categoryId) =>
      "/dishes/$categoryId";
  static String placeOrder(String dishId) => "/orders/$dishId";
  static const String fetchOrders = "/orders";
}
