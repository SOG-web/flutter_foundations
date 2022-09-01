import 'package:flutter/material.dart';
import 'package:flutter_foundations/randomizer_change_notifier.dart';
import 'package:provider/provider.dart';

class RandomizerPage extends StatelessWidget {
  const RandomizerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Randomizer'),
      ),
      body: Center(
        // the Text widget must be wrap in a Consumer
        // for it to update when the state changes
        //     child: Consumer<RandomizerChangeNotifier>(
        //         builder: (context, notifier, child) {
        //   return Text(
        //     notifier.generatedNumber?.toString() ?? 'Generate a Number',
        //     style: const TextStyle(fontSize: 42),
        //   );
        // })
        child: Text(
          context
                  .watch<RandomizerChangeNotifier>()
                  .generatedNumber
                  ?.toString() ??
              'Generate a Number',
          style: const TextStyle(fontSize: 42),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.read<RandomizerChangeNotifier>().generateRandomNumber();
        },
        label: const Text('Generate'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
