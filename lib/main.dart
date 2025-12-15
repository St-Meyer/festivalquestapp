import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Festival Quest',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.grey),
      ),
      home: const MyHomePage(title: 'Lobby'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _exp = 0;
  final TextEditingController _controller = TextEditingController();

  void _experienceAdder() {
    final parsed = int.tryParse(_controller.text.trim());
    final add = parsed ?? 1;

    setState(() {
      _exp += add;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('Experience'),
            Text(
              '$_exp',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 18,),
            TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Zahl eingeben',
              labelText: 'XP hinzufügen',
            ),
            onSubmitted: (_) => _experienceAdder(),
            ),
          ],
        ),
      ),
      floatingActionButton: 
          FloatingActionButton(
            heroTag: 'add',
            onPressed: _experienceAdder,
            tooltip: 'Add Experience',
            child: const Icon(Icons.add),
          ),
    );
  }
}
