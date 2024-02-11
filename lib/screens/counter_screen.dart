import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});
  @override
  State<CounterScreen> createState() => _MyCounterScreenState();
}

class _MyCounterScreenState extends State<CounterScreen> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurpleAccent.shade400,
        title: const Center(
        child: Text('Contador'),
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/img/contador.jpg'),
            const SizedBox(height: 50),
            Text('$contador',
                style: const TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.w400,
                )),
            Text(
              contador == 1 || contador == -1 ? 'click' : 'clicks',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w400,
              ),
            ),
            
          ],
          
        ),
      ),
      
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            icono: Icons.plus_one,
            onPressed: () {
              setState(() {
                contador++;
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            icono: Icons.exposure_minus_1,
            onPressed: () {
              setState(() {
                //if (contador == 0) return;
                contador--;
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            icono: Icons.refresh_rounded,
            onPressed: () {
              setState(() {
                contador = 0;
              });
            },
          ),
      
        ],
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconoPersist(
              icono: Icons.plus_one_rounded,
              onPressed: () {
                setState(() {
                  contador++;
                });
              },
            ),
            IconoPersist(
              icono: Icons.exposure_minus_1_rounded,
              onPressed: () {
                setState(() {
                  contador--;
                });
              },
            ),
            IconoPersist(
              icono: Icons.refresh_rounded,
              onPressed: () {
                setState(() {
                  contador=0;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}

class IconoPersist extends StatelessWidget {
  final IconData icono;
  final VoidCallback? onPressed;

  const IconoPersist({super.key, required this.icono, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icono),
      onPressed: onPressed,
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icono;
  final VoidCallback? onPressed;
  final FloatingActionButtonLocation? position;

  const CustomButton({super.key, required this.icono, this.onPressed, this.position});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      
      onPressed: onPressed,
      child: Icon(icono),
    );
  }
}