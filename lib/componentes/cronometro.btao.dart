import 'package:flutter/material.dart';

class CornometroBotao extends StatelessWidget {
  final String texto;
  final IconData icone;
  final void Function()? click;

  const CornometroBotao({
    Key? key,
    required this.texto,
    required this.icone,
    this.click
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10
        ),
        textStyle: TextStyle(
          fontSize: 20
        )
      ),
        onPressed: click,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                  icone,
                   size: 35,
              ),
            ),
            Text(texto)
          ],
        )
    );
  }
}
