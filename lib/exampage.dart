import 'package:flutter/material.dart';
import 'package:hoclaixe/models/QuestionModel.dart';
import 'db.dart';

class ExamPage extends StatefulWidget {
  @override
  _ExamPageState createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {

  void onChange(bool b, String value) {
    selectedText = value;

    setState(() {

    });
  }

  QuestionModel question;
  @override
  void initState() {
    super.initState();


    initializeDatabase().then((v) async {
      var q = await getQuestion(v);
      this.question = q;
      setState(() {});
    });
  }

  var selectedText = "";
  List<Widget> lstTabs = [];
  List<Widget> lstQues = [];

  @override
  Widget build(BuildContext context) {

    if(question==null) return Container(color: Colors.orange,);

    var boobl = false;
    print( boobl);
//    print(selectedText);
    lstQues.clear();
    lstTabs.clear();
    for (var i = 0; i < 30; i++) {
      lstTabs.add(Tab(
        child: Text(
          'Câu ${i+1}',
          style: TextStyle(fontSize: 18),
        ),
      ));
      lstQues.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Card(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  this?.question?.zQuestion ?? '',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),

            (this.question.zImageQuestion == '')? Container() : Container(height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/imageapp/${this.question.zImageQuestion}"), fit: BoxFit.fill)),
            ),

            Card(
              child: CheckboxListTile(
                onChanged: (b) {
                  onChange(b, this?.question?.zOption1);
                },
                selected: this?.question?.zOption1 == selectedText,
                value: boobl,
                title: Text(this?.question?.zOption1),
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
            Card(
              child: CheckboxListTile(
                onChanged: (b) {
                  onChange(b, this?.question?.zOption2);
                },
                value: this?.question?.zOption2 == selectedText,
                title: Text(this?.question?.zOption2),
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
            (this?.question?.zOption3 == null) ? Container() : Card(
              child: CheckboxListTile(
                onChanged: (b) {
                  onChange(b, this?.question?.zOption3);
                },
                value: this?.question?.zOption3 == selectedText,
                title: Text(this?.question?.zOption3),
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
            (this?.question?.zOption4 == null) ? Container() : Card(
              child: CheckboxListTile(
                onChanged: (b) {
                  onChange(b, this?.question?.zOption4);
                },
                value: this?.question?.zOption4 == selectedText,
                title: Text(this?.question?.zOption4),
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
          ],
        ),
      ));
    }

    print('lstTabs:'+lstTabs.length.toString());
    print('lstQues:'+lstQues.length.toString());
    return DefaultTabController(
      length: lstTabs.length,
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
                  tabs: lstTabs,
                ),
                preferredSize: Size.fromHeight(40.0)),
          ),
          body: TabBarView(children: lstQues)),
    );
  }
}
