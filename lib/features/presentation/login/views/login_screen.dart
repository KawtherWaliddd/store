import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/core/services/login.dart';
import 'package:store_app/features/presentation/home/views/home_screen.dart';
import 'package:store_app/features/presentation/update_product/widgets/cusstom_button.dart';
import 'package:store_app/features/presentation/login/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  static const String id = "LoginScreen";
  final TextEditingController userNameConroller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/images/Icon.svg"),
              SizedBox(height: 10),

              Text(
                "Welcom To Fashion App",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Text(
                "Sign in to continue",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              CustomTextField(
                isPassword: false,
                textController: userNameConroller,
              ),
              SizedBox(height: 20),
              CustomTextField(
                isPassword: true,
                textController: passwordController,
              ),
              SizedBox(height: 30),

              CusstomButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    final success = Login().login(
                      username: userNameConroller.text,
                      password: passwordController.text,
                    );

                    if (await success) {
                      Navigator.pushNamed(context, HomeScreen.id);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Invalid username or password"),
                        ),
                      );
                    }
                  }
                },
                title: "Login",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
