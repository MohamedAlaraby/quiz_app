// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:scholar_chat/constants.dart';
// import 'package:scholar_chat/screens/register_Screen.dart';
// import 'package:scholar_chat/widgets/custom_button.dart';
// import 'package:scholar_chat/widgets/custom_text_field.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   bool isLoading = false;
//   GlobalKey<FormState> formKey = GlobalKey();
//   String? email;
//   String? password;
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
//                   width: double.infinity,
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
//                   height: 75,
//                 ),
//                 const SizedBox(
//                   width: double.infinity,
//                   child: Text(
//                     "Login",
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
//                   onChange: (emailVal) {
//                     email = emailVal;
//                   },
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 CustomTextField(
//                   hintText: 'Password',
//                   onChange: (passVal) {
//                     password = passVal;
//                   },
//                 ),
//                 const SizedBox(
//                   height: 16,
//                 ),
//                 CustomButton(
//                   text: "Login",
//                   onTap: () async {
//                     if (formKey.currentState!.validate() == true) {
//                       setState(() {
//                         isLoading = true;
//                       });
//                       await signInUser(
//                         email: email!,
//                         password: password!,
//                       );
//                       Navigator.pushNamed(context, chatScreenName,arguments: email);
//                     }
//                     // Navigator.pop(context);
//                   },
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "don't have an account?  ",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pushNamed(context, registerScreenName);
//                       },
//                       child: const Text(
//                         "Register",
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
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> signInUser({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       final credential = await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         showSnakBar(context, 'User not found');
//       } else if (e.code == 'wrong-password') {
//         showSnakBar(context, 'Wrong password provided for that user.');
//       }
//     } catch (e) {
//       showSnakBar(context, e.toString());
//     }
//     setState(() {
//       isLoading = false;
//     });
//   }
// }//end of the class
