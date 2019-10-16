import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/animation.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _mensagemResultado = 'Escolha Sua Jogada';
  var _imagemEscolhaApp = 'images/padrao.png';
  var _vitoriasJogador = 0;
  var _vitoriasApp = 0;

   resultadoJogo(String escolhaJogador){
     var _escolhaJogador = escolhaJogador;

     var _escolhasApp = ["pedra", "papel", "tesoura"];
     var _numEscolhaApp = Random().nextInt(3);
     var _escolhaApp = _escolhasApp[_numEscolhaApp];

     setState(() {
       _imagemEscolhaApp = "images/$_escolhaApp.png";
      });

     if(
          (_escolhaJogador == 'pedra' && _escolhaApp == 'tesoura') ||
          (_escolhaJogador == 'terousa' && _escolhaApp == 'papel') ||
          (_escolhaJogador == 'papel' && _escolhaApp == 'pedra')
     ){
       setState(() {
         _vitoriasJogador++;
         _mensagemResultado = "Você venceu!";
       });
     }
     else if(_escolhaJogador == _escolhaApp){
       setState(() {
         _mensagemResultado = "Empate!";
         _vitoriasApp = 0;
         _vitoriasJogador = 0;
       });
     }
     else{

       setState(() {
         _mensagemResultado = "Você Perdeu";
         _vitoriasApp++;
       });
     }
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Jokenpo!"),
      ) ,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
           Padding(
             padding: EdgeInsets.only(top: 32, bottom: 16),
             child: Text(
               'Escolha do App',
               textAlign: TextAlign.center,
               style: TextStyle(
                 fontSize: 20,
                 fontWeight: FontWeight.bold,
               ),
             ),
           ),
          Image.asset(
              _imagemEscolhaApp
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _mensagemResultado,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => resultadoJogo('pedra'),
                child: Image.asset('images/pedra.png', height: 100,),
              ),
              GestureDetector(
                onTap: () => resultadoJogo('papel'),
                child: Image.asset('images/papel.png', height: 100,),
              ),
              GestureDetector(
                onTap: () => resultadoJogo('tesoura'),
                child: Image.asset('images/tesoura.png', height: 100,),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Jogador",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "App",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "$_vitoriasJogador",
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "$_vitoriasApp",
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
