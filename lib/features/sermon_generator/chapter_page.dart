import 'package:flutter/material.dart';
import '../../core/bible_repository.dart';

class ChapterPage extends StatefulWidget {
  final String arquivo;
  final String nome;

  const ChapterPage(this.arquivo, this.nome, {super.key});

  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  Map<String, dynamic>? livro;

  @override
  void initState() {
    super.initState();
    carregar();
  }

  void carregar() async {
    final data = await BibleRepository.carregarLivro(widget.arquivo);
    setState(() => livro = data);
  }

  @override
  Widget build(BuildContext context) {
    if (livro == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final capitulos = livro!['capitulos'] as Map<String, dynamic>;
    final cap = capitulos.keys.first;
    final versiculos = capitulos[cap] as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(title: Text('${widget.nome} $cap')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: versiculos.entries
            .map(
              (e) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  '${e.key}. ${e.value}',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
