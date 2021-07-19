import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({key}) : super(key: key);

  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage('imagens/padrao.png');

  var _mensagem = '';

  void _opcaoSelecionada (String escolhaUsuario){

      var opcoes = ['pedra','papel', 'tesoura'];
      var numero = Random().nextInt(3);
      var escolhaApp = opcoes[numero];

      switch(escolhaApp){
        case 'pedra':
          setState(() {
           this._imagemApp =  AssetImage('imagens/pedra.png');
          });
        break;
        case 'papel':
          setState(() {
           this._imagemApp =  AssetImage('imagens/papel.png');
          });
        break;
        case 'tesoura':
          setState(() {
           this._imagemApp =  AssetImage('imagens/tesoura.png');
          });
        break;
      }

      if(
        (escolhaUsuario == 'pedra' && escolhaApp == 'tesoura') ||
        (escolhaUsuario == 'tesoura' && escolhaApp == 'papel') ||
        (escolhaUsuario == 'papel' && escolhaApp == 'pedra')
      ){
          setState(() {
            this._mensagem = 'Você Ganhou!!!';
          });

      } else if(
        (escolhaUsuario == 'pedra' && escolhaApp == 'pedra') ||
        (escolhaUsuario == 'tesoura' && escolhaApp == 'tesoura') ||
        (escolhaUsuario == 'papel' && escolhaApp == 'papel')
      ){

        setState(() {
            this._mensagem = 'Empate !!!';
          });

      } else {
        setState(() {
            this._mensagem = 'Você Perdeu!!!';
          });
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jokenpo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'Escolha do  Robô',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(image: _imagemApp),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'Escolha uma opção abaixo',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              GestureDetector(
                onTap:() =>_opcaoSelecionada('pedra'),
                child: Image.asset('imagens/pedra.png',  height: 100,),
              ),
              GestureDetector(
                onTap:() => _opcaoSelecionada('papel'),
                child: Image.asset('imagens/papel.png',  height: 100,),
              ),
              GestureDetector(
                onTap:() =>_opcaoSelecionada('tesoura'),
                child: Image.asset('imagens/tesoura.png',  height: 100,),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
