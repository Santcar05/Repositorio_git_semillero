import 'dart:math';
import 'package:flutter/material.dart';
import '../widget/main_button.dart';
import 'home_screen.dart';

class Screen5 extends StatelessWidget {
  const Screen5({super.key});

  @override
  Widget build(BuildContext context) {
    return GuessGamePage();
  }
}

class GuessGamePage extends StatefulWidget {
  const GuessGamePage({super.key});

  @override
  _GuessGamePageState createState() => _GuessGamePageState();
}

class _GuessGamePageState extends State<GuessGamePage> {
  int secretNum = Random().nextInt(101);
  int tries = 0;
  String message = "";
  TextEditingController controller = TextEditingController();

  void checkGuess() {
    int? guess = int.tryParse(controller.text);
    bool found = false;
    if (guess == null) {
      setState(() {
        message = "Please enter a valid number";
      });
      return;
    }
    setState(() {
      tries++;

      if (guess < secretNum) {
        message = "Higher!";
      } else if (guess > secretNum) {
        message = "Lower!";
      } else {
        message = "That's the number";
        found = true;
      }
    });

    controller.clear();
  }

  void resetGame() {
    setState(() {
      secretNum = Random().nextInt(101);
      tries = 0;
      message = "";
      controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 181, 206, 217),
      appBar: AppBar(
        title: Text("Guess Game"),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        backgroundColor: Colors.deepPurple,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: resetGame,
        child: Icon(Icons.refresh),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          
          spacing: 30,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.help_outline,
              size: 120,
              color: Colors.green,
            ),
            Text(
              "Guess a number (0...100)",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),

            TextField(
              controller: controller,
              enabled: message != "That's the number",
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter a number",
                border: UnderlineInputBorder(),
              ),
            ),

            ElevatedButton(
              onPressed: checkGuess,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50),
                backgroundColor: Colors.lightGreenAccent,
              ),
              child: Text("Guess!"),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Message:",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 18,
                  color: message == "That's the number"
                      ? Colors.green
                      : Colors.black,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Tries: $tries",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}