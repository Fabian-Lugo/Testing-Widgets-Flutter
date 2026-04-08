import 'package:flutter/material.dart';

class TestWidgetsScreen extends StatefulWidget {
  const TestWidgetsScreen({super.key});

  @override
  State<TestWidgetsScreen> createState() => _TestWidgetsScreenState();
}

class _TestWidgetsScreenState extends State<TestWidgetsScreen> {
  final TextEditingController _controller = TextEditingController();
  final keyValue = GlobalKey<FormState>(); 
  String? selectOption;
  String? experienceLevel;
  String textOnScreen = '';
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
   _seeValues();
  }
}

void _seeValues() {
  /*===== CONCATENACION DE CHECKBOX =====*/
   setState(() {
    List<String> lenguaje = [];
    if (option1) lenguaje.add('Python');
    if (option2) lenguaje.add('Dart');
    if (option3) lenguaje.add('Java');

    textOnScreen = '''${_controller.text}\nPaís: $selectOption
    Estado: ${activeUser ? 'Activo' : 'Inactivo'}
    Experiencia: $experienceLevel
    Lenguaje: ${lenguaje.isEmpty ? 'Ninguno' : lenguaje.join(', ')}''';
    });
}

void clearText() => setState(() {
  _controller.clear();
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
          title: _AppbarContent(),
          centerTitle: true,
          toolbarHeight: 70,
          leading: IconButton(
            onPressed: () => Navigator.pop(context), 
            icon: Icon
            (Icons.chevron_left, 
              color: Colors.white,
              size: 40, 
            )
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
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
                    _InputField(controller: _controller,),
                    const SizedBox(height: 20),
                    /*===== DROPDOWN =====*/
                    _DropdownField(
                      option: selectOption, 
                      list: countrys,
                      function: (newValue) =>
                        setState(() => selectOption = newValue),
                    ),
                    /*===== SWITCH =====*/
                    _SwitchTest(
                      value: activeUser, 
                      onChanged: (newValue) => 
                      setState(() => activeUser = newValue)
                    ),
                    /*===== RADIO BUTTON =====*/
                    _RadioButtons(
                      selectOption: experienceLevel,
                      onChanged: (value) => 
                      setState(() => experienceLevel = value),
                    ),
                    /*===== CHECKBOX =====*/
                    _CheckboxContainer(
                      checkboxText1: 'Python', 
                      checkboxText2: 'Dart', 
                      checkboxText3: 'Java', 
                      checkboxOption1: option1, 
                      checkboxOption2: option2, 
                      checkboxOption3: option3,
                      onChanged1: (value) => setState(() => option1 = value!),
                      onChanged2: (value) => setState(() => option2 = value!),
                      onChanged3: (value) => setState(() => option3 = value!),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _ButtonStyles(text: 'Mostrat', color: Colors.blue, function: seeText),
                        const SizedBox(height: 2.5),
                        _ButtonStyles(text: 'Borrar', color: Colors.red, function: clearText)
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      textOnScreen.isEmpty
                      ? 'Mostrar: Muestra texto\nBorrar: Elimina texto'
                      : 'Texto: $textOnScreen',
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 25,
                        fontWeight: FontWeight.w900,  
                        fontFamily: 'Verdana'
                      ),
                      textAlign: TextAlign.center,
                    ),
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

  /*===== APPBAR CONTENIDO =====*/
class _AppbarContent extends StatelessWidget {
  const _AppbarContent();

  @override
  Widget build(BuildContext context) {
    return Text('Probando Widgets',
      style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)
    );
  }
}

  /*===== CAMPO DE TEXTO =====*/
class _InputField extends StatelessWidget {
  final TextEditingController controller;

  const _InputField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Ingresa un texto',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
        )
      ),
      validator:(value) => 
       (value?.trim().isEmpty ?? true) ? 'Campo obligatorio' :
       null
    );
  }
}

  /*===== DROPDOWN =====*/
class _DropdownField extends StatefulWidget {
  final List<String> list;
  final ValueChanged<String?> function;
  String? option;

  _DropdownField({
    required this.option,
    required this.list,
    required this.function
  });

  @override
  State<_DropdownField> createState() => _DropdownFieldState();
}

class _DropdownFieldState extends State<_DropdownField> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Selecciona un país',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
        )
      ),
      initialValue: widget.option,
      items: widget.list.map((optionItem) {
        return DropdownMenuItem(
          value: optionItem,
          child: Text(optionItem)
        );
      }).toList(),
      onChanged: widget.function,
      validator: (value) => (value == null) ? 'Seleccione una opción' : null,
    );
  }
}

  /*===== SWITCH =====*/
class _SwitchTest extends StatefulWidget {
  bool value;
  final ValueChanged<bool> onChanged;

  _SwitchTest({required this.value, required this.onChanged});

  @override
  State<_SwitchTest> createState() => _SwitchTestState();
}

class _SwitchTestState extends State<_SwitchTest> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Usuario activo?',
        style: TextStyle(fontSize: 15, color: Colors.black),
        ),
        Switch(
          value: widget.value,
          onChanged: widget.onChanged
        ),
      ],
    );
  }
}

  /*===== RADIO BUTTON =====*/
class _RadioButtons extends StatefulWidget {
  final ValueChanged<String?> onChanged;
  String? selectOption;

  _RadioButtons({
    required this.selectOption, 
    required this.onChanged,
  });


  @override
  State<_RadioButtons> createState() => _RadioButtonsState();
}

class _RadioButtonsState extends State<_RadioButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Nivel de experiencia',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        RadioListTile<String>(
          title: const Text('Junior'),
          value: 'Junior',
          groupValue: widget.selectOption,
          onChanged: widget.onChanged
        ),
        RadioListTile<String>(
          title: const Text('Senior'),
          value: 'Senior',
          groupValue: widget.selectOption,
          onChanged: widget.onChanged
        ),
      ],
    );
  }
}

  /*===== CHECKBOX =====*/
class _CheckboxContainer extends StatefulWidget {
  final String checkboxText1;
  final String checkboxText2;
  final String checkboxText3;
  final ValueChanged<bool?> onChanged1;
  final ValueChanged<bool?> onChanged2;
  final ValueChanged<bool?> onChanged3;
  bool checkboxOption1;
  bool checkboxOption2;
  bool checkboxOption3;

  _CheckboxContainer({
    required this.checkboxText1, 
    required this.checkboxText2, 
    required this.checkboxText3, 
    required this.checkboxOption1, 
    required this.checkboxOption2, 
    required this.checkboxOption3,
    required this.onChanged1,
    required this.onChanged2,
    required this.onChanged3,
  });

  @override
  State<_CheckboxContainer> createState() => _CheckboxContainerState();
}

class _CheckboxContainerState extends State<_CheckboxContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Seleccione lenguaje',
          style: TextStyle(
            fontSize: 35, 
            fontWeight: FontWeight.bold, 
            color: Colors.lightGreen
          ),
        ),
        CheckboxListTile(
          title: Text(widget.checkboxText1),
          value: widget.checkboxOption1,
          onChanged: widget.onChanged1,
        ),
        CheckboxListTile(
          title: Text(widget.checkboxText2),
          value: widget.checkboxOption2,
          onChanged: widget.onChanged2,
        ),
        CheckboxListTile(
          title: Text(widget.checkboxText3),
          value: widget.checkboxOption3,
          onChanged: widget.onChanged3,
        ),
      ],
    );
  }
}

  /*===== BUTTON STYLE =====*/
class _ButtonStyles extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback function;

  const _ButtonStyles({
    required this.text, 
    required this.color,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: function,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 100)
      ),
      child: Text(text,
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15))
    );
  }
}
