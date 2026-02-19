import 'package:flutter/material.dart';
import '../widget/main_button.dart';
import 'home_screen.dart';

class Screen1 extends StatelessWidget {
  static const Map<String, String> animalFacts = {
    'Pulpo': 'Tiene tres corazones: dos bombean sangre a las branquias y uno al resto del cuerpo.',
    'Jirafa': 'Tiene el mismo número de vértebras cervicales que los humanos (7), pero mucho más largas.',
    'Hormiga': 'No tienen pulmones; respiran por pequeños orificios llamados espiráculos.',
    'Tiburon': 'Tiene múltiples filas de dientes y puede perder más de 20.000 dientes en su vida.',
    'Delfín': 'Duermen con solo la mitad del cerebro a la vez (sueño unihemisférico).',
  };

  void showFact(BuildContext context, String animal) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Dato Curioso de $animal'),
          content: Text(animalFacts[animal] ?? 'Dato no encontrado.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  const Screen1({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Datos Curiosos de Animales"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "¡DATOS DE ANIMALESSSS!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: animalFacts.length,
              itemBuilder: (context, index) {
                String animal = animalFacts.keys.elementAt(index);
                String fact = animalFacts.values.elementAt(index);
                
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      child: Icon(Icons.pets, color: Colors.white),
                    ),
                    title: Text(
                      animal,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Text(fact),
                    onTap: () => showFact(context, animal),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: MainButton(
              text: "Volver al Índice",
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (route) => false,
                );
              },
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
