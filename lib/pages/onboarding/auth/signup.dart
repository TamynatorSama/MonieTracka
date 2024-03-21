import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monie_tracka/pages/main/main_page.dart';
import 'package:monie_tracka/pages/onboarding/auth/login.dart';
import 'package:monie_tracka/shared/reusables/custom_button.dart';
import 'package:monie_tracka/shared/reusables/custom_input_field.dart';
import 'package:monie_tracka/shared/utils/app_theme.dart';
import 'package:monie_tracka/shared/utils/icons.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool greaterThan7 = false;
  bool mixedCharacters = false;
  RegExp specialPasswordCharacters = RegExp(r'^(?=.*?[0-9])(?=.*?[#@$?!-*^%])');

  @override
  void initState() {
    passwordController.addListener(checkPasswordStrength);
    super.initState();
  }

  checkPasswordStrength() {
    greaterThan7 = passwordController.text.length >= 8;
    mixedCharacters =
        specialPasswordCharacters.hasMatch(passwordController.text);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top + 20,
          ),
          SvgPicture.asset(CustomIcons.logo),
          const SizedBox(height: 20),
          Expanded(
              child: ScrollConfiguration(
                  behavior: const ScrollBehavior().copyWith(overscroll: false),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          "Create Account",
                          style: AppTheme.headerStyle,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "Enter your Details",
                          style: AppTheme.bodyText.copyWith(fontSize: 14),
                        ),
                        const SizedBox(height: 24),
                        Form(
                            // onChanged: () {
                            //   if (_formKey.currentState!.validate()){

                            //   }
                            // },
                            key: _formKey,
                            child: Wrap(
                              runSpacing: 15,
                              children: [
                                CustomInputField(
                                    controller: usernameController,
                                    label: "Username"),
                                CustomInputField(
                                    controller: phoneController,
                                    inputType: TextInputType.phone,
                                    formatter: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(14)
                                    ],
                                    label: "Phone Number"),
                                CustomInputField(
                                    controller: emailController,
                                    inputType: TextInputType.emailAddress,
                                    label: "Email"),
                                Column(
                                  children: [
                                    CustomInputField(
                                      controller: passwordController,
                                      inputType: TextInputType.visiblePassword,
                                      label: "Password",
                                      isPassword: true,
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Wrap(
                                      runSpacing: 5,
                                      children: [
                                        _buildPasswordChecks(
                                            checkName:
                                                greaterThan7 && mixedCharacters
                                                    ? "Strong"
                                                    : "Weak",
                                            strength: greaterThan7 &&
                                                    mixedCharacters
                                                ? PasswordStrength.strong
                                                : greaterThan7 ||
                                                        mixedCharacters
                                                    ? PasswordStrength.weak
                                                    : PasswordStrength.punny),
                                        _buildPasswordChecks(
                                            checkName:
                                                "Use at least 8 characters",
                                            strength: greaterThan7
                                                ? PasswordStrength.strong
                                                : PasswordStrength.punny),
                                        _buildPasswordChecks(
                                            checkName:
                                                "Mix letters,numbers and special characters ( e.g. #\$&\\)",
                                            strength: mixedCharacters
                                                ? PasswordStrength.strong
                                                : PasswordStrength.punny)
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                CustomInputField(
                                  controller: cPasswordController,
                                  inputType: TextInputType.visiblePassword,
                                  label: "Confirm  Password",
                                  isPassword: true,
                                  validator: (value) {
                                    if ((value as String).isEmpty) {
                                      return "Confirm password field cannot be null";
                                    }
                                    if (value != passwordController.text) {
                                      return "password does not match";
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 24,
                        ),
                        RichText(
                          text: TextSpan(children: [
                            const TextSpan(
                                text:
                                    "By signing up, I have read and agreed to the "),
                            TextSpan(
                                text: "Terms and condition,Usage policy",
                                style: AppTheme.bodyText.copyWith(
                                    fontSize: 12,
                                    color: const Color(0xff222222),
                                    fontWeight: FontWeight.w600)),
                            const TextSpan(
                              text: " and ",
                            ),
                            TextSpan(
                                text: "Privacy policy",
                                style: AppTheme.bodyText.copyWith(
                                    fontSize: 12,
                                    color: const Color(0xff222222),
                                    fontWeight: FontWeight.w600))
                          ], style: AppTheme.bodyText.copyWith(fontSize: 12)),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 30,
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
                            text: "Sign Up"),
                        const SizedBox(
                          height: 12,
                        ),
                        TextButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage())),
                          child: RichText(
                            text: TextSpan(
                                children: [
                                  const TextSpan(
                                      text: "I already have an Account? "),
                                  TextSpan(
                                      text: " Log In",
                                      style: AppTheme.headerStyle.copyWith(
                                          fontSize: 12,
                                          color: const Color(0xff222222))),
                                ],
                                style: AppTheme.bodyText.copyWith(
                                    fontSize: 12, fontWeight: FontWeight.w600)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  )))
        ],
      ),
    ));
  }
}

Widget _buildPasswordChecks(
    {required String checkName, required PasswordStrength strength}) {
  return Row(
    children: [
      CircleAvatar(
        radius: 6,
        backgroundColor: strength == PasswordStrength.strong
            ? const Color(0xff00D916)
            : strength == PasswordStrength.weak
                ? const Color(0xffFFE605)
                : const Color(0xffD9D9D9),
      ),
      const SizedBox(
        width: 7,
      ),
      Expanded(child: Text(
        checkName,
        style: AppTheme.bodyText.copyWith(fontSize: 13),
      ))
    ],
  );
}

enum PasswordStrength {
  punny,
  weak,
  strong,
}
