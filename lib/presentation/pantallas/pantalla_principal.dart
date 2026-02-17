import 'package:flutter/material.dart';

class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key});

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState(); //Se crea un estado con createState y retorna _SegundaPantallaState
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  int contadorClicks = 0;

void incrementar() {
  setState(() {
    contadorClicks ++;
  });
}

void decrementar() {
  setState(() {
    contadorClicks --;
  });
}

void reiniciar() {
  setState(() {
    contadorClicks = 0;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Mi primera AppBar')), //Creamos el widget AppBar y le pones un title center tipo text
        leading: IconButton( //El leading es un lugar a la izquierda de la appbar y se crea un IconButton
          onPressed: reiniciar, icon: Icon(Icons.refresh_rounded)),
      ),
      body: Center( 
        child: Column( //Hijo de center
          mainAxisAlignment: MainAxisAlignment.center, //Centramos en contenido verticalmente
          children: [ //Hijo de column
            Text('$contadorClicks', //Concatenamos la variable a el Text que es hijo de column
             style: const TextStyle(fontSize: 40, fontFamily: 'Poppins', fontWeight: FontWeight.bold)), //Texto 1 le agreamos estilos
            const Text('Cantidad de clicks', style: TextStyle(fontSize: 30, fontFamily: 'Verdana'),) //Texto 2 le agregamos estilos
          ], 
        ),
      ),
      floatingActionButton: Row( //Row sirve para crear más buttons
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: incrementar,
            child: const Icon(Icons.plus_one),
          ), const SizedBox(width: 10), //SizedBox deja un espacio entre botones flotantes
          FloatingActionButton(
            onPressed: decrementar, 
            child: const Icon(Icons.exposure_minus_1),
          )
        ],
      ),
    );
  }
}