import 'package:flutter/material.dart';
import 'package:hoclaixe/models/SignModel.dart';
import 'db.dart';

class SignPage extends StatefulWidget {
  @override
  _SignPageState createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  List<SignModel> lstSign;
  SignModel sign;
  @override
  void initState() {
    super.initState();

    initializeDatabase().then((v) async {
      var sign = await getSign(v);
      this.sign = sign;
      var listsign = await getListSign(v,10);
      this.lstSign = listsign;
      setState(() {});
    });
  }
  Widget build(BuildContext context) {

    return  DefaultTabController(
        length: 1,
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Biển báo giao thông',
                style: TextStyle(fontSize: 20.0),
              ),
              bottom: PreferredSize(
                  child: TabBar(
                    isScrollable: true,
                    unselectedLabelColor: Colors.white.withOpacity(0.5),
                    indicatorColor: Colors.white,
                    tabs:<Widget>[Text("test")] ,
                  ),
                  preferredSize: Size.fromHeight(40.0)),
            ),
            body: TabBarView(children:<Widget>[
              ListView(children:  this.lstSign.map((f)=> trafficSign(f)).toList(),)
            ]
            )),
    );
  }

  Widget trafficSign(SignModel sign) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/imageapp/${sign.zImageSign}"),
                  )),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(sign.zNameSign, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  Text(sign.zDescSign, style: TextStyle(fontSize: 16),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
