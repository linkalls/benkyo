import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
  String subjectValue = '化学基礎';

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
                items: <String>['', '化学基礎', '生物基礎', '物理基礎']
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
            if (subjectValue != '') Text('選択された科目: $subjectValue'),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: List.generate(6, (index) {
                  return ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.all(20)),
                      minimumSize:
                          MaterialStateProperty.all<Size>(const Size(200, 200)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    child: Text('Subject $index'),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
