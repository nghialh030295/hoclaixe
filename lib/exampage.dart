import 'package:flutter/material.dart';
import 'package:hoclaixe/models/QuestionModel.dart';

import 'db.dart';

class ExamPage extends StatefulWidget {
  @override
  _ExamPageState createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  double num = 18;
  bool checkBoxState = false;
  var tabs = new List<Widget>();
  void onChange(bool b, String value) {
    if (b) {
      selectedText = value;
    } else {
      selectedText = "";
    }
    setState(() {
      //checkBoxState = value;
    });
  }

  QuestionModel q;
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 30; i++) {
      //tabs.add(value)
    }
    initializeDatabase().then((v) async {
      var q = await getQuestion(v);
      this.q = q;
      setState(() {});
    });
  }

  var selectedText = "";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 30,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Đề số 1',
              style: TextStyle(fontSize: 20.0),
            ),
            bottom: PreferredSize(
                child: TabBar(
                    isScrollable: true,
                    unselectedLabelColor: Colors.white.withOpacity(0.5),
                    indicatorColor: Colors.white,
                    tabs: [
                      Tab(
                        child: Text(
                          'Câu 1',
                          style: TextStyle(fontSize: num),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Câu 2',
                          style: TextStyle(fontSize: num),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Câu 3',
                          style: TextStyle(fontSize: num),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Câu 4',
                          style: TextStyle(fontSize: num),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Câu 5',
                          style: TextStyle(fontSize: num),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Câu 6',
                          style: TextStyle(fontSize: num),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Câu 7',
                          style: TextStyle(fontSize: num),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Câu 8',
                          style: TextStyle(fontSize: num),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Câu 9',
                          style: TextStyle(fontSize: num),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Câu 10',
                          style: TextStyle(fontSize: num),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Câu 11',
                          style: TextStyle(fontSize: num),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Câu 12',
                          style: TextStyle(fontSize: num),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Câu 13',
                          style: TextStyle(fontSize: num),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Câu 14',
                          style: TextStyle(fontSize: num),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Câu 15',
                          style: TextStyle(fontSize: num),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Câu 16',
                          style: TextStyle(fontSize: num),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Câu 17',
                          style: TextStyle(fontSize: num),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Câu 18',
                          style: TextStyle(fontSize: num),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Câu 19',
                          style: TextStyle(fontSize: num),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Câu 20',
                          style: TextStyle(fontSize: num),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Câu 21',
                          style: TextStyle(fontSize: num),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Câu 22',
                          style: TextStyle(fontSize: num),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Câu 23',
                          style: TextStyle(fontSize: num),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Câu 24',
                          style: TextStyle(fontSize: num),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Câu 25',
                          style: TextStyle(fontSize: num),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Câu 26',
                          style: TextStyle(fontSize: num),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Câu 27',
                          style: TextStyle(fontSize: num),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Câu 28',
                          style: TextStyle(fontSize: num),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Câu 29',
                          style: TextStyle(fontSize: num),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Câu 30',
                          style: TextStyle(fontSize: num),
                        ),
                      ),
                    ]),
                preferredSize: Size.fromHeight(40.0)),
          ),
          body: TabBarView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: <Widget>[
                    Card(
//                      color: Colors.grey,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          this?.q?.question ??
                              '', //"Phương tiện giao thông đường bộ" gồm những loại nào?
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Card(
                      child: CheckboxListTile(
                        onChanged: (b) {
                          onChange(b, this?.q?.OPTION1);
                        },
                        value: this?.q?.OPTION1 == selectedText,
                        title: Text(this?.q?.OPTION1),
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: Colors.orange,
                        ),
                    ),
                    Card(
                        child: Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                            onChanged: (bool value) {
                              onChange(value, this?.q?.OPTION2);
                            },
                            value: this?.q?.OPTION2 == selectedText,
                          ),
                          Flexible(
                            child: Text(
                              this?.q?.OPTION2 ?? "",
                              style: TextStyle(fontSize: 14),
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                    )),
                    Card(
                        child: Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                            onChanged: (bool value) {
                              onChange(value, this?.q?.OPTION3);
                            },
                            value: this?.q?.OPTION3 == selectedText,
                          ),
                          Flexible(
                            child: Text(
                              this?.q?.OPTION3 ?? "",
                              style: TextStyle(fontSize: 14),
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 2'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 3'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 4'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 5'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 6'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 1'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 1'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 1'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 1'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 1'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 1'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 1'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 1'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 1'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 1'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 1'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 1'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 1'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 1'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 1'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 1'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 1'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 1'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 1'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 1'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 1'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 1'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 1'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 1'),
                ),
              ),
            ],
          )),
    );
  }
}
