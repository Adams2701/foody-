import 'package:flutter/material.dart';
import 'package:foody/models/onboardData.dart';

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    Key? key, required this.onboardData,
  }) : super(key: key);
  final OnboardData onboardData;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Image.asset(onboardData.image, height: 400),
        const Spacer(),
        Text(onboardData.title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 20),
        Text(onboardData.description, textAlign: TextAlign.center),
        const Spacer(),
      ],
    );
  }
}
