import 'package:flutter/material.dart';
import './home_page.dart';
import './buy.dart';
import './cart.dart';
import './form_screen.dart';
import '../services/authentication.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key key, this.auth, this.userId, this.onSignedOut})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;

  @override
  _MenuPageState createState() => _MenuPageState();
}

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}

class _MenuPageState extends State<MenuPage> {

  var selectedItem = 'SELL';
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String _userId = "";

  @override
  void initState() {
    void _onSignedOut() {
      setState(() {
        authStatus = AuthStatus.NOT_LOGGED_IN;
        _userId = "";
      });
    }

  }


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 490.0,
              ),
              ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black, Colors.transparent])
                        .createShader(
                            Rect.fromLTRB(0, 0, rect.width, rect.height));
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.asset('img/.png',
                      height: 345.0, fit: BoxFit.fitHeight)),
              RotatedBox(
                quarterTurns: 3,
                child: Text('BOOKSTUDIO',
                    style: TextStyle(
                        fontSize: 48.0,
                        color: Colors.white.withOpacity(0.3),
                        letterSpacing: 14.0)),
              ),
              Positioned(
                top: 1.0,
                right: 8.0,
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white),
                  child: Center(
                    child: Icon(Icons.menu),
                  ),
                ),
              ),
              Positioned(
                top: 2.0,
                right: 5.0,
                child: Container(
                  height: 12.0,
                  width: 12.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Color(0xFFFFFFFF)),
                ),
              ),
              Positioned(
                  top: 320.0,
                  left: 43.0,
                  child: Column(
                    children: <Widget>[
                      Text('Hello, ',
                          style: TextStyle(
                              fontSize: 35.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white))
                    ],
                  )),
              Positioned(
                  top: 350.0,
                  left: 43.0,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('WELCOME',
                              style: TextStyle(
                                  fontSize: 45.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green)),
                        ],
                      )
                    ],
                  )),
              Positioned(
                  top: 420.0,
                  left: 43.0,
                  right: 25.0,
                  child: Container(
                      height: 55.0,
                      decoration: BoxDecoration(
                          color: Color(0xFF262626),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15.0),
                              bottomLeft: Radius.circular(15.0),
                              topLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0))),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search book',
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Montserrat',
                                fontSize: 19.0),
                            contentPadding: EdgeInsets.only(top: 15.0),
                            prefixIcon: Icon(Icons.search, color: Colors.grey)),
                      )))
            ],
          ),
          //Get out of the stack for the options
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            InkWell(child: _buildMenuItem('SELL', Icons.store), onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> FormScreen()));
            },),
            InkWell(child: _buildMenuItem('PROFILE', Icons.account_circle), onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
            },),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            InkWell(child: _buildMenuItem('BUY', Icons.shopping_basket), onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> BuyPage()));
            },),
            InkWell(child: _buildMenuItem('CART', Icons.shopping_cart), onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> CartPage()));
            },),

          ]),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String itemName, iconData) {
    return AnimatedContainer(
        curve: Curves.easeIn,
        duration: Duration(milliseconds: 300),
        height: selectedItem == itemName ? 100.0 : 75.0,
        width: selectedItem == itemName ? 100.0 : 75.0,
        color:
            selectedItem == itemName ? Color(0xFF9CCC65) : Colors.transparent,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            iconData,
            color: selectedItem == itemName ? Colors.white : Colors.white,
            size: 25.0,
          ),
          SizedBox(height: 12.0),
          Text(itemName,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: selectedItem == itemName ? Colors.white : Colors.white,
                  fontSize: 12.0))
        ]));

  }

  selectMenuOption(String itemName) {
    setState(() {
      selectedItem = itemName;
    });
  }

}
