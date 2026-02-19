import 'package:flutter/material.dart';
import '../widget/main_button.dart';
import 'screen_1.dart';
import 'screen_2.dart';
import 'screen_3.dart';
import 'screen_4.dart';
import 'screen_5.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void goTo(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menú Principal de Pantallas"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Pantalla Índice",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            MainButton(
              text: "Ir a Pantalla 1",
              onPressed: () => goTo(context, const Screen1()),
            ),
            const SizedBox(height: 12),

            MainButton(
              text: "Ir a Pantalla 2",
              onPressed: () => goTo(context,  Screen2()),
            ),
            const SizedBox(height: 12),

            MainButton(
              text: "Ir a Pantalla 3",
              onPressed: () => goTo(context, const Screen3()),
            ),
            const SizedBox(height: 12),

            MainButton(
              text: "Ir a Pantalla 4",
              onPressed: () => goTo(context, const Screen4()),
            ),
            const SizedBox(height: 12),

            MainButton(
              text: "Ir a Pantalla 5",
              onPressed: () => goTo(context, const Screen5()),
            ),
          ],
        ),
      ),
    );
  }
}
