import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterChangeNotifierProvider =
    ChangeNotifierProvider((ref) => ChangeNotifierSampleNotifier());

class ChangeNotifierSampleNotifier extends ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }

  void decrement() {
    count--;
    notifyListeners();
  }
}

class ChangeNotifierProviderSamplePage extends ConsumerWidget {
  const ChangeNotifierProviderSamplePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int counter = ref.watch(counterChangeNotifierProvider).count;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () =>
                ref.read(counterChangeNotifierProvider.notifier).increment(),
            tooltip: 'Increment',
            heroTag: 1,
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 12),
          FloatingActionButton(
            onPressed: () =>
                ref.read(counterChangeNotifierProvider.notifier).decrement(),
            tooltip: 'Decrement',
            heroTag: 2,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
