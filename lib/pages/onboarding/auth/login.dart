import 'package:flutter/material.dart';
import 'package:monie_tracka/pages/main/main_page.dart';
import 'package:monie_tracka/shared/reusables/custom_button.dart';
import 'package:monie_tracka/shared/reusables/custom_input_field.dart';
import 'package:monie_tracka/shared/utils/app_theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        scrolledUnderElevation: 0,
        title: Text("Log In",style: AppTheme.headerStyle.copyWith(fontSize: 20),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ScrollConfiguration(behavior: const ScrollBehavior().copyWith(overscroll: false), child: SingleChildScrollView(
          child: Column(
          children: [
            SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          
          ),
          Form(
            key: _formKey,
            child: Wrap(
            runSpacing: 15,
            children: [
              CustomInputField(controller: emailController, label: "Email",inputType: TextInputType.emailAddress,),
              CustomInputField(controller: passwordController, label: "Password",
              isPassword: true,
              showPasswordToggle: true
              ),
            ],
          ),),
          const SizedBox(
                          height: 50,
                        ),
                        CustomButton(
                          onTap: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MainPage()),(modal)=>false);
                              }
                            },
                          text: "Login"),
                        const SizedBox(
                          height: 15,
                        ),
                        TextButton(onPressed: (){}, child: Text("Forgot Password?",style: AppTheme.headerStyle.copyWith(fontSize: 14),))
                        
          ],
        ),
        ))
      ),
    );
  }
}