import 'package:flutter/material.dart';
import 'package:pomodoro/Store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class CronometroBotao extends StatelessWidget {
  final String texto;
  final IconData icone;
  final void Function()? click;

  const CronometroBotao({
    Key? key,
    required this.texto,
    required this.icone,
    this.click,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        textStyle: TextStyle(
          fontSize: 25,
        ),
      ),
      onPressed: click,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              icone,
              size: 35,
            ),
          ),
          Text(texto),
        ],
      ),
    );
  }
}
