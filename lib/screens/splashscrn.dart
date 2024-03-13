import 'package:doctorplant/constants.dart';
import 'package:doctorplant/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";

  const SplashScreen({super.key});//MAKE FOLLOW GALORITHM-21 on github

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Doctor Plant, Revolutionizing Plant Care !",
      "image": "assets/logo.png",
    },
    {
      "text":
          "Swiftly diagnose and cure plant diseases with cutting-edge \nAI Algorithms.",
      "image": "assets/slide1.png"
    },
    {
      "text":
          "Doctor Plant is your intelligent, \nuser-friendly companion for cultivating crops.",
      "image": "assets/slide2.jpg"
    },
  ];

  _storeOnboardinfo() async {
    int isviewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("splashscrn", isviewed);
  }

  @override
  Widget build(BuildContext context) {//MAKE FOLLOW GALORITHM-21 on github
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    image: splashData[index]["image"],
                    text: splashData[index]['text'],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      const Spacer(
                        flex: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,//MAKE FOLLOW GALORITHM-21 on github
                          (index) => AnimatedContainer(
                            duration: kAnimationDuration,
                            margin: const EdgeInsets.only(right: 5),
                            height: 6,
                            width: currentPage == index ? 20 : 6,
                            decoration: BoxDecoration(
                              color: currentPage == index
                                  ? kPrimaryColor
                                  : const Color(0xFFD8D8D8),
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(flex: 2),
                      skipButton(context),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton skipButton(BuildContext context) {
    return ElevatedButton(
                      onPressed: () async {
                        await _storeOnboardinfo();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Homepage()));
                      },
                      child: const Text(
                        "Skip",
                        style: TextStyle(fontSize: 18),
                      ),//MAKE FOLLOW GALORITHM-21 on github
                    );
  }
}

class SplashContent extends StatefulWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  State<SplashContent> createState() => _SplashContentState();
}

class _SplashContentState extends State<SplashContent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Spacer(
            flex: 2,
          ),
          const Text(
            "Doctor Plant",
            style: TextStyle(
              fontSize: 32,
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            widget.text!,
            textAlign: TextAlign.center,
          ),
          const Spacer(flex: 2),
          Image.asset(
            widget.image!,
            height: 300,
            width: 295,
          ),
        ],
      ),
    );
  }
}
