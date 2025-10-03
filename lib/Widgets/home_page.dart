import 'package:conversor_moedas/Widgets/campos.dart';
import 'package:conversor_moedas/main.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  late double dolar;
  late double euro;

  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();

  _realChagend(String text) {
    double real = double.parse(text);
    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
  }

  _dolarChanged(String text) {
    double dolar = double.parse(text);
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
  }

  _euroChagend(String text) {
    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext conext) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('\$ Conversor de Moedas \$'),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: Text(
                  'Carregando Dados...',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.amber, fontSize: 25),
                ),
              );
            default:
              if (snapshot.hasError) {
                Center(
                  child: const Text(
                    'Erro ao carregar dados...',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.amber, fontSize: 25),
                  ),
                );
                return Container();
              } else {
                dolar = snapshot.data?["results"]["currencies"]["USD"]["buy"];
                euro = snapshot.data?["results"]["currencies"]["EUR"]["buy"];

                return SingleChildScrollView(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Icon(
                        Icons.monetization_on,
                        size: 150,
                        color: Colors.amber,
                      ),
                      buildTextField(
                        'Real',
                        'R\$ ',
                        realController,
                        _realChagend,
                      ),

                      SizedBox(height: 16),
                      buildTextField(
                        'Dólar',
                        'US\$ ',
                        dolarController,
                        _dolarChanged,
                      ),

                      SizedBox(height: 16),
                      buildTextField(
                        'Euro',
                        '€ ',
                        euroController,
                        _euroChagend,
                      ),
                    ],
                  ),
                );
              }
          }
        },
      ),
    );
  }
}
