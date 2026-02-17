import 'package:flutter/material.dart';

class IngresaTexto extends StatefulWidget {
  const IngresaTexto({super.key});

  @override
  State<IngresaTexto> createState() => _IngresaTextoState();
}

class _IngresaTextoState extends State<IngresaTexto> {
  final TextEditingController controllerText = TextEditingController();
  final keyValue = GlobalKey<FormState>(); 
  String textOnScreen = '';
  String? selectOption;
  String? experienceLevel;
  bool activeUser = false;
  bool option1 = false;
  bool option2 = false;
  bool option3 = false;

final List<String> countrys = [
  'Argentina',
  'Uruguay',
  'Colombia',
  'Brazil',
  'Chile',
  'Ecuador',
  'Perú'
];

void seeText() {
  if (keyValue.currentState!.validate()) {
  setState(() {
    /*===== CONCATENACION DE CHECKBOX =====*/
    List<String> lenguaje = [];
    if (option1) lenguaje.add('Dart');
    if (option2) lenguaje.add('Java');
    if (option3) lenguaje.add('Python');

    textOnScreen = '''${controllerText.text}\nPaís: $selectOption
    Estado: ${activeUser ? 'Activo' : 'Inactivo'}
    Lenguaje: ${lenguaje.isEmpty ? 'Ninguno' : lenguaje.join(', ')}'''; //.join sirve para concatenar elementos de list en un solo String usando (', ') como separador 
  });
  }
}

void clearText() => setState(() {
  controllerText.clear();
  textOnScreen = '';
  selectOption = null;
  activeUser = false;
  option1 = false;
  option2 = false;
  option3 = false;
  }
); //Con null se resetea el DropDown

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.opaque,
      child:  Scaffold(
        backgroundColor: Colors.white , 
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: const Center(
            child: Text('Application 01',
            style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: keyValue,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Ingresa Valores',
                    style: TextStyle(color: Colors.blueAccent, fontSize: 35, fontWeight: FontWeight.w800)
                    ),
                    const SizedBox(height: 20),
                    /*===== CAMPO DE TEXTO =====*/
                    TextFormField(
                      controller: controllerText,
                      decoration: InputDecoration(
                        labelText: 'Ingresa un texto',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        )
                      ),
                      validator:(value) => (value == null || value.isEmpty) ? 'Ingrese un valor' : null
                    ),
                    const SizedBox(height: 20),
                    /*===== DROPDOWN =====*/
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Selecciona un país',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        )
                      ),
                      initialValue: selectOption,
                      items: countrys.map((option) {
                        return DropdownMenuItem(
                          value: option,
                          child: Text(option)
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectOption = newValue;
                        });
                      },
                      validator: (value) => (value == null) ? 'Seleccione una opción' : null,
                    ),
                    const SizedBox(height: 20),
                    /*===== SWITCH =====*/
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        const Text('Usuario activo?',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Switch(
                          value: activeUser,
                          onChanged: (newValue) {
                            setState(() {
                              activeUser = newValue;
                            });
                          })
                      ],
                    ),
                    /*===== RADIO BUTTON =====*/
                    const Text('Nivel de experiencia',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                    RadioListTile<String>(
                      title: const Text('Junior'),
                      value: 'Junior',
                      // ignore: deprecated_member_use
                      groupValue: experienceLevel,
                      // ignore: deprecated_member_use
                      onChanged: (value) {
                        setState(() {
                          experienceLevel = value;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text('Senior'),
                      value: 'Senior',
                      // ignore: deprecated_member_use
                      groupValue: experienceLevel,
                      // ignore: deprecated_member_use
                      onChanged: (value) {
                        setState(() {
                          experienceLevel = value;
                        });
                      },
                    ),
                    const Text('Seleccione lenguaje',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.lightGreen)),
                    /*===== Check Box =====*/
                    CheckboxListTile(
                      title: const Text('Dart'),
                      value: option1,
                      onChanged: (bool? newValue) {
                        setState(() {
                          option1 = newValue!;
                        });
                      }),
                    CheckboxListTile(
                      title: const Text('Java'),
                      value: option2,
                      onChanged: (bool? newValue) {
                        setState(() {
                          option2 = newValue!;
                        });
                      }),
                    CheckboxListTile(
                      title: const Text('Python'),
                      value: option3,
                      onChanged: (bool? newValue) {
                        setState(() {
                          option3 = newValue!;
                        });
                      }),
                    Row(
                      mainAxisAlignment: .center,
                      children: [
                        Column(
                          children: [
                            ElevatedButton(onPressed: seeText,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 100)
                              ),
                              child: const Text('Mostrar',
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15))
                            ),
                            const SizedBox(height: 2.5),
                            ElevatedButton(onPressed: clearText,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 243, 33, 33),
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 100)
                              ),
                              child: const Text('Borrar',
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15))
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Text(
                        textOnScreen.isEmpty
                        ? 'Mostrar: Muestra texto\nBorrar: Elimina texto'
                        : 'Texto: $textOnScreen',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 25,
                          fontWeight: FontWeight.w900,  
                          fontFamily: 'Verdana'
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ),
        ),
      ),
    );
  }
}