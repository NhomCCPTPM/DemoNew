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
      body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              Padding (
                padding: EdgeInsets.all(8),
                child: TextField(
                  decoration: const InputDecoration (
                    labelText: 'Số thứ nhất',
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.star_rate),
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  controller: txtsothunhat,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: TextField(
                  decoration: const InputDecoration (
                    labelText: 'Số thứ hai',
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.nightlight_round),
                  ),
                  keyboardType: TextInputType.number,
                  controller: txtsothuhai,
                ),
              ),
              ListTile(
                title: const Text('Cộng'),
                leading: Radio<PhepTinh>(
                  value: PhepTinh.cong,
                  groupValue: _pheptinh,
                  onChanged: (PhepTinh? value) {
                    setState(() {
                      _pheptinh = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Trừ'),
                leading: Radio<PhepTinh>(
                  value: PhepTinh.tru,
                  groupValue: _pheptinh,
                  onChanged: (PhepTinh? value) {
                    setState(() {
                      _pheptinh = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Nhân'),
                leading: Radio<PhepTinh>(
                  value: PhepTinh.nhan,
                  groupValue: _pheptinh,
                  onChanged: (PhepTinh? value) {
                    setState(() {
                      _pheptinh = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Chia'),
                leading: Radio<PhepTinh>(
                  value: PhepTinh.chia,
                  groupValue: _pheptinh,
                  onChanged: (PhepTinh? value) {
                    setState(() {
                      _pheptinh = value!;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: ElevatedButton(
                  onPressed: () {
                    var a = double.parse(txtsothunhat.text);
                    var b = double.parse(txtsothuhai.text);
                    ketqua = tinhToan(a, b, _pheptinh);
                    txtketqua.text = lamTron(ketqua, isChecked);
                  },
                  child: const Text('Kết quả'),
                ),
              ),
              Padding (
                padding: EdgeInsets.all(8),
                child: TextField(
                  readOnly: true,
                  decoration: const InputDecoration (
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.settings),
                  ),
                  controller: txtketqua,
                ),
              ),
              ListTile(
                leading: Checkbox (
                  value: isChecked,
                  onChanged: (bool? value){
                    setState(() {
                      isChecked = value;
                    });
                    txtketqua.text = lamTron(ketqua, isChecked);
                  },
                ),
                title: const Text("Làm tròn số"),
              ),
            ],
          ),
      ), 
    );
  }
}
