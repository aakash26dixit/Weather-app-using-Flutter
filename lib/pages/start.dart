import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';


class weatherPage extends StatefulWidget {

  @override
  _weatherPageState createState() => _weatherPageState();
}

class _weatherPageState extends State<weatherPage> {
  String name = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>(); 

  moveBack(BuildContext)async{
    if(_formKey.currentState.validate()){
      setState(() {
        changeButton = true;                  
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.firstRoute);
      setState(() {
          changeButton = false;                  
      });
    }              
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
        child: SingleChildScrollView( 
        child:Form(
          key: _formKey,
          child: Column(
            children: [
              // Image.asset(
              //   // "assets/images/login_image.png",
              //   fit:BoxFit.contain
              // ),
              SizedBox(
                height: 60.0,
              ),
              Text("Welcome $name",
                style:TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                )
              ), 
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  TextFormField(
                  decoration:InputDecoration(
                    hintText: "Enter Username",
                    labelText: "Username"
                  ), 
                  validator: (value){
                    if(value.isEmpty){
                      return "Username can't be empty";
                    }
                    else if(value.length < 6){
                      return "Username should contain atleast 6 letters";
                    }
                    return null;
                  },
                  onChanged: (value){
                    name = value;
                    setState(() {});
                  },
                ),

                 SizedBox(
                  height: 20.0,
                ),

                  TextFormField(
                  decoration:InputDecoration(
                    hintText: "Enter Location",
                    labelText: "Location"
                  ), 
                  validator: (value){
                    if(value.isEmpty){
                      return "Location can't be empty";
                    }
                    else if(value.length < 6){
                      return "Location should contain atleast 6 letters";
                    }
                    return null;
                  },
                ),

 

                ],),
              ),
              SizedBox(
                height: 20.0,
              ),
              Material(
                child: InkWell(
                  onTap: () => moveBack(context),
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    height: 50,
                    width: changeButton ? 50 : 150,
                    child: changeButton?Icon(Icons.done, color: Colors.white) : Text(
                      "GO!!",
                      style: TextStyle(
                        color:Colors.white,
                        fontWeight: FontWeight.bold
                        ),
                    ),
                    alignment: Alignment.center ,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(
                        changeButton ? 20 : 8,
                      )
                    )
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}