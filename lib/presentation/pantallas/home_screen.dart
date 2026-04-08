import 'package:apllication/router/app_routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState(); //Se crea un estado con createState y retorna _HomeScreenState
}

class _HomeScreenState extends State<HomeScreen> {
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
      appBar: AppBar(title: const Center(child: Text('Mi primera AppBar', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold))), //Creamos el widget AppBar y le pones un title center tipo text
        backgroundColor: Colors.deepPurpleAccent,
        leading: IconButton( //El leading es un lugar a la izquierda de la appbar y se crea un IconButton
          onPressed: reiniciar, 
          icon: Icon(
            Icons.refresh_rounded,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.widgets), 
            icon: Icon(
              Icons.navigate_next_rounded,
              color: Colors.white,
              size: 40,
            ),
          ),
        ],
        toolbarHeight: 70,
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
            heroTag: 'btn_decrementar', // Identificador único 2
            onPressed: decrementar, 
            child: const Icon(Icons.exposure_minus_1),
          ),
          const SizedBox(width: 10), //SizedBox deja un espacio entre botones flotantes
          FloatingActionButton(
            heroTag: 'btn_incrementar', // Identificador único 1
            onPressed: incrementar,
            child: const Icon(Icons.plus_one),
          ), 
        ],
      ),
    );
  }
}
