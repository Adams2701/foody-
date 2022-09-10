
class OnboardData {
  final String image, title, description;

  OnboardData(
      {required this.image, required this.title, required this.description});
}

final List<OnboardData> onboard_list = [
  OnboardData(
      image: "images/slide2.png",
      title: "Delicious Dishes",
      description: "Experience a variety of amazing dishes"
          "from different cultures around the world."),
  OnboardData(
      image: "images/slide1.png",
      title: "WorldClass Chefs",
      description: "Our dishes are prepared by only the best."),
  OnboardData(
      image: "images/slide3.png",
      title: "Instant World-Wide Delivery",
      description: "Your orders will be delivered instantly irrespective "
          "of your location around the world."),
];
