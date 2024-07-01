import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_flutter_firebase/UTILS/utils.dart';
import 'package:todo_flutter_firebase/WIDGETS/roundedButton.dart';
import 'package:todo_flutter_firebase/ui/splashServi/AUth/verifyPage.dart';

class LoginWithNumber extends StatefulWidget {
  const LoginWithNumber({super.key});

  @override
  State<LoginWithNumber> createState() => _LoginWithNumberState();
}

class _LoginWithNumberState extends State<LoginWithNumber> {
  bool isloading = false;
  final numControlller = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text('Login With Phone Number'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.numbers),
                  labelText: 'Enter Your Number',
                  hintText: '+92 300-0000000',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            RoundedButton(
                loading: isloading,
                name: 'Verify',
                ontap: () {
                  _auth.verifyPhoneNumber(
                      phoneNumber: numControlller.text.toString(),
                      verificationCompleted: (_) {
                        setState(() {
                          isloading = true;
                        });
                      },
                      verificationFailed: (e) {
                        setState(() {
                          isloading = false;
                        });
                        Utils().ShowToast(e.toString());
                      },
                      codeSent: (String VerificationId, int? token) {
                        setState(() {
                          isloading = true;
                        });
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Verifypage(
                                  VerificationID: VerificationId,
                                )));
                      },
                      codeAutoRetrievalTimeout: (e) {
                        setState(() {
                          isloading = false;
                        });
                        Utils().ShowToast(e.toString());
                      });
                })
          ],
        ),
      ),
    );
  }
}
