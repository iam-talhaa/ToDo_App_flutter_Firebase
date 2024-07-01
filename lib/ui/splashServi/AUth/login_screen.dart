import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_flutter_firebase/UTILS/utils.dart';
import 'package:todo_flutter_firebase/WIDGETS/roundedButton.dart';
import 'package:todo_flutter_firebase/ui/posts/postscreen.dart';
import 'package:todo_flutter_firebase/ui/splashServi/AUth/signup_screen.dart';
import 'package:todo_flutter_firebase/ui/splashServi/login_withPhoneNumer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isloading = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign IN Screen',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      'Sign Up ',
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.lightGreen,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Email';
                          } else
                            null;
                        },
                        keyboardType: TextInputType.text,
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail),
                          hintText: 'Enter your Email',
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Password';
                          } else
                            null;
                        },
                        keyboardType: TextInputType.number,
                        controller: passcontroller,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          hintText: 'Enter your Password',
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        )),
                    SizedBox(
                      height: 25,
                    ),
                    RoundedButton(
                        loading: isloading,
                        name: 'Sign UP',
                        ontap: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              isloading = true;
                            });
                            _auth
                                .signInWithEmailAndPassword(
                                    email: emailController.text.toString(),
                                    password: passcontroller.text.toString())
                                .then((value) {
                              setState(() {
                                isloading = false;
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        PostScreen()));
                              });
                              Utils().ShowToast("SignIn Successfully");
                            }).onError((error, stackTrace) {
                              setState(() {
                                isloading = false;
                              });
                              Utils().ShowToast(error.toString());
                            });
                          }
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Dont have an Account ?'),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SignUP_Screen()));
                            },
                            child: Text(
                              "Signup",
                              style: TextStyle(color: Colors.blue),
                            ))
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                LoginWithNumber()));
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.black)),
                        child: Center(
                          child: Text(
                            'Login With  PhoneNumber',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
