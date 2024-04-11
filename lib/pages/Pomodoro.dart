import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/Store/pomodoro.store.dart';
import 'package:pomodoro/componentes/Cronometro.dart';
import 'package:pomodoro/componentes/EntradaTempo.dart';
import 'package:provider/provider.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Cronometro(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Observer(
              builder: (_) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  EntradaTempo(
                    titulo: 'Trabalho',
                    valor: store.tempoTrabalho,
                    inc: store.iniciado && store.estaTrabalhando()
                        ? null
                        : store.decrementarTempoTrabalho,
                    dec: store.iniciado && store.estaTrabalhando()
                        ? null
                        : store.incrementarTempoTrabalho,
                  ),
                  EntradaTempo(
                    titulo: 'Descanço',
                    valor: store.tempoDescanso,
                    inc: store.iniciado && store.estaDescansando()
                        ? null
                        : store.decrementarTempoDescanso,
                    dec: store.iniciado && store.estaDescansando()
                        ? null
                        : store.incrementarTempoDescanso,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
