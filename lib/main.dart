import 'package:flutter/material.dart';

//Main scene
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Giáng Long Thập Bát Chưởng',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Nhất Dương Chỉ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum PhepTinh { cong, tru, nhan, chia }
class _MyHomePageState extends State<MyHomePage> {
  final txtSoThuNhat = TextEditingController();
  final txtSoThuHai = TextEditingController();
  final txtKetQua = TextEditingController();
  PhepTinh _phepTinh = PhepTinh.cong;
  bool isChecked = true;
  double ketQua = 0;
  @override
  void dispose() {
    txtSoThuNhat.dispose();
    txtSoThuHai.dispose();
    txtKetQua.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: Column()),
    );
  }
}
