import 'package:flutter/material.dart';
import '../widget/main_button.dart';
import 'home_screen.dart';

class Screen2 extends StatefulWidget {
  Screen2({super.key});
  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final TextEditingController letraController = TextEditingController();
  String palabraActual = "";
  String Juego = " ";
  int intentos = 8;
  List<String> palabraVisible = [];

  void seleccionarPalabra() {
    List<String> palabras = ["hola", "buenos", "barcelona "];
    palabras.shuffle();
    palabraActual = palabras.first;
    palabraVisible = List.filled(palabraActual.length, "_");

    intentos = 8;
    Juego = "";

    setState(() {});
  }

  void checkearPalabra() {
    String letra = letraController.text.toLowerCase();

    bool acerto = false;
    if (intentos > 0) {
      for (int i = 0; i < palabraActual.length; i++) {
        if (palabraActual[i] == letra) {
          palabraVisible[i] = letra;
          acerto = true;
        }
      }

      if (!acerto) {
        intentos--;
      }
      if (palabraVisible.join() == palabraActual) {
        Juego = "Ganaste";
      }
    } else {
      Juego = "Perdiste";
    }

    letraController.clear();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bienvenido a la pantalla 2 "),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Juega ahorcados",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 25),
            SizedBox(
              // Se le puede agragar un hijo en funcion de modificarle el tamaño
              width: 300,
              height: 50,
              child: TextField(
                controller: letraController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Letra",
                ),
              ),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                minimumSize: const Size(200, 60), // ancho, alto
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                seleccionarPalabra();
              },
              child: const Text("Nueva Palabra"),
            ),
            const SizedBox(height: 25),
            MainButton(
              text: "Checkear Letra ",
              onPressed: () {
                checkearPalabra();
              },
            ),

            const SizedBox(height: 25),
            MainButton(
              text: "Volver al Índice",
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (route) => false,
                );
              },
            ),
            const SizedBox(height: 25),
            Text(
              "Intentos Restantes: $intentos",
              style: TextStyle(color: const Color.fromARGB(255, 110, 10, 2)),
            ),
            Text(
              palabraVisible.join(" "),
              style: const TextStyle(fontSize: 28, letterSpacing: 2),
            ),
            Text(
              "$Juego",
              style: const TextStyle(
                fontSize: 28,
                letterSpacing: 2,
                color: Color.fromARGB(255, 7, 77, 43),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
