import 'package:flutter/material.dart';
import 'package:flutter_plant_shop_ui/cors/constants.dart';
import 'package:flutter_plant_shop_ui/models/onbording_model.dart';
import 'package:flutter_plant_shop_ui/screens/plants_home_screen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  PageController pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.grey.shade800),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => PlantsHomeScreen()),
              );
            },
            child: const Text(
              "Skip",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: plantOnBoarding.length,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      plantOnBoarding[index].image,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 20),

                    // Dots Indicator
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        plantOnBoarding.length,
                        (i) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: i == currentIndex ? 20 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:
                                i == currentIndex
                                    ? primaryColor
                                    : Colors.grey.shade300,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Title
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: plantOnBoarding[index].title,
                              style: const TextStyle(
                                fontSize: 45,
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const TextSpan(
                              text: " Plants",
                              style: TextStyle(
                                fontSize: 45,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          // Correctly Aligned Button
          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {
                if (currentIndex < plantOnBoarding.length - 1) {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => PlantsHomeScreen()),
                  );
                }
              },
              borderRadius: BorderRadius.circular(50),
              child: CircleAvatar(
                backgroundColor: primaryColor,
                radius: 50,
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          ),

          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
