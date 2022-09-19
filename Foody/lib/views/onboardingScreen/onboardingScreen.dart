import 'package:flutter/material.dart';
import 'package:foody/controllers/dotIndicator/dotIndicator.dart';
import 'package:foody/controllers/onboardContent/onboardContent.dart';
import 'package:foody/models/onboardData.dart';
import 'package:foody/views/home/foodyHomeScreen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  static const String id = 'onBoardingScreen';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: onboard_list.length,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemBuilder: (context, index) => OnboardContent(
                  onboardData: onboard_list[index],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboard_list.length,
                (index) => Container(
                    height: 10,
                    width: 10,
                    margin: const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: DotIndicator(isActive: index == _pageIndex)),
              ),
            ),
            const SizedBox(height: 20),
            ConstrainedBox(
              constraints:
                  const BoxConstraints.tightFor(height: 40, width: 150),
              child: ElevatedButton(
                onPressed: () {
                  if (_pageIndex == onboard_list.length - 1) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (index) => const HomeScreen(),
                      ),
                    );
                  }
                  _pageController.nextPage(
                      duration: const Duration(microseconds: 300),
                      curve: Curves.ease);
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.only(left: 5, right: 5)),
                  backgroundColor: MaterialStateProperty.all(Colors.black54),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: Text(_pageIndex == onboard_list.length - 1
                    ? "GET STARTED"
                    : "NEXT"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
