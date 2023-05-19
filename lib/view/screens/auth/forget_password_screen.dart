import 'package:course_getx/logic/controller/auth_controller.dart';
import 'package:course_getx/utils/theme.dart';
import 'package:course_getx/view/widget/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/my_string.dart';
import '../../widget/auth_text_form_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);

  final fromKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final controller =Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          centerTitle: true,
          title: Text(
            'Forget Password',
            style: TextStyle(
              color: Get.isDarkMode ? mainColor : pinkClr,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Get.isDarkMode ? Colors.black : Colors.white,
            ),
          ),
        ),
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        body: Form(
          key: fromKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.close_rounded,
                          color: Colors.white,
                        )),
                  ),
                  const SizedBox(height: 20,),
                  Text("if you want to recover your account, then please provide your email ID below..",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    color:Get.isDarkMode? Colors.black:Colors.white
                  ),
                  ),
                  const SizedBox(height: 50,),
                  Image.asset('assets/images/forgetpass copy.png',width: 250,),
                  const SizedBox(height: 50,),
                  AuthTextFormField(
                    controller: emailController,
                    obscureText: false,
                    validator: (value) {
                      if (!RegExp(validationEmail).hasMatch(value)) {
                        return 'Invalid email';
                      } else {
                        return null;
                      }
                    },
                    prefixIcon: Get.isDarkMode
                        ? const Icon(
                      Icons.email,
                      color: pinkClr,
                      size: 30,
                    )
                        : Image.asset('assets/images/email.png',color: pinkClr,),
                    suffixIcon: const Text(""),
                    hintText: 'Email',
                  ),
                  const SizedBox(height: 50,),
                 GetBuilder<AuthController>(builder: (_){
                   return  AuthButton(text: 'Send ', onTap: (){
                     if(fromKey.currentState!.validate()){
                       String email=emailController.text.trim();
                       controller.resetPassword(email);
                     }
                   });
                 },)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
