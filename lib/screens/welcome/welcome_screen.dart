import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '/constants.dart';
import '/screens/quiz/quiz_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/icons/quiz_bg.jpg'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage(
                        'assets/icons/quiz_text.png'), // Replace with your image path
                    width: 350.0, // Adjust width as needed
                    height: 350.0, // Adjust height as needed
                  ),
                  Text(
                    "Let's Play Quiz",
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const Text("Hãy nhập tên của bạn bên dưới"),
                  const Spacer(), // 1/6
                  const TextField(
                    style: TextStyle(
                      color: Colors.white, // Set your desired text color here
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 178, 178),
                      hintText: "Tên của bạn",
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                  const Spacer(), // 1/6
                  InkWell(
                    onTap: () => Get.to(() => QuizScreen()),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(kDefaultPadding * 1), // 15
                      decoration: const BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Bắt đầu trò chơi",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Color.fromARGB(255, 255, 211, 211),
                            fontSize: 20),
                      ),
                    ),
                  ),
                  const Spacer(flex: 2), // it will take 2/6 spaces
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
