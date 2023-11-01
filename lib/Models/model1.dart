import 'package:flutter/material.dart';

class model1 extends StatefulWidget {
  const model1({super.key});

  @override
  State<model1> createState() => _model1State();
}

class _model1State extends State<model1> {
  double valor1 = 0;
  double valor2 = 0;
  double sliderFirstValue = 0;
  double sliderSecondValue = 0;
  double resultado = 0;
  String IMC = "";
  String Img = "";

  List<String> condicion = [
    "bajo peso",
    "peso saludable",
    "sobrepeso",
    "obesidad",
  ];
  double solucion() {
    double alturaM = valor1 / 100;
    resultado = valor2 / (alturaM * alturaM);
    resultado = double.parse(resultado.toStringAsFixed(2));
    return resultado;
  }

  String Rcondicion() {
    if (resultado < 18.5) {
      IMC = "bajo peso";
    } else if (resultado >= 18.5 && resultado < 24.9) {
      IMC = "peso saludable";
    } else if (resultado >= 25 && resultado < 29.9) {
      IMC = "sobrepeso";
    } else {
      IMC = "obesidad";
    }
    return IMC;
  }

  String RImage() {
    if (resultado < 18.5) {
      Img = "assets/images/image1.png";
    } else if (resultado >= 18.5 && resultado < 24.9) {
      Img = "assets/images/image2.jpg";
    } else if (resultado >= 25 && resultado < 29.9) {
      Img = "assets/images/image3.jpg";
    } else {
      Img = "assets/images/image4.jpg";
    }
    return Img;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.redAccent,
            title: Text("Calcular IMC"),
            centerTitle: true,
          ),
          backgroundColor: Colors.black,
          body: Center(
            child: Column(
              children: [
                Divider(
                  height: 20,
                ),
                Text(
                  "Altura",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Text(
                  valor1.toString() + " cm",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
                Slider(
                    value: sliderFirstValue,
                    min: 0,
                    max: 220,
                    activeColor: Colors.red,
                    inactiveColor: Colors.grey,
                    onChanged: (uno) {
                      sliderFirstValue = uno;
                      setState(() {
                        valor1 = double.parse(uno.toStringAsFixed(2));
                      });
                    }),
                Divider(
                  height: 20,
                ),
                Text(
                  "Peso",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Text(
                  valor2.toString() + " Kg",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
                Slider(
                    value: sliderSecondValue,
                    min: 0,
                    max: 140,
                    activeColor: Colors.red,
                    inactiveColor: Colors.grey,
                    onChanged: (dos) {
                      sliderSecondValue = dos;
                      setState(() {
                        valor2 = double.parse(dos.toStringAsFixed(2));
                      });
                    }),
                Divider(
                  height: 10,
                ),
                Container(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        solucion();
                        Rcondicion();
                        RImage();
                        setState(() {});
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      child: Text(
                        "Calcular",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )),
                ),
                Divider(
                  height: 30,
                ),
                Text(
                  resultado.toString(),
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
                Text(
                  IMC,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                Text(
                  "Debes de comer mas saludable y menter una dieta sana y balanceada",
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 15,
                  ),
                ),
                ClipOval(
                  child: Container(
                    width: 150,
                    height: 150,
                    child: Image.asset(Img),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
