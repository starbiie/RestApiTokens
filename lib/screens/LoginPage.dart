import 'package:apitokens/servieces/authServieces.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:animate_do/animate_do.dart';
import 'home_Page.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   TextEditingController _usernameController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//
//   final formKey = GlobalKey<FormState>();
//   var visible = false;
//   @override
//   void dispose() {
//     _usernameController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         // appBar: AppBar(
//         //   title: Text(
//         //     "LOGIN",
//         //     style: TextStyle(fontWeight: FontWeight.bold),
//         //   ),
//         // ),
//         body: Form(
//           key: formKey,
//           child: Container(height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,
//             child: SingleChildScrollView(
//               child: Column(
//                 // mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     alignment: Alignment.center,
//                     width: MediaQuery.of(context).size.width,
//                     height: 155,
//                     decoration: BoxDecoration(
//                         image: DecorationImage(
//                             fit: BoxFit.cover,
//                             image: AssetImage("assets/homePage.png"))),
//                     child: Stack(
//                       children: [
//                         Image.asset(
//                           'assets/logo.png',
//                           width: 55,
//                           fit: BoxFit.cover,
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Login or register to book",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           "your appointments",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         Text(
//                           " Email",
//                           style: TextStyle(fontSize: 14, color: HexColor("404040")),
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         TextFormField(
//                           controller: _usernameController,
//                           keyboardType: TextInputType.name,
//                           decoration: InputDecoration(
//                               fillColor: HexColor("D9D9D9"),
//                               filled: true,
//                               isDense: true,
//                               hintText: 'Username',
//                               hintStyle: TextStyle(
//                                   color: HexColor("000000").withOpacity(0.40),
//                                   fontSize: 14),
//                               enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(8),
//                                   borderSide: BorderSide(
//                                       color: Colors.black.withOpacity(0.10))),
//                               focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(8),
//                                   borderSide: BorderSide(
//                                       color: Colors.black.withOpacity(0.10)))),
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return "Enter a valid username";
//                             }
//                           },
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           " Password",
//                           style: TextStyle(fontSize: 14, color: HexColor("404040")),
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         TextFormField(
//                           controller: _passwordController,
//                           obscureText: visible,
//                           keyboardType: TextInputType.text,
//                           decoration: InputDecoration(
//                               isDense: true,
//                               suffixIcon: IconButton(
//                                   onPressed: () {
//                                     setState(() {
//                                       visible = !visible;
//                                     });
//                                   },
//                                   icon: Icon(visible
//                                       ? Icons.visibility_off
//                                       : Icons.visibility)),
//                               fillColor: HexColor("D9D9D9"),
//                               filled: true,
//                               hintText: 'Password',
//                               hintStyle: TextStyle(
//                                   color: HexColor("000000").withOpacity(0.40),
//                                   fontSize: 14),
//                               enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(8),
//                                   borderSide: BorderSide(
//                                       color: Colors.black.withOpacity(0.10))),
//                               focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(8),
//                                   borderSide: BorderSide(
//                                       color: Colors.black.withOpacity(0.10)))),
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return "Enter a valid password";
//                             }
//                           },
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         InkWell(
//                           onTap: () async {
//                             if (formKey.currentState!.validate()) {
//                               AuthServices auth = AuthServices();
//                               final user = await auth.login(_usernameController.text, _passwordController.text);
//
//                               if (!mounted) return; // Check if the widget is still mounted
//
//                               if (user != null) {
//                                 print(user.token);
//                                 Navigator.pushAndRemoveUntil(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => HomePage(user: user),
//                                   ),
//                                       (route) => false,
//                                 );
//                               } else {
//                                 // Handle the case where user is null
//                                 print("Login failed, user is null");
//                               }
//                             }
//                           },
//
//                           child: Container(
//                             alignment: Alignment.center,
//                             height: 40,
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(7),
//                                 color: HexColor("006837")),
//                             child: Text(
//                               "LOGIN",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold, color: Colors.white),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 25,),
//
//
//
//                       ],
//                     ),
//                   ),
//                   Column(crossAxisAlignment: CrossAxisAlignment.center,children: [
//                     Text(
//                       "logging into an account you are agreeing ",
//                       style: TextStyle(fontSize: 13),
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 1,
//                     ),
//
//
//                     RichText(
//                       text: TextSpan(
//                           style: TextStyle(fontSize: 13),
//                           text: 'with our ',
//                           children: [
//                             TextSpan(text: 'Terms and Conditions',style: TextStyle(color: HexColor("#0028FC"),fontWeight: FontWeight.bold)),
//                             TextSpan(text: 'and'),
//                             TextSpan(text: ' Privacy Policy.',style: TextStyle(color: HexColor("#0028FC"),fontWeight: FontWeight.bold))
//                           ]),
//                     )
//                   ],)
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  var visible = false;
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 400,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/background.png'),
                            fit: BoxFit.fill)),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 30,
                          width: 80,
                          height: 200,
                          child: FadeInUp(
                              duration: Duration(seconds: 1),
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/light-1.png'))),
                              )),
                        ),
                        Positioned(
                          left: 140,
                          width: 80,
                          height: 150,
                          child: FadeInUp(
                              duration: Duration(milliseconds: 1200),
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/light-2.png'))),
                              )),
                        ),
                        Positioned(
                          right: 40,
                          top: 40,
                          width: 80,
                          height: 150,
                          child: FadeInUp(
                              duration: Duration(milliseconds: 1300),
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/clock.png'))),
                              )),
                        ),
                        Positioned(
                          child: FadeInUp(
                              duration: Duration(milliseconds: 1600),
                              child: Container(
                                margin: EdgeInsets.only(top: 50),
                                child: Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        FadeInUp(
                            duration: Duration(milliseconds: 1800),
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Color.fromRGBO(143, 148, 251, 1)),
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            Color.fromRGBO(143, 148, 251, .2),
                                        blurRadius: 20.0,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Color.fromRGBO(
                                                    143, 148, 251, 1)))),
                                    child: TextField(
                                      controller: _usernameController,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Username",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[700])),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextField(
                                      controller: _passwordController,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Password",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[700])),
                                    ),
                                  )
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        FadeInUp(
                            duration: Duration(milliseconds: 1900),
                            child: InkWell(
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                  AuthServices auth = AuthServices();
                                  final user = await auth.login(
                                      _usernameController.text,
                                      _passwordController.text);

                                  if (!mounted)
                                    return; // Check if the widget is still mounted

                                  if (user != null) {
                                    print(user.token);
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            HomePage(user: user),
                                      ),
                                      (route) => false,
                                    );
                                  } else {
                                    // Handle the case where user is null
                                    print("Login failed, user is null");
                                  }
                                }
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(colors: [
                                      Color.fromRGBO(143, 148, 251, 1),
                                      Color.fromRGBO(143, 148, 251, .6),
                                    ])),
                                child: Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 70,
                        ),
                        FadeInUp(
                            duration: Duration(milliseconds: 2000),
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  color: Color.fromRGBO(143, 148, 251, 1)),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
