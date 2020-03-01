import 'dart:math';
import 'package:flutter/material.dart';

var frases = [];

void main() {
  frases = [
    "Design não é apenas o que parece e o que se sente. Design é como funciona.",
    "Inovação distingue um líder de um seguidor.",
    "As coisas não precisam mudar o mundo para serem importantes.",
    "Pode se encontrar a felicidade mesmo nas horas mais sombrias, se a pessoa se lembrar de acender a luz.",
  ];
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Frases do Dia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Frases do Dia'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _fraseEscolhida;

  void _obterFrase() {
    setState(() {
      if (_fraseEscolhida == null) {
        _fraseEscolhida = _gerarNovaFrase();
        return;
      }
      String frase = _gerarNovaFrase();
      while (frase.compareTo(_fraseEscolhida) == 0) {
        frase = _gerarNovaFrase();
      }
      _fraseEscolhida = frase;
    });
  }

  String _gerarNovaFrase() {
    return frases[new Random().nextInt(frases.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Clique para gerar a Frase do Dia:',
            ),
            Text(
              _fraseEscolhida == null ? "..." : _fraseEscolhida,
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _obterFrase,
        tooltip: 'Gerar Frase',
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
