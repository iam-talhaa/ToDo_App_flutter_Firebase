import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_flutter_firebase/UTILS/utils.dart';
import 'package:todo_flutter_firebase/WIDGETS/roundedButton.dart';

class Verifypage extends StatefulWidget {
  final VerificationID;
  Verifypage({super.key, required this.VerificationID});

  @override
  State<Verifypage> createState() => _VerifypageState();
}

class _VerifypageState extends State<Verifypage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool isloading = false;
  final PhoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: PhoneNumberController,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.numbers),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: '6 Digit Code',
                labelText: 'Code'),
          ),
          SizedBox(
            height: 40,
          ),
          RoundedButton(
              loading: isloading,
              name: 'Verify',
              ontap: () async {
                setState(() {
                  isloading = true;
                });
                final credential = PhoneAuthProvider.credential(
                    verificationId: widget.VerificationID,
                    smsCode: PhoneNumberController.text.toString());

                try {
                  setState(() {
                    isloading = true;
                  });
                  await _auth.signInWithCredential(credential);
                } catch (e) {
                  setState(() {
                    isloading = false;
                  });
                  Utils().ShowToast(e.toString());
                }
              })
        ],
      ),
    );
  }
}
