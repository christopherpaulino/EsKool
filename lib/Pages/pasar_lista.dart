import 'package:flutter/material.dart';

class PasarLista extends StatefulWidget {
  @override
  _PasarListaState createState() => _PasarListaState();
}

class _PasarListaState extends State<PasarLista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pase de Lista'),
      ),
    );
  }
}
