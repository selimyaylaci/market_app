import 'package:flutter/services.dart';
import 'package:market_app/feature/credential/view/_view_exports.dart';
import 'core/_core_exports.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.deepPurple,
      statusBarIconBrightness: Brightness.dark
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: "Note Mobile",
      home: HomePage(),
      debugShowCheckedModeBanner: false, // emülatör ün sağ üstundeki yazıyı kaldırır
    );
  }
}
