
import 'package:exam_4/core/injector/injector.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../assets/color.dart';
import '../../assets/image.dart';
import '../../features/authentication/presentation/login_screen.dart';
import '../widgets/onboarding_skip.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final controller = PageController();
  int thisPage = 0;

  @override
  void initState() {
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  DecorationImage _buildDecorationImage() {
    if (thisPage == 0) {
      return const DecorationImage(
        image: AssetImage(AppImages.onboardingFirstImage),
        fit: BoxFit.cover,
      );
    } else if (thisPage == 1) {
      return const DecorationImage(
        image: AssetImage(AppImages.onboardingSecondImage),
        fit: BoxFit.cover,
      );
    } else {
      return const DecorationImage(
        image: AssetImage(AppImages.onboardingthirdImage),
        fit: BoxFit.cover,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            image: _buildDecorationImage(),
          ),
          child: PageView(
            onPageChanged: (value) {
              thisPage = value;
            },
            controller: controller,
            children: [
              Column(
                children: [
                  const Gap(13),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SkipButton(
                          onTap: () {
                            sl<SharedPreferences>()
                                .setBool('wizard', true)
                                .then((_) {
                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>LoginScreen()), (route) => false);
                            });
                          },
                          text: "Skip",
                        ),
                      ],
                    ),
                  ),
                  const Gap(486),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Mutaxasislardan maslahat",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: textColorBlue,
                        ),
                      ),
                    ],
                  ),
                  const Gap(19.34),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        "Find a doctor who will take the best\ncare of your health...",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: textColor),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  const Gap(13),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SkipButton(
                          onTap: () {
                            sl<SharedPreferences>()
                                .setBool('wizard', true)
                                .then((_) {
                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>LoginScreen()), (route) => false);
                            });
                          },
                          text: "Skip",
                        ),
                      ],
                    ),
                  ),
                  const Gap(482),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        "Rejalashtirilgan \ndavolanish tartibi",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                  const Gap(12),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        "Set up a reminder to take the\n medicine on time...",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: textColor),
                      ),
                    ],
                  ),
                ],
              ),
              const Column(
                children: [
                  Gap(300),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Order Medicine Online",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: textColorRed,
                        ),
                      ),
                    ],
                  ),
                  Gap(19.34),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        "Order your medicine that your \n doctor provided you...",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: textColor),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),


        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [



            GestureDetector(
              onTap: () async {
                if (thisPage == 0 || thisPage == 1) {
                  controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease);
                } else {
                  await sl<SharedPreferences>()
                      .setBool('wizard', true);

                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>LoginScreen()), (route) => false);
                }
              },
              child: Container(
                height: 42,
                width: 343,
                margin: const EdgeInsets.only(bottom: 16, ),
                padding: const EdgeInsets.only(left: 0, right: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: textColorBlue,
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      thisPage == 2 ? "Asosiyga O'tish" : "Davom etish",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}