import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('TAS.Mobile'),
      ),
      body: new Container(
        child: new ListView(
          children: <Widget>[
            new Padding(padding: new EdgeInsets.only(top: 15.0)),
            new Image.asset('images/logo.jpg'),
            new Text(
                "Selamat Datang, Silahkan Login dengan Username dan Password Anda",
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            new Padding(padding: new EdgeInsets.only(top: 20.0)),
            new TextField(
              decoration: new InputDecoration(
                  hintText: "Username",
                  labelText: "Username",
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.0))),
            ),
            new Padding(padding: new EdgeInsets.only(top: 20.0)),
            new TextField(
              obscureText: true,
              decoration: new InputDecoration(
                  hintText: "Password",
                  labelText: "Password",
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.0))),
            ),
            new Center(
                child: new RaisedButton(
              child: new Text("Login"),
              color: Colors.blue[400],
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HalamanUtama()),
                );
              },
            )),
            new Center(
                child: new RaisedButton(
              child: new Text("Sign in with Google"),
              color: Colors.white,
              onPressed: () {},
            )),
          ],
        ),
      ),
    );
  }
}

class HalamanUtama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Menu'),
      ),
      body: new Container(
        child: new ListView(
          children: <Widget>[
            new Text(
              "Halaman Utama",
              style:
                  new TextStyle(fontSize: 25.0, color: Colors.lightBlue[600]),
            ),
            new Padding(padding: new EdgeInsets.only(top: 20.0)),
            new Center(
                child: new RaisedButton(
              child: new Text("Lihat Jobdesk"),
              color: Colors.blue,
              onPressed: () {},
            )),
            new Center(
                child: new RaisedButton(
              child: new Text("Isi Absensi"),
              color: Colors.blue,
              onPressed: () {},
            )),
            new Center(
                child: new RaisedButton(
              child: new Text("Input Jurnal Harian"),
              color: Colors.blue,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            )),
            new Center(
                child: new RaisedButton(
              child: new Text("Logout"),
              color: Colors.blue,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> unitkerja = [
    "Administrasi",
    "Pustakawan",
    "Laboran",
    "Tukang Kebun",
    "Satpam",
    "Penjaga Malam"
  ];

  String _unitkerja = "Administrasi";

  TextEditingController controllerNip = new TextEditingController();
  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerHari = new TextEditingController();
  TextEditingController controllerJurnal = new TextEditingController();

  void pilihUnitkerja(String value) {
    setState(() {
      _unitkerja = value;
    });
  }

  void kirimdata() {
    AlertDialog alertDialog = new AlertDialog(
        content: new Container(
            height: 200.00,
            child: new Column(
              children: <Widget>[
                new Text("NIP/No Urut Pegawai: ${controllerNip.text}"),
                new Text("Nama Pegawai: ${controllerNama.text}"),
                new Text("Hari Tanggal: ${controllerHari.text}"),
                new Text("Jurnal Harian: ${controllerJurnal.text}"),
                new Text("Unit Kerja: $_unitkerja"),
                new RaisedButton(
                  child: new Text("OK"),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            )));
    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new Icon(Icons.list),
        title: new Text("Tas.Mobile"),
        backgroundColor: Colors.blue[200],
      ),
      body: ListView(
        children: [
          new Container(
            padding: new EdgeInsets.all(10.0),
            child: new Column(
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Padding(
                      padding: new EdgeInsets.only(top: 20),
                    ),
                    new Text(
                      "Jurnal Harian Pegawai",
                      style: new TextStyle(
                          fontSize: 25.0, color: Colors.lightBlue[600]),
                    ),
                  ],
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20),
                ),
                new TextField(
                    controller: controllerNip,
                    decoration: new InputDecoration(
                        hintText: "NIP/ No Urut Pegawai",
                        labelText: "NIP/No Urut Pegawai",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10)))),
                new Padding(
                  padding: new EdgeInsets.only(top: 20),
                ),
                new TextField(
                    controller: controllerNama,
                    decoration: new InputDecoration(
                        hintText: "Nama Pegawai",
                        labelText: "Nama Pegawai",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10)))),
                new Padding(
                  padding: new EdgeInsets.only(top: 20),
                ),
                new TextField(
                    controller: controllerHari,
                    decoration: new InputDecoration(
                        hintText: "Hari Tanggal",
                        labelText: "Hari Tanggal",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10)))),
                new Padding(
                  padding: new EdgeInsets.only(top: 20),
                ),
                new TextField(
                    controller: controllerJurnal,
                    maxLines: 5,
                    decoration: new InputDecoration(
                        hintText: "Tulis Jurnal Kerja",
                        labelText: "Tulis Jurnal Kerja",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10)))),
                new Padding(
                  padding: new EdgeInsets.only(top: 20),
                ),
                new Row(
                  children: <Widget>[
                    new Text(
                      "Unit kerja",
                      style: new TextStyle(
                          fontSize: 20.0, color: Colors.lightBlue),
                    ),
                  ],
                ),
                new DropdownButton(
                  onChanged: (String value) {
                    pilihUnitkerja(value);
                  },
                  value: _unitkerja,
                  items: unitkerja.map((String value) {
                    return new DropdownMenuItem(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                ),
                new RaisedButton(
                  child: new Text("OK"),
                  color: Colors.blue,
                  onPressed: () {
                    kirimdata();
                  },
                ),
                new Center(
                    child: new RaisedButton(
                  child: new Text("Kembali ke menu utama"),
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HalamanUtama()),
                    );
                  },
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
