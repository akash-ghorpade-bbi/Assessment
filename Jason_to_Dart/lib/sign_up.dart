import 'package:flutter/material.dart';
import 'package:json_assisment/home_screen.dart';
import 'package:json_assisment/main.dart';
import 'package:json_assisment/details_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}


class _SignUpScreenState extends State<SignUpScreen> {
  //Future<SharedPreferences> sharedprefrance=  SharedPreferences.getInstance() ;
  final emailController = TextEditingController();
  final nameController=TextEditingController();
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Navigator.pushReplacement(
  //       context, MaterialPageRoute(
  //       builder: (context) => MyAppState()
  //   )
  //   );
  //
  //
  // }

  @override
  Widget build(BuildContext context) {
    final nameprovider= Provider.of<UserName>(context);

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(

              padding: const EdgeInsets.fromLTRB(10, 100, 10, 100),
              child: Column(

                children: [
                  const Text(
                    "Signup Page",
                    style: TextStyle(
                        fontSize: 34, color: Colors.red, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextField(

                    controller: nameController,
                    decoration: InputDecoration(

                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Enter Your Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),

                  ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(

                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Enter Your Email ID',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),

                  ),
                  TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Set 8 Digit Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                    obscureText: true,
                  ),
                  const  SizedBox(
                    height: 40,
                  ),

                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                        child: ElevatedButton(
                          onPressed: () async{
                            // Navigator.pushNamed(
                            //     context, 'register'
                            // );
                            String patternEmail =
                                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                            RegExp regExpEmail = RegExp(patternEmail);

                            SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
                            sharedPreferences!.setString('set_email', emailController.text);
                            nameprovider.changeName(nameController.text);
                            //sharedPreferences!.setString('set_name', nameController.text);
                            if (regExpEmail.hasMatch(emailController.text) ==false){
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context)
                              {
                                    return const AlertDialog(
                                     title: Text("Email Not Valid"),
                                    );
                              }//builder

                              );}
                            else{
                              Navigator.pushReplacementNamed(context,'login' );
                            }

                            //   showDialog(context: context,builder: (BuildContext context)
                            // {return const AlertDialog(title: Text("Email is not valid"),

                           // Navigator.pushReplacementNamed(context,'login' );
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),

                     
                    ],
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
