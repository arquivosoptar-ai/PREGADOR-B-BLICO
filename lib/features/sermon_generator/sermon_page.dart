import 'package:flutter/material.dart';

class SermonPage extends StatelessWidget {
  const SermonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pregador Bíblico')),
      body: const Center(
        child: Text(
          'Projeto base do Pregador Bíblico',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
