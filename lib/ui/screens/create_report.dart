import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:web_app/models/scope.dart';
import 'package:web_app/models/vulnerability.dart';
import 'package:web_app/models/vulnerability_evidence.dart';
import 'package:web_app/models/vulnerability_report.dart';

class ScopeWidgetGroup extends StatefulWidget {
  final int numItems;

  const ScopeWidgetGroup({Key? key, required this.numItems}) : super(key: key);

  @override
  _ScopeWidgetGroupState createState() => _ScopeWidgetGroupState();
}

class _ScopeWidgetGroupState extends State<ScopeWidgetGroup> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        Text("Alcance ${widget.numItems}"),
        Padding(
            padding: const EdgeInsets.only(left: 36.0),
            child: ElevatedButton(
              onPressed: () async {
//                remove();
              },
              child: const Text('Eliminar'),
            ))
      ]),
      TextFormField(
        decoration: const InputDecoration(labelText: 'Descripción'),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor llena este campo';
          }
          return null;
        },
      ),
      TextFormField(
        decoration: const InputDecoration(labelText: 'IP'),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor llena este campo';
          }
          return null;
        },
      ),
      TextFormField(
        decoration: const InputDecoration(labelText: 'URL'),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor llena este campo';
          }
          return null;
        },
      ),
      TextFormField(
        initialValue: "Linux",
        decoration: const InputDecoration(labelText: 'Sistema operativo'),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor llena este campo';
          }
          return null;
        },
      ),
      const Divider(color: Colors.black),
    ]);
  }
}

class VulnerabilitiesWidgetGroup extends StatefulWidget {
  final int numItems;

  List<Widget> vulnerabilitiesWidgetList;

  VulnerabilitiesWidgetGroup(
      {Key? key,
      required this.numItems,
      required this.vulnerabilitiesWidgetList})
      : super(key: key);

  @override
  _VulnerabilitiesWidgetGroupState createState() =>
      _VulnerabilitiesWidgetGroupState();
}

class _VulnerabilitiesWidgetGroupState
    extends State<VulnerabilitiesWidgetGroup> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text("Vulnerabilidad ${widget.numItems}"),
      TextFormField(
        decoration: const InputDecoration(labelText: 'Nombre'),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor llena este campo';
          }
          return null;
        },
      ),
      TextFormField(
        decoration: const InputDecoration(labelText: 'CWE'),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor llena este campo';
          }
          return null;
        },
      ),
      TextFormField(
        decoration: const InputDecoration(labelText: 'Puntuación de riesgo'),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor llena este campo';
          }
          return null;
        },
      ),
      TextFormField(
        decoration: const InputDecoration(labelText: 'CVSS (3.1)'),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor llena este campo';
          }
          return null;
        },
      ),
      TextFormField(
        decoration: const InputDecoration(labelText: 'Clasificación'),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor llena este campo';
          }
          return null;
        },
      ),
      TextFormField(
        decoration: const InputDecoration(labelText: 'IP'),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor llena este campo';
          }
          return null;
        },
      ),
      TextFormField(
        decoration: const InputDecoration(labelText: 'Puerto'),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor llena este campo';
          }
          return null;
        },
      ),
      TextFormField(
        decoration: const InputDecoration(labelText: 'Riesgo'),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor llena este campo';
          }
          return null;
        },
      ),
      TextFormField(
        decoration: const InputDecoration(labelText: 'Descripción'),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor llena este campo';
          }
          return null;
        },
      ),
      TextFormField(
        decoration: const InputDecoration(labelText: 'Remediación'),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor llena este campo';
          }
          return null;
        },
      ),
      TextFormField(
        decoration: const InputDecoration(labelText: 'Referencias'),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor llena este campo';
          }
          return null;
        },
      ),
      TextFormField(
        decoration: const InputDecoration(labelText: 'Ruta'),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor llena este campo';
          }
          return null;
        },
      ),
      const Divider(color: Colors.black),
    ]);
  }
}

void main() => runApp(const MyApp());
/*
Future<http.Response> createAlbum(String title) async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}
*/

Future<void> showMyDialog(context, String respuesta) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('AlertDialog Title'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              const Text('This is a demo alert dialog.'),
              Text(respuesta),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<String> createReport(String title) async {
  VulnerabilityReport vulnerabilityReport = VulnerabilityReport(
      analysisId: "AD-21-105",
      templateName: "template-sre-wa.docx",
      analysisRevision_01: "1.0",
      qaVulnerabilities: [
        "Autocompletado de usuario, en la página de inicio de sesión está habilitada el autocompletado, a veces estos campos pueden ser extraídos por extensiones maliciosas para reconocer usuarios o incluso contraseñas.",
        "Envío de información sensible en texto plano, en este caso haciendo referencia al token usado en peticiones GET, esto puede verificarse observando por ejemplo la respuesta de la ruta: https://qa-nextcloud.sre.gob.mx/apps/dashboard."
      ],
      scope: [
        Scope("Sistema qa-nextcloud.sre.gob.mx", "172.18.217.41",
            "https://qa-nextcloud.sre.gob.mx/", "Linux"),
        Scope("Sistema qa-api.sre.gob.mx", "172.18.217.41",
            "https://qa-api.sre.gob.mx/", "Linux")
      ],
      vulnerabilities: [
        Vulnerability(
            "Autenticación inadecuada",
            "CWE-120",
            "3.5",
            "A/AC:L/PR:N/UI:N/S:C/C:L/I:N/A:L",
            "Integridad y confidencialidad",
            "1",
            "172.18.217.41",
            "443",
            "Un atacante podría realizar una conexión Telnet sin autenticación en el sistema de destino y ejecutar algunos comandos de enumeración en la memoria caché de la aplicación.",
            "La debilidad existe debido a que se permite el acceso de credenciales incorrectas. Un atacante remoto puede enviar una solicitud no válida con credenciales SASL, luego enviar otra solicitud con credenciales SASL incorrectas y omitir la autenticación.",
            "Se recomienda verificar que el archivo de configuración de caché esté como local si es que no se usan servidores distribuidos en su archivo config.php podría estar como ( memcache.distributed) y no en caché local ( memcache.local), puede que se vea la sesión telnet de todas formas, permitirá comandos de enumeración.\rOtra posible solución sería no permitir conexiones en el puerto de 11211 de forma remota.",
            "https://vuldb.com/?id.66064\rhttps://www.cybersecurity-help.cz/vulnerabilities/11320/",
            "https://qa-nextcloud.sre.gob.mx/index.php/.well-known/security.txt\rhttps://qa-nextcloud.sre.gob.mx/apps/files_pdfviewer/composer.json\rhttps://qa-nextcloud.sre.gob.mx/apps/files_pdfviewer/composer.lock",
            [
              VulnerabilityEvidence(
                  "iVBORw0KGgoAAAANSUhEUgAAAqIAAAIhCAYAAACVJdiFAAAAAXNSR0IArs4c6Q",
                  "En la imagen se puede observar una conexion Telnet al puerto 11211, que según la documentación de NextCloud, está destinado a caché distribuida de la aplicación."),
              VulnerabilityEvidence("i0IArs4c6Q", "En la imagen.")
            ])
      ]);

  String json = jsonEncode(vulnerabilityReport.toJson());

  var response = await http.post(
    Uri.parse('http://127.0.0.1:3000/wda/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Headers": "Origin, Content-Type, X-Auth-Token",
      "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",
    },
    body: json,
  );

  return utf8.decode(response.bodyBytes);
}

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int scopeWidgetListCounter = 1;
  List<Widget> vulnerabilitiesWidgetList = [];
  int vulnerabilitiesWidgetListCounter = 0;
  List<Widget> scopeWidgetList = [const ScopeWidgetGroup(numItems: 1)];

  String dropdownValue = 'Plantilla de reporte SRE 2021';
  DateTime selectedDate = DateTime.now();
  String selectedDateFormated = DateFormat('yyyy-MM-dd').format(DateTime.now());
  final TextEditingController _textEditingController1 = TextEditingController(
      text: DateFormat('yyyy-MM-dd').format(DateTime.now()));
  final TextEditingController _textEditingController2 =
      TextEditingController(text: 'YYYY-MM-DD');
  final TextEditingController _textEditingController3 =
      TextEditingController(text: 'YYYY-MM-DD');
  final TextEditingController _textEditingController4 =
      TextEditingController(text: 'YYYY-MM-DD');
  final TextEditingController _textEditingController5 =
      TextEditingController(text: 'YYYY-MM-DD');
  final TextEditingController _textEditingController6 =
      TextEditingController(text: 'YYYY-MM-DD');

  Future<void> _selectDate(BuildContext context,
      TextEditingController _currentTextEditingController) async {
    await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime(2015, 8),
            lastDate: DateTime(2101))
        .then((picked) {
      if (picked != null && picked != selectedDate) {
        selectedDate = picked;
        selectedDateFormated = DateFormat('yyyy-MM-dd').format(selectedDate);
        _currentTextEditingController.text = selectedDateFormated;
      }
    });
  }

  void _addCardWidget() {
    setState(() {
      scopeWidgetListCounter++;
      scopeWidgetList.add(ScopeWidgetGroup(numItems: scopeWidgetListCounter));
    });
  }

  void _removeCardWidget() {
    setState(() {
      scopeWidgetList.removeLast();

      scopeWidgetListCounter--;
    });
  }

  void _removeVulnerabilityWidgetGroup() {
    setState(() {
      vulnerabilitiesWidgetList.removeLast();

      scopeWidgetListCounter--;
    });
  }

  void _addVulnerabilitiesWidgetGroup() {
    setState(() {
      vulnerabilitiesWidgetListCounter++;
      vulnerabilitiesWidgetList.add(VulnerabilitiesWidgetGroup(
          numItems: vulnerabilitiesWidgetListCounter,
          vulnerabilitiesWidgetList: vulnerabilitiesWidgetList));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Crear reporte de vulnerabilidades'),
        ),
        body: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>[
                    'Plantilla de reporte SRE 2021',
                    'Plantilla de prueba'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Nombre de la aplicación'),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor llena este campo';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Nombre del analista'),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor llena este campo';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'ID asignado del análisis'),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor llena este campo';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: const InputDecoration(
                      labelText: 'No. de versión del análisis'),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor llena este campo';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _textEditingController1,
                  onTap: () async {
                    // Below line stops keyboard from appearing
                    FocusScope.of(context).requestFocus(FocusNode());
                    // Show Date Picker Here

                    _selectDate(context, _textEditingController1);
                  },

                  decoration:
                      const InputDecoration(labelText: 'Fecha de elaboración'),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor llena este campo';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'URL de la aplicación (con http/https)'),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor llena este campo';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Folio de solicitud'),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor llena este campo';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _textEditingController2,
                  onTap: () async {
                    // Below line stops keyboard from appearing
                    FocusScope.of(context).requestFocus(FocusNode());
                    // Show Date Picker Here

                    _selectDate(context, _textEditingController2);
                  },

                  decoration:
                      const InputDecoration(labelText: 'Fecha de solicitud'),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor llena este campo';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _textEditingController3,
                  onTap: () async {
                    // Below line stops keyboard from appearing
                    FocusScope.of(context).requestFocus(FocusNode());
                    // Show Date Picker Here

                    _selectDate(context, _textEditingController3);
                  },

                  decoration: const InputDecoration(
                      labelText: 'Fecha de inicio programado'),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor llena este campo';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _textEditingController4,
                  onTap: () async {
                    // Below line stops keyboard from appearing
                    FocusScope.of(context).requestFocus(FocusNode());
                    // Show Date Picker Here

                    _selectDate(context, _textEditingController4);
                  },

                  decoration: const InputDecoration(
                      labelText: 'Fecha de finalización programada'),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor llena este campo';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _textEditingController5,
                  onTap: () async {
                    // Below line stops keyboard from appearing
                    FocusScope.of(context).requestFocus(FocusNode());
                    // Show Date Picker Here

                    _selectDate(context, _textEditingController5);
                  },

                  decoration:
                      const InputDecoration(labelText: 'Fecha de inicio'),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor llena este campo';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _textEditingController6,
                  onTap: () async {
                    // Below line stops keyboard from appearing
                    FocusScope.of(context).requestFocus(FocusNode());
                    // Show Date Picker Here

                    _selectDate(context, _textEditingController6);
                  },

                  decoration:
                      const InputDecoration(labelText: 'Fecha de finalización'),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor llena este campo';
                    }
                    return null;
                  },
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 36.0),
                    child: Row(children: [
                      const Text("Objetivos en el alcance del análisis"),
                      Padding(
                          padding: const EdgeInsets.only(left: 36.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              _addCardWidget();
                            },
                            child: const Text('Agregar objetivo'),
                          ))
                    ])),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(children: scopeWidgetList)),
                Padding(
                    padding: const EdgeInsets.only(top: 36.0),
                    child: Row(children: [
                      const Text("Vulnerabilidades encontradas"),
                      Padding(
                          padding: const EdgeInsets.only(left: 36.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              _addVulnerabilitiesWidgetGroup();
                            },
                            child: const Text('Agregar vulnerabilidad'),
                          ))
                    ])),
                TextFormField(
                  initialValue: "Homero Piedras Rodríguez",
                  decoration: const InputDecoration(
                      labelText: 'Nombre del responsable del área'),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor llena este campo';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue:
                      "El Director de Área en la Dirección General de Tecnologías de Información e Innovación",
                  decoration: const InputDecoration(
                      labelText: 'Cargo del responsable del área'),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor llena este campo';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: "Lázaro Santiago Cruz",
                  decoration: const InputDecoration(labelText: 'Revisador'),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor llena este campo';
                    }
                    return null;
                  },
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ElevatedButton(
                      child: const Text('Subir imagen de evidencia'),
                      onPressed: () async {
                        var picked = await FilePicker.platform.pickFiles();
                        if (picked != null) {
                          print(picked.files.first.name);
                        }
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.


                     //  if (_formKey.currentState!.validate()) {                       
                     // String respuesta = await createReport('Hola mundo');
                      //showMyDialog(context, respuesta);                      
                    //  }

                    String respuesta = await createReport('Hola mundo');
                    showMyDialog(context, respuesta);   

                      

                      //_addCardWidget();

                     
                    },
                    child: const Text('Guardar'),
                  ),
                )
              ],
            ),
          ),
        )));
  }
}
