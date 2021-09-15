import 'dart:html';

import 'package:flutter/material.dart';

void main (){
  runApp(new MaterialApp(
    home: new Home(),
    theme: ThemeData(
      brightness: Brightness.dark,
    ),
  ));
}

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();

// membuat type data selectedDate
  DateTime selectedDate = DateTime.now();

// membuat fungsi untuk load data tanggal
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

// Membuat Textfield Controller
  TextEditingController controllerNama= new TextEditingController();
  TextEditingController controllerAlamat= new TextEditingController();
  TextEditingController controllerEmail= new TextEditingController();
  TextEditingController controllerHp= new TextEditingController();
  
// Membuat class Radiobutton
  String? _vaksin="";

  void _pilihvaksin(String? value){
    setState((){
      _vaksin=value;
    });
  }
  
// class boolean untuk checkbox
  bool? _checkbox1 = false;
  bool? _checkbox2 = false;
  bool? _checkbox3 = false;
  
// Method Submit untuk Alert Dialog 
  void submit(){
    AlertDialog alertDialog = new AlertDialog(
      content: new Container(
        height: 200.0,
        child: new Column(
          children: <Widget>[
            new Text("Nama Lengkap : ${controllerNama.text}"),
            new Text("Alamat : ${controllerAlamat.text}"),
            new Text("Email : ${controllerEmail.text}"),
            new Text("No Telepon : ${controllerHp.text}"),
            new Text("Jenis Vaksin : $_vaksin"),
            new Text("Tanggal Vaksin : $selectedDate"),
            new ElevatedButton(
              child: new Text('Ok'),
              onPressed: ()=>Navigator.pop(context),
            )
          ],
        ),
      ),
    );
    showDialog(
    context: context, 
    builder : (BuildContext context){
      return alertDialog;
    },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new Icon(Icons.list),
        title: new Text("Formulir"),
        backgroundColor: Colors.lightBlue,
      ),

      body: new ListView(
        key: _formKey,
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.all(10.0),
            child: new Column(
              children: <Widget>[
                new Text('Formulir Pendaftaran Vaksin', style: TextStyle(
                  fontSize: 20,
                ),
                ),

              // Widget TextFormfield
                new Padding(padding: new EdgeInsets.only(bottom: 20.0),),
                new TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controllerNama,
                  autofocus: true,
                  decoration: new InputDecoration(
                    hintText: "Nama Lengkap",
                    labelText: "Nama Lengkap",
                    icon: Icon(Icons.people),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0)
                    ),
                  ),
                  validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
                ),

                new Padding(padding: new EdgeInsets.only(top: 20.0),),
                new TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controllerAlamat,
                  decoration: new InputDecoration(
                    hintText: "Alamat",
                    labelText: "Alamat",
                    icon: Icon(Icons.home),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0)
                    ),
                  ),
                  validator: (value) {
                  if (value!.isEmpty) {
                    return 'Alamat tidak boleh kosong';
                  }
                  return null;
                },
                ),

                new Padding(padding: new EdgeInsets.only(top: 20.0),),
                new TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controllerEmail,
                  decoration: new InputDecoration(
                    hintText: "Email",
                    labelText: "Email",
                    icon: Icon(Icons.email),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0)
                    ),
                  ),
                  validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email tidak boleh kosong';
                  }
                  return null;
                },
                ),

                new Padding(padding: new EdgeInsets.only(top: 20.0),),
                new TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controllerHp,
                  keyboardType: TextInputType.phone,
                  decoration: new InputDecoration(
                    hintText: "No. Telepon",
                    labelText: "No. Telepon",
                    icon: Icon(Icons.phone),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0)
                    ),
                  ),
                  validator: (value) {
                  if (value!.isEmpty) {
                    return 'No. Telepon tidak boleh kosong';
                  }
                  return null;
                },
                ),

              // Checkbox Widget
                new Padding(padding: new EdgeInsets.only(top: 20.0),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    new Text('Pilih Lokasi Vaksin :', style: TextStyle(
                      fontSize: 20,
                    ),
                    ),
                  ],
                ),
                new CheckboxListTile(
                  title: Text('Kota Tangerang'),
                  subtitle: Text('Karawaci, Cipondoh, Jatiuwung, Ciledug'),
                  activeColor: Colors.deepPurpleAccent,
                  onChanged: (bool? value) {
                    setState(() => this._checkbox1 = value);
                  },
                  value: this._checkbox1,
                ),

                new CheckboxListTile(
                  title: Text('Kota Tangerang Selatan'),
                  subtitle: Text('Serpong, Pamulang, Ciputat'),
                  activeColor: Colors.deepPurpleAccent,
                  onChanged: (bool? value) {
                    setState(() => this._checkbox2 = value);
                  },
                  value: this._checkbox2,
                ),

                new CheckboxListTile(
                  title: Text('Kabupaten Tangerang'),
                  subtitle: Text('Curug, Legok, Pagedangan'),
                  activeColor: Colors.deepPurpleAccent,
                  onChanged: (bool? value) {
                    setState(() => this._checkbox3 = value);
                  },
                  value: this._checkbox3,
                ),

              // Radio button
                new Padding(padding: new EdgeInsets.only(top: 20.0),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    new Text('Pilih jenis vaksin', style: TextStyle(
                      fontSize: 20,
                    ),
                    ),
                  ],
                ),
                new RadioListTile(
                  value: "Sinovac",
                  title: new Text("Sinovac"),
                  groupValue: _vaksin,
                  onChanged: (String? value){
                    _pilihvaksin(value);
                  },
                ),

                new RadioListTile(
                  value: "AstraZeneca",
                  title: new Text("AstraZeneca"),
                  groupValue: _vaksin,
                  onChanged: (String? value){
                    _pilihvaksin(value);
                  },
                ),

                 new RadioListTile(
                  value: "Moderna",
                  title: new Text("Moderna"),
                  groupValue: _vaksin,
                  onChanged: (String? value){
                    _pilihvaksin(value);
                  },
                ),

              // widget Date picker
                new Padding(padding: new EdgeInsets.only(top: 20.0),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    new Text('Pilih Tanggal vaksin', style: TextStyle(
                      fontSize: 20,
                    ),
                    ),
                  ],
                ),
                new Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.calendar_today
                      ),
                      Text("${selectedDate.toLocal()}".split(' ')[0]
                      ),
                      SizedBox(height: 20.0,),
                      ElevatedButton(
                        onPressed: () => {
                          _selectDate(context),
                          print(selectedDate.day + selectedDate.month + selectedDate.year )
                        },
                        child: Text('Pilih Tanggal'),
                      ),
                    ],
                  ),
                ),
                
              // Submit button
                new Padding(padding: new EdgeInsets.only(top: 20.0),),
                new ElevatedButton(
                  child: Text('Submit', 
                  style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    submit();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

