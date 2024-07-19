import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/pages/taps_page.dart';
import 'package:meals_app/theme/theme.dart';

void main() => runApp(
      DevicePreview(
        enabled: true,
        builder: (context) => const ProviderScope(
          child: App(),
        ),
      ),
    );

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: const TabsPage(),
    );
  }
}
