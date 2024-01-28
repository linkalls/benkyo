import 'package:flutter/material.dart';
import 'busshitunokousei.dart';
import 'kagakuketugou.dart';
import 'busshitunohennka.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // これを追加するだけ
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system, // Use system settings
      home: const MyHomePage(title: 'My Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dropdownValue = '理科';
  String subjectValue = '科学基礎';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            DropdownButton<String>(
              value: dropdownValue,
              items: <String>['', '理科', '社会', '数学', '国語', '英語', '家庭科', '保健']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                  subjectValue = '';
                });
              },
            ),
            if (dropdownValue == '理科')
              DropdownButton<String>(
                value: subjectValue,
                items: <String>['', '科学基礎', '生物基礎', '物理基礎']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    subjectValue = newValue!;
                  });
                },
              ),
            if (dropdownValue == '数学')
              DropdownButton<String>(
                value: subjectValue,
                items: <String>["", '数学I', '数学II', '数学A', '数学B']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    subjectValue = newValue!;
                  });
                },
              ),
            if (dropdownValue == '英語')
              DropdownButton<String>(
                value: subjectValue,
                items: <String>["", 'コミュニケーション英語', '論理表現']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    subjectValue = newValue!;
                  });
                },
              ),
            if (dropdownValue == '物理')
              DropdownButton<String>(
                value: subjectValue,
                items: <String>['', '運動とエネルギー', '熱', '波', '電気', '物理学']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    subjectValue = newValue!;
                  });
                },
              ),
            if (dropdownValue == '社会')
              DropdownButton<String>(
                value: subjectValue,
                items: <String>["", '地理総合', '歴史総合']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    subjectValue = newValue!;
                  });
                },
              ),
            Visibility(
              visible: subjectValue == '',
              child: const ElevatedButton(
                onPressed: null, // Disable the button
                child: Text('科目を選択してください'),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: List.generate(6, (index) {
                  String subjectText = '';
                  if (subjectValue == '科学基礎') {
                    switch (index) {
                      case 0:
                        subjectText = '物質の構成';
                        break;
                      case 1:
                        subjectText = '化学結合';
                        break;
                      case 2:
                        subjectText = '物質の変化';
                        break;
                    }
                  } else if (subjectValue == '物理基礎') {
                    switch (index) {
                      case 0:
                        subjectText = '運動とエネルギー';
                        break;
                      case 1:
                        subjectText = '熱';
                        break;
                      case 2:
                        subjectText = '波';
                        break;
                      case 3:
                        subjectText = '電気';
                        break;
                      case 4:
                        subjectText = '物理学';
                        break;
                    }
                  } else if (subjectValue == '生物基礎') {
                    //ここを書き換える
                    switch (index) {
                      case 0:
                        subjectText = '運動とエネルギー';
                        break;
                      case 1:
                        subjectText = '熱';
                        break;
                      case 2:
                        subjectText = '波';
                        break;
                      case 3:
                        subjectText = '電気';
                        break;
                      case 4:
                        subjectText = '物理学';
                        break;
                    }
                  }
                  if (subjectText != '') {
                    return ElevatedButton(
                      onPressed: () {
                        switch (subjectText) {
                          case '物質の構成':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BusshitunokouseiPage()),
                            );
                            break;
                          case '化学結合':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => KagakuketugouPage()),
                            );
                            break;
                          case '物質の変化':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BusshitunohennkaPage()),
                            );
                            break;
                        }
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.all(20)),
                        minimumSize: MaterialStateProperty.all<Size>(
                            const Size(200, 200)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                      child: Text(subjectText),
                    );
                  } else {
                    return Container(); // Return an empty container if subjectText is empty
                  }
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
