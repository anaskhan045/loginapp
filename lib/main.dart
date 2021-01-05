import 'package:flutter/material.dart';

void main() =>runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Loginapp(),
      theme: new ThemeData(
        primarySwatch: Colors.blue
      ),
    );
  }
}
class Loginapp extends StatefulWidget {
  @override
  _LoginappState createState() => _LoginappState();
}

class _LoginappState extends State<Loginapp>  with SingleTickerProviderStateMixin {

AnimationController _iconAnimationController;
Animation<double> _iconAnimation;

@override
void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
      vsync: this,
      duration: new Duration(microseconds: 500)
    );
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.easeOut
    );
    _iconAnimation.addListener(()=>this.setState((){}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.greenAccent,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/meno.jpg"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              new FlutterLogo(
                size: _iconAnimation.value *100,
              ),
              new Form(child: new Theme(
                data: new ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.blue,
                  inputDecorationTheme: new InputDecorationTheme(
                    labelStyle: new TextStyle(
                      color: Colors.blue,
                      fontSize: 30.0,
                    )
                  )
                ),
                              child: Container(
                                padding: EdgeInsets.all(40.0),
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                      new TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Enter Email"
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                    new TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Enter Passward"
                    ),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                  ),
                  new Padding(
                    padding: EdgeInsets.only(top: 40.0),
                  ),
                  new MaterialButton(
                    height: 40,
                    minWidth: 100,
                    color: Colors.blue,
                    textColor: Colors.white,
                    
                    
                    child: new Text(
                      "Login",
                      
                    ),
                    
                    onPressed: ()=>{},
                    splashColor: Colors.redAccent,
                    
                  ),
                  ],
                ),
                              ),
              ),
               
              )
            ],
          )
        ],
      ),
    );
  }
}