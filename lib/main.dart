import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/provider_sample_page.dart';
import 'package:riverpod_test/state_notifier_provider_sample.dart';
import 'package:riverpod_test/state_provider_sample_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'RiverPod Test Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const providerSamplePage = 'Provider Sample Page';
    const stateProviderSamplePage = 'StateProvider Sample Page';
    const stateNotifierProviderSamplePage = 'StateNotifierProvider Sample Page';

    final pages = [
      const HomeCard(
        title: providerSamplePage,
        page: ProviderSamplePage(
          title: providerSamplePage,
        ),
      ),
      const HomeCard(
        title: stateProviderSamplePage,
        page: StateProviderSamplePage(
          title: stateProviderSamplePage,
        ),
      ),
      const HomeCard(
        title: stateNotifierProviderSamplePage,
        page: StateNotifierProviderSamplePage(
          title: stateNotifierProviderSamplePage,
        ),
      ),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: pages
              .map((e) => e)
              .expand((element) => [element, const SizedBox(height: 8)])
              .toList(),
        ),
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard({
    Key? key,
    required this.title,
    required this.page,
  }) : super(key: key);

  final String title;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          title: Text(title),
          onTap: () => Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => page,
                ),
              )),
    );
  }
}
