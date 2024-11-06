import 'package:fitness/main.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/mostmuscular.jpg"),opacity: 1.0,fit: BoxFit.cover),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: firstNameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[900],
                      label: Text("First Name",style: TextStyle(color: Colors.white),),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        )
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: lastNameNameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[900],
                      label: Text("Last Name",style: TextStyle(color: Colors.white),),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[900],
                      label: Text("Email",style: TextStyle(color: Colors.white),),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: passController,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[900],
                      label: Text("Password",style: TextStyle(color: Colors.white),),
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.visibility_off,color: Colors.white,),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      if(firstNameController.text.toString().isNotEmpty 
                          && lastNameNameController.text.toString().isNotEmpty 
                          && emailController.text.toString().isNotEmpty 
                          && passController.text.toString().isNotEmpty){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
                      }
                      else{
                        VxToast.show(context, msg: 'Please fill all the fields....');
                      }
                    },
                    child: Text('SIGNUP'),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
