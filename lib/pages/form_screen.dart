import 'package:flutter/material.dart';



class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {

  List<String> faculties=["Engineering", "Science", "AHIBS"
    ,"Social Science & Humanities", "Built Enviroment & Surveying"
    ,"MJIT","Technology & Informatics"];

  String _faculties="Engineering";

  String _jk="";

  void _pilihJK(String value){
    setState(() {
      _jk=value;
    });
  }

  void pilihFaculties(String value){
    setState((){
      _faculties=value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text("SELL BOOK"),
        backgroundColor: Color(0xFF66BB6A),
      ),
      body:
      new ListView(shrinkWrap: true,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            padding: new EdgeInsets.all(10.0),
            child: new Column(
              children: <Widget>[
                new TextField(
                  decoration: new InputDecoration(
                      hintText: "Book Title",
                      labelText: "Title",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0)
                      )
                  ),
                ),

                new Padding(padding: new EdgeInsets.only(top: 20.0),),
                new TextField(
                  maxLines: 2,
                  decoration: new InputDecoration(
                      hintText: "Book Description",
                      labelText: "Description",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0)
                      )
                  ),
                ),

                new Padding(padding: new EdgeInsets.only(top: 20.0),),
                new TextField(
                  decoration: new InputDecoration(
                      hintText: "Book Price",
                      labelText: "Price",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0)
                      )
                  ),
                ),

                new Padding(padding: new EdgeInsets.only(top: 20.0),),
                new TextField(
                  decoration: new InputDecoration(
                      hintText: "Book Author",
                      labelText: "Author",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0)
                      )
                  ),
                ),

                new Padding(padding: new EdgeInsets.only(top: 20.0),),
                new TextField(
                  decoration: new InputDecoration(
                      hintText: "Book Publisher",
                      labelText: "Publisher",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0)
                      )
                  ),
                ),

                new Padding(padding: new EdgeInsets.only(top: 10.0),),
                new Row(
                  children: <Widget>[
                    new Text("  Faculty of     : ", style: new TextStyle(fontSize: 18.0),),
                    new DropdownButton(
                      onChanged:(String value){
                        pilihFaculties(value);
                      },
                      value: _faculties,
                      items: faculties.map((String value){
                        return new DropdownMenuItem(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                    )
                  ],
                ),

                new Padding(padding: new EdgeInsets.only(top: 5.0),),
                new RadioListTile(
                  value: "Lab Module",
                  title: new Text("Lab Module") ,
                  groupValue: _jk,
                  onChanged: (String value){
                    _pilihJK(value);
                  },
                  activeColor: Colors.green,
                  subtitle: new Text("Click this if the book is a Lab Module"),
                ),

                new RadioListTile(
                  value: "Text Book",
                  title: new Text("TextBook") ,
                  groupValue: _jk,
                  onChanged: (String value){
                    _pilihJK(value);
                  },
                  activeColor: Colors.green,
                  subtitle: new Text("Click this if the book is a Text Book"),
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}



