import 'package:flutter/material.dart';

import '../../../../configurations/frontend_configs.dart';
import '../../../elements/custom_appbar.dart';
import '../sign_up/sign_up_view.dart';
import 'layout/body.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpView()));
              },
              child: RichText(
                  text: TextSpan(
                      text: "Don’t have an account? ",
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                      children: [
                    TextSpan(
                      text: "Sign up.",
                      style: TextStyle(
                          color: FrontendConfigs.kPrimaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    )
                  ])),
            )
          ],
        ),
      ),
      body: const SignInBody(),
    );
  }
}
