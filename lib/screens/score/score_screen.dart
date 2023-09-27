import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seminar_flutter_app/screens/secret_app/secret_app_screen.dart';
import '../welcome/welcome_screen.dart';
import '/controllers/question_controller.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
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
          Column(
            children: [
              const Spacer(flex: 2),
              const Image(
                image: AssetImage(
                    'assets/icons/score.png'), // Replace with your image path
                width: 350.0, // Adjust width as needed
                height: 350.0, // Adjust height as needed
              ),
              const Spacer(flex: 1),
              Text(
                "${_qnController.numOfCorrectAns * 10}/${_qnController.questions.length * 10}",
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const Spacer(flex: 1),
              SizedBox(
                width: 300.0,
                height: 50.0, // Set your desired width here
                child: ElevatedButton(
                  onPressed: () {
                    Get.deleteAll();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WelcomeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue, // Text color
                  ),
                  child: const Text(
                    'Quay lại',
                    style: TextStyle(
                      fontSize: 20.0, // Adjust the font size
                      fontWeight: FontWeight.bold, // Adjust the font weight
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: _qnController.numOfCorrectAns ==
                    0, // Set your condition here
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecretAppScreen()),
                    );
                  },
                  child: const Text('Your Button Text'),
                ),
              ),
              const Spacer(flex: 2),
            ],
          )
        ],
      ),
    );
  }
}
