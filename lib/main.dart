import 'package:apllication/router/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); //Usamos el widget MyApp
}

class MyApp extends StatelessWidget { //Creamos la clase MyApp hija de StateLessWidget
  const MyApp({super.key}); //Los constructores de widgets publicos necesitan un parametro key
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //Material app es nuestra aplicacion en general
      debugShowCheckedModeBanner: false, //Oculta el icono de debug en la parte superior derecha
      title: 'Primea App',
      theme: ThemeData( //Theme sirve para poner la app en dark o white y más cosas
        useMaterial3: true, //Version de flutter material que usaremos siempre la más reciente
        colorSchemeSeed: Colors.green //Se asigna el color a los elementos flotantes
      ),
      initialRoute: AppRoutes.home,
      routes: appRoutes,
    );
  }
}
