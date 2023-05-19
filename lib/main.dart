// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CheckboxSample(),
    );
  }
}

class CheckboxSample extends StatefulWidget {
  @override
  CheckboxSampleState createState() => CheckboxSampleState();
}

class CheckboxSampleState extends State<CheckboxSample> {
  Map<String, bool> first = {
    'Apple': false,
    'Xiaomi': false,
    'Eletrolux': false,
  };

  Map<String, bool> second = {
    'Razer': false,
    'Mundial': false,
    'Logitech': false,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkbox Sample'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Quais das opções abaixo são marcas de celular?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              )),
          Column(
            children: _buildCheckboxes(),
          ),
          const SizedBox(height: 16.0),
          Text("Quais das opções abaixo são marcas de headsets?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              )),
          Column(
            children: _buildSecondCheckboxes(),
          )
        ]),
      ),
    );
  }

  List<Widget> _buildCheckboxes() {
    List<Widget> firstCheckboxes = [];
    // percorre todos os itens armazendos na estrutura
    // Map (chave, valor), obtendo os valores
    first.forEach((String key, bool value) {
      firstCheckboxes.add(
        // adiciona um item ao checkbox
        CheckboxListTile(
          title: Text(key), //adiciona título
          value: value, // define valor
          // implementa evento onChage para gerenciar
          // valor do checkbox
          onChanged: (newValue) {
            //recebe valor atual
            setState(() {
              //altera o estado da variável
              newValue != null
                  ? //se diferente de null
                  //alterna valor entre verdadeiro e falso
                  first[key] == true
                      ? first[key] = false
                      : first[key] = true
                  : first[key] = false;
            });
          },
        ),
      );
    });

    // adiciona ao final do checkBox, botão
    firstCheckboxes.add(
      ElevatedButton(
        // se pressionado executar método
        onPressed: () {
          _showFirstSelected(); // mostra selecionados
        },
        child: const Text('Show Selected'),
      ),
    );
    return firstCheckboxes;
  }

  List<Widget> _buildSecondCheckboxes() {
    List<Widget> secondCheckboxes = [];
    // percorre todos os itens armazendos na estrutura
    // Map (chave, valor), obtendo os valores
    second.forEach((String key, bool value) {
      secondCheckboxes.add(
        // adiciona um item ao checkbox
        CheckboxListTile(
          title: Text(key), //adiciona título
          value: value, // define valor
          // implementa evento onChage para gerenciar
          // valor do checkbox
          onChanged: (newValue) {
            //recebe valor atual
            setState(() {
              //altera o estado da variável
              newValue != null
                  ? //se diferente de null
                  //alterna valor entre verdadeiro e falso
                  second[key] == true
                      ? second[key] = false
                      : second[key] = true
                  : second[key] = false;
            });
          },
        ),
      );
    });

    // adiciona ao final do checkBox, botão
    secondCheckboxes.add(
      ElevatedButton(
        // se pressionado executar método
        onPressed: () {
          _showSecondSelected(); // mostra selecionados
        },
        child: const Text('Show Selected'),
      ),
    );
    return secondCheckboxes;
  }

  void _showFirstSelected() {
    // mostra itens selecionados
    List<String> selected = []; // lista de strings
    // percorre coleção que contém o itens selecionados
    first.forEach((String key, bool value) {
      if (value) {
        // se valor válido
        selected.add(key); // adiciona na lista de strings
      }
    });
    // mostra caixa de diálogo com as opções selecionadas
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // título da lista
          title: const Text('Selected Items'),
          // conteúdo da lista
          //* a cada elemento adicina uma vírgula
          content: Text(selected.join(', ')),
          actions: [
            // cria botão na caixa de diálogo
            TextButton(
              onPressed: () {
                //fecha caixa de diálogo
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showSecondSelected() {
    // mostra itens selecionados
    List<String> selected = []; // lista de strings
    // percorre coleção que contém o itens selecionados
    second.forEach((String key, bool value) {
      if (value) {
        // se valor válido
        selected.add(key); // adiciona na lista de strings
      }
    });
    // mostra caixa de diálogo com as opções selecionadas
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // título da lista
          title: const Text('Selected Items'),
          // conteúdo da lista
          //* a cada elemento adicina uma vírgula
          content: Text(selected.join(', ')),
          actions: [
            // cria botão na caixa de diálogo
            TextButton(
              onPressed: () {
                //fecha caixa de diálogo
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
