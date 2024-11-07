import 'package:flutter/material.dart';

import 'package:flutter_application_1/loginscreen.dart';
import 'dart:async';



class MyHomePage extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Image.asset(
          'assets/splash.png',
          height: 140,
          width: 180,
        ),
      ),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomPaint(
            painter: ArcPainter(),
            child: SizedBox(
              height: screenSize.height / 1.4,
              width: screenSize.width,
            ),
          ),
          Positioned(
            top: 130,
            right: 5,
            left: 5,
            child: Image.asset(
              tabs[_currentIndex].imageFile,
              width: 200,
              alignment: Alignment.topCenter,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: DraggableScrollableSheet(
              initialChildSize: 0.35, 
              minChildSize: 0.2, 
              maxChildSize: 0.6, 
              builder: (context, scrollController) {
                return Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 25, spreadRadius: 25),
                    ],
                  ),
                
                  child: Column(
                    children: [
                     
                      Expanded(
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: tabs.length,
                          itemBuilder: (BuildContext context, int index) {
                            OnboardingModel tab = tabs[index];

                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                       const SizedBox(height: 30),
                                  Text(
                                    tab.title,
                                    style: const TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orangeAccent,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    tab.subtitle,
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.grey,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            );
                          },
                          onPageChanged: (value) {
                            setState(() {
                              _currentIndex = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 75),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Stack(
        children: [

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0), 
              child: ElevatedButton(
                onPressed: () {
                
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomeBackScreen()),
                  );
                },
                
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,


               ),
                child: Text(
                  "Skip",
                  style: TextStyle(color: Colors.orange, fontSize: 20),
                ),
              ),
            ),
          ),
         
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0, right: 10.0), 
              child: FloatingActionButton(
                onPressed: () {
                  if (_currentIndex == tabs.length - 1) {

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => WelcomeBackScreen()),
                    );
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear,
                    );
                  }
                },
                child: Icon(
                  _currentIndex == tabs.length - 1 ? Icons.home : Icons.arrow_forward,
                  color: Colors.white,
                ),
                backgroundColor: Colors.orange,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double topHeightRatio = 1; 

    Paint topPaint = Paint()..color = const Color.fromARGB(255, 23, 162, 196); 


    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height * topHeightRatio),
      topPaint,
    );

   
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class OnboardingModel {
  final String imageFile;
  final String title;
  final String subtitle;

  OnboardingModel(this.imageFile, this.title, this.subtitle);
}


List<OnboardingModel> tabs = [
  OnboardingModel(
    'assets/new.png', 
    'ONLINE PAYMENT',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nPharetra quam elementum massa, viverra. Ut turpis consectetur.',
  ),
  OnboardingModel(
    'assets/cuate.png', 
    'EASY NAVIGATION',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pharetra quam elementum massa, viverra. Ut turpis consectetur.',
  ),
  OnboardingModel(
    'assets/pana.png', 
    'SECURE PAYMENTS',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pharetra quam elementum massa, viverra. Ut turpis consectetur.',
  ),
];

