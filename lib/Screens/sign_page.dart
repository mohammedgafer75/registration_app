import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:registration_app/Screens/sign_up.dart';
import 'package:registration_app/controller/auth_controller.dart';

class SignPage extends StatelessWidget {
  const SignPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.find();
    Size size = MediaQuery.of(context).size;
    final data = MediaQuery.of(context);
    final width = data.size.width;
    final height = data.size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text('sign in page'),
          // backgroundColor: Colors.yellow[900],
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            // const BackgroundImage(image: 'images/back.jpg'),
            Form(
              key: controller.formKey,
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: size.height / 5.0),
                    child: Center(
                      child: Text(
                        'Registration App',
                        style: TextStyle(
                            color: Colors.blue[800],
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 60,
                  // ),

                  Container(
                    padding: EdgeInsets.only(
                      top: data.padding.top * .7,
                      // bottom: data.padding.bottom * .3),
                    ),
                    height: height * 0.6,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Container(
                            padding: EdgeInsets.only(
                                right: width / 100, left: width / 100),
                            height: size.height * 0.1,
                            width: size.width * 0.8,
                            // decoration: BoxDecoration(
                            //  color: Colors.white.withOpacity(0.5),
                            // borderRadius: BorderRadius.circular(16),
                            // ),
                            child: TextFormField(
                              controller: controller.email,
                              validator: (val) {
                                return controller.validateEmail(val!);
                              },
                              decoration: InputDecoration(
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 3.0),
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 2.0),
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black.withOpacity(.7),
                                      width: 1.0),
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                prefixIcon: const Icon(
                                  Icons.email,
                                  size: 24,
                                  color: Colors.black,
                                ),

                                labelText: 'Email',

                                labelStyle:
                                    const TextStyle(color: Colors.black),
                                hintStyle: const TextStyle(color: Colors.black),

                                // hintText: hint,
                                //  hintStyle: kBodyText,
                              ),
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Container(
                            padding: EdgeInsets.only(
                                right: width / 100, left: width / 100),
                            height: size.height * 0.1,
                            width: size.width * 0.8,

                            // decoration: BoxDecoration(
                            //   color: Colors.grey[500].withOpacity(0.5),
                            //   borderRadius: BorderRadius.circular(16),
                            // ),
                            child: GetBuilder<AuthController>(
                              builder: (logic) {
                                return TextFormField(
                                  controller: logic.password,
                                  obscureText: logic.obscureTextLogin,
                                  validator: (val) {
                                    return logic.validateRePassword(val!);
                                  },
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          logic.toggleLogin();
                                        },
                                        icon: Icon(
                                          // Based on passwordVisible state choose the icon
                                          logic.obscureTextLogin
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                        )),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.red, width: 3.0),
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 2.0),
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black.withOpacity(.7),
                                          width: 1.0),
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      size: 24,
                                      color: Colors.black,
                                    ),

                                    labelText: 'Password',

                                    labelStyle:
                                        const TextStyle(color: Colors.black),
                                    hintStyle:
                                        const TextStyle(color: Colors.black),

                                    // hintText: hint,
                                    //  hintStyle: kBodyText,
                                  ),
                                  style: const TextStyle(color: Colors.black),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.03),
                        Center(
                          child: TextButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.only(
                                        top: height / 45,
                                        bottom: height / 45,
                                        left: width / 10,
                                        right: width / 10)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.blueAccent),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(13),
                                        side: BorderSide(
                                            color: Colors.blueAccent)))),
                            onPressed: () async {
                              controller.login();
                            },
                            child: const Text(
                              'sign in',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account? ",
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => SignUp());
                                },
                                child: const Text(
                                  'Sign up',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                      fontSize: 16.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
