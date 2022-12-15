import 'package:flutter/material.dart';
import 'package:pet_app/view/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/onboarding_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final ValueNotifier<bool> _lastPage = ValueNotifier<bool>(false);
  final ValueNotifier<int> _index = ValueNotifier<int>(0);

  final pageViewController = PageController();

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (value) {
          _index.value = value;
          if (_index.value == 2) {
            _lastPage.value = true;
          } else {
            _lastPage.value = false;
          }
        },
        controller: pageViewController,
        children: const [
          Padding(
            padding: EdgeInsets.all(50),
            child: BuildOnboarding(
              image: 'assets/splash_img/splash-img1.png',
            ),
          ),
          Padding(
            padding: EdgeInsets.all(50),
            child: BuildOnboarding(
              image: 'assets/splash_img/splash-img2.png',
            ),
          ),
          Padding(
            padding: EdgeInsets.all(50),
            child: BuildOnboarding(
              image: 'assets/splash_img/splash-img3.png',
            ),
          ),
        ],
      ),
      bottomSheet: ValueListenableBuilder(
        valueListenable: _lastPage,
        builder: (context, value, child) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: value
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: SizedBox(
                        width: 200,
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, LoginScreen.routeName);
                          },
                          child: const Text('Get Started'),
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 80,
                      child: SmoothPageIndicator(
                        controller: pageViewController,
                        count: 3,
                        effect: const WormEffect(
                          activeDotColor: Color(0xFFFD9340),
                          spacing: 20,
                          dotWidth: 10,
                          dotHeight: 10,
                        ),
                        onDotClicked: (index) =>
                            pageViewController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.easeIn,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
