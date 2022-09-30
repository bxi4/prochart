import 'package:flutter/material.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'متوسط السعر للاسهم',
      home: const MyHomePage(),

      // theme: ThemeData(fontFamily: ArabicFonts.Cairo,),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final c1 = TextEditingController();
  final c2 = TextEditingController();
  final c3 = TextEditingController();
  final c4 = TextEditingController();
  final c5 = TextEditingController();
  final c6 = TextEditingController();

  final p1 = TextEditingController();
  final p2 = TextEditingController();
  final p3 = TextEditingController();
  final p4 = TextEditingController();
  final p5 = TextEditingController();
  final p6 = TextEditingController();
  final res = TextEditingController();

  int intOrString(dynamic o) {
    if (o is String) o = int.tryParse(o);
    return o ?? 0;
  }

  void sum() {
    // if(pc1)
    int pc1 = intOrString(c1.text);
    int pc2 = intOrString(c2.text);
    int pc3 = intOrString(c3.text);
    int pc4 = intOrString(c4.text);
    int pc5 = intOrString(c5.text);
    int pc6 = intOrString(c6.text);

    var result = ((pc1 * intOrString(p1.text) +
            pc2 * intOrString(p2.text) +
            pc3 * intOrString(p3.text) +
            pc4 * intOrString(p4.text) +
            pc5 * intOrString(p5.text) +
            pc6 * intOrString(p6.text)) /
        (pc1 + pc2 + pc3 + pc4 + pc5 + pc6));

    res.text = ((100 * result).round() / 100).toString();
  }

  void launchTelegram() async {
    String url = "https://telegram.me/professorchart";
    print("launchingUrl: $url");
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 233, 211, 211),
          child: ListView(
            children: <Widget>[
              Image.asset("assets/prochart.jpg"),
              ListTile(
                  trailing: Icon(FontAwesomeIcons.telegram),
                  iconColor: HexColor('#2AABEE'),
                  title: Text("Telegram", style: TextStyle(fontSize: 15)),
                  onTap: () => launchTelegram()),
              ListTile(
                trailing: Icon(FontAwesomeIcons.circleInfo),
                iconColor: Colors.green,
                title: Text(
                  'About',
                  style: TextStyle(fontSize: 15),
                ),
                onTap: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('حاسبة متوسط سعر السهم'),
                      content: const Text(
                          'تطبيق حاسبة متوسط سعر الاسهم للتواصل معنا عبر تليجرام @professorchart'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () => launchTelegram(),
                icon: Icon(FontAwesomeIcons.telegram))
          ],

          // automaticallyImplyLeading: false,
          // leading: IconButton(
          //   icon: Icon(Icons.menu),
          //   onPressed: () {},
          // ),
          backgroundColor: Color.fromARGB(255, 29, 65, 94),
          title: Text(
            "حاسبة متوسط سعر السهم",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Cairo'),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 27, 43, 56),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Column(children: [
              Container(
                padding:
                    EdgeInsets.only(top: 12, left: 14, bottom: 14, right: 14),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "قم بإدخال قيمة شراء السهم وكمية الأسهم في المرة الاولى , ثم قيمة السهم حاليا وكمية الاسهم في الخانات الثانية والثالثة .. الخ كلما شريت مجموعة بقيمة وكمية معينة إدخلها في أحدى الخانات الستة لتحصل على متوسط السعر",
                  style: PersianFonts.Samim.copyWith(
                      fontSize: 14, color: Colors.white),
                  textDirection: TextDirection.rtl,
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: Column(
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "سعر السهم",
                            style: TextStyle(
                                fontSize: 17,
                                color: Color.fromRGBO(226, 226, 226, 1),
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Cairo'),
                          ),
                          VerticalDivider(
                            color: Colors.white,
                            thickness: 1.5,
                          ),
                          Text(
                            "عدد الاسهم",
                            style: TextStyle(
                                fontSize: 17,
                                color: Color.fromRGBO(226, 226, 226, 1),
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Cairo'),
                          )
                        ],
                      ),
                    ),
                    Divider(color: Colors.white, thickness: 1),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 95,
                            height: 43,
                            child: TextFormField(
                              controller: c1,
                              textAlignVertical: TextAlignVertical.top,
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          VerticalDivider(
                            color: Colors.white,
                            thickness: 1.9,
                          ),
                          SizedBox(
                            width: 95,
                            height: 43,
                            child: TextFormField(
                                controller: p1,
                                textAlignVertical: TextAlignVertical.top,
                                keyboardType: TextInputType.number,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    border: OutlineInputBorder())),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 95,
                            height: 43,
                            child: TextFormField(
                              controller: c2,
                              textAlignVertical: TextAlignVertical.top,
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          VerticalDivider(
                            color: Colors.white,
                            thickness: 1.9,
                          ),
                          SizedBox(
                            width: 95,
                            height: 43,
                            child: TextFormField(
                                controller: p2,
                                textAlignVertical: TextAlignVertical.top,
                                keyboardType: TextInputType.number,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    border: OutlineInputBorder())),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 95,
                            height: 43,
                            child: TextFormField(
                              controller: c3,
                              textAlignVertical: TextAlignVertical.top,
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          VerticalDivider(
                            color: Colors.white,
                            thickness: 1.9,
                          ),
                          SizedBox(
                            width: 95,
                            height: 43,
                            child: TextFormField(
                                controller: p3,
                                textAlignVertical: TextAlignVertical.top,
                                keyboardType: TextInputType.number,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    border: OutlineInputBorder())),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 95,
                            height: 43,
                            child: TextFormField(
                              controller: c4,
                              textAlignVertical: TextAlignVertical.top,
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          VerticalDivider(
                            color: Colors.white,
                            thickness: 1.9,
                          ),
                          SizedBox(
                            width: 95,
                            height: 43,
                            child: TextFormField(
                                controller: p4,
                                textAlignVertical: TextAlignVertical.top,
                                keyboardType: TextInputType.number,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    border: OutlineInputBorder())),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 95,
                            height: 43,
                            child: TextFormField(
                              controller: c5,
                              textAlignVertical: TextAlignVertical.top,
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          VerticalDivider(
                            color: Colors.white,
                            thickness: 1.9,
                          ),
                          SizedBox(
                            width: 95,
                            height: 43,
                            child: TextFormField(
                                controller: p5,
                                textAlignVertical: TextAlignVertical.top,
                                keyboardType: TextInputType.number,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    border: OutlineInputBorder())),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 95,
                            height: 43,
                            child: TextFormField(
                              controller: c6,
                              textAlignVertical: TextAlignVertical.top,
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          VerticalDivider(
                            color: Colors.white,
                            thickness: 1.9,
                          ),
                          SizedBox(
                            width: 95,
                            height: 43,
                            child: TextFormField(
                                controller: p6,
                                textAlignVertical: TextAlignVertical.top,
                                keyboardType: TextInputType.number,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    border: OutlineInputBorder())),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Divider(color: Colors.white, thickness: 1),
                    ElevatedButton(
                      onPressed: () => sum(),
                      child: Text(
                        "احسب متوسط السعر للاسهم",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                        primary: Colors.green,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      padding: EdgeInsets.only(left: 180),
                      width: double.infinity,
                      alignment: Alignment.centerRight,
                      child: Column(
                        children: [
                          Row(
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("متوسط السعر لأجمالي الاسهم",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white)),
                              Icon(
                                Icons.sunny,
                                color: Colors.yellow[600],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 50,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: res,
                              textAlignVertical: TextAlignVertical.top,
                              enabled: false,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 221, 221, 221),
                                  fontSize: 20),
                              decoration: InputDecoration(
                                  disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 249, 249, 249)))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ));
  }
}
