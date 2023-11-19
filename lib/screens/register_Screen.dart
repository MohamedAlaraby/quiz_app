// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:scholar_chat/constants.dart';
// import 'package:scholar_chat/widgets/custom_button.dart';
// import 'package:scholar_chat/widgets/custom_text_field.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({Key? key}) : super(key: key);

//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   String? email;

//   String? password;

//   bool isLoading = false;

//   GlobalKey<FormState> formKey = GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     return ModalProgressHUD(
//       inAsyncCall: isLoading,
//       child: Scaffold(
//         backgroundColor: kPrimaryColor,
//         body: Padding(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 10,
//           ),
//           child: Form(
//             key: formKey,
//             child: ListView(
//               children: [
//                 Image.asset(
//                   "assets/images/scholar.png",
//                   height: 100,
//                 ),
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Scholar Chat",
//                       style: TextStyle(
//                         fontFamily: 'Pacifico',
//                         color: Colors.white,
//                         fontSize: 32,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 70,
//                 ),
//                 const SizedBox(
//                   width: double.infinity,
//                   child: Text(
//                     "Register",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 26,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 16,
//                 ),
//                 CustomTextField(
//                   hintText: "Email",
//                   onChange: (value) {
//                     email = value;
//                   },
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 CustomTextField(
//                   hintText: 'Password',
//                   onChange: (value) {
//                     password = value;
//                   },
//                 ),
//                 const SizedBox(
//                   height: 16,
//                 ),
//                 CustomButton(
//                   text: "Register",
//                   onTap: () async {
//                     if (formKey.currentState!.validate() == true) {
//                       try {
//                         setState(() {
//                           isLoading = true;
//                         });
//                         await registerUser(
//                           email: email ?? "",
//                           pass: password ?? "",
//                         );

//                         Navigator.pushReplacementNamed(context, chatScreenName);
//                       } on FirebaseAuthException catch (e) {
//                         if (e.code == 'weak-password') {
//                           showSnakBar(
//                               context, 'The password provided is too weak.');
//                         } else if (e.code == 'email-already-in-use') {
//                           showSnakBar(context,
//                               'The account already exists for that email.');
//                         }
//                       } catch (e) {
//                         print(e);
//                       }
//                       setState(() {
//                         isLoading = false;
//                       });
//                     }
//                   },
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "Already have an account?  ",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: const Text(
//                         "Login",
//                         style: TextStyle(
//                           color: Colors.lightBlue,
//                           fontSize: 18,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 40,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> registerUser(
//       {required String email, required String pass}) async {
//     await FirebaseAuth.instance.createUserWithEmailAndPassword(
//       email: email ?? "",
//       password: pass ?? "",
//     );
//   }
// }
