import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/Store/pomodoro.store.dart';
import 'package:pomodoro/componentes/CronometroBotao.dart';
import 'package:provider/provider.dart';

class Cronometro extends StatelessWidget {
  const Cronometro({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Observer(
      builder: (_) => Container(
        color: store.estaTrabalhando() ? Colors.red : Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              store.estaTrabalhando()
                  ? 'Hora de Trabalhar'
                  : 'Hora de Descansar',
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 25),
            Text(
              '${store.minutos.toString().padLeft(2, '0')}:${store.segundos.toString().padLeft(2, '0')}',
              style: const TextStyle(
                fontSize: 120,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!store.iniciado)
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: CronometroBotao(
                      texto: 'Iniciar',
                      icone: Icons.play_arrow,
                      click: store.iniciar,
                    ),
                  ),
                if (store.iniciado)
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CronometroBotao(
                      texto: 'Parar',
                      icone: Icons.stop,
                      click: store.parar,
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: CronometroBotao(
                    texto: 'Reiniciar',
                    icone: Icons.refresh,
                    click: store.reiniciar,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
