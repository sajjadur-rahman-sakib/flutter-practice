import 'package:flutter/material.dart';
import 'package:flutter_provider/main.dart';
import 'package:flutter_provider/provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Example'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(context.watch<CounterProvider>().count.toString()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  context.read<CounterProvider>().incrementCount();
                },
                icon: const Icon(Icons.add),
              ),
              IconButton(
                onPressed: () {
                  context.read<CounterProvider>().decrementCount();
                },
                icon: const Icon(Icons.remove),
              ),
            ],
          )
        ],
      ),
    );
  }
}
