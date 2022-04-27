import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mob2/componentes/cronometro.btao.dart';
import 'package:mob2/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class Cronometro extends StatelessWidget {
  const Cronometro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Observer(
      builder: (_) => Container(
        color: store.estaTrabalhando() ? Colors.red : Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              store.estaTrabalhando()
                  ? 'Hora de Trabalhar'
                  : 'Hora de Descansar',
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              '${store.minutos.toString().padLeft(2, '0')}:${store.segundos.toString().padLeft(2, '0')}',
              style: TextStyle(color: Colors.white, fontSize: 120),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (store.iniciado == false)
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: CornometroBotao(
                      texto: 'Iniciar',
                      icone: Icons.play_arrow,
                      click: store.iniciar,
                    ),
                  ),
                if (store.iniciado == true)
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: CornometroBotao(
                      texto: 'Parar',
                      icone: Icons.stop,
                      click: store.parar,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: CornometroBotao(
                    texto: 'Reinicar',
                    icone: Icons.refresh,
                    click: store.reiniciar,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
