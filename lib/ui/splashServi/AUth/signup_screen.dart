import 'package:flutter/material.dart';
import 'package:todo_flutter_firebase/UTILS/utils.dart';
import 'package:todo_flutter_firebase/WIDGETS/roundedButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_flutter_firebase/ui/splashServi/AUth/login_screen.dart';

class SignUP_Screen extends StatefulWidget {
  const SignUP_Screen({super.key});

  @override
  State<SignUP_Screen> createState() => _SignUP_ScreenState();
}

class _SignUP_ScreenState extends State<SignUP_Screen> {
  bool isloading = false;
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text(
          'SignUp Screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
                key: _key,
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
                        controller: passwordController,
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
                          if (_key.currentState!.validate()) {
                            setState(() {
                              isloading = true;
                            });
                            _auth
                                .createUserWithEmailAndPassword(
                                    email: emailController.text,
                                    password:
                                        passwordController.text.toString())
                                .then((value) {
                              Utils().ShowToast('Sign Up Succcessfullty');
                              setState(() {
                                isloading = false;
                              });
                            }).onError((error, stackTrace) {
                              Utils().ShowToast(error.toString());
                              setState(() {
                                isloading = false;
                              });
                            });
                          }
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an Account ?'),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      LoginScreen()));
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.blue),
                            ))
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
