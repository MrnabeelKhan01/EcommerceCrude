
import 'package:flutter/material.dart';
import '../../../../configurations/frontend_configs.dart';
import '../../../elements/custom_appbar.dart';
import '../sign_in/sign_in_view.dart';
import 'layout/body.dart';
class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:customAppBar(context,),
      body: const SignUpBody(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom:10.0),
        child: Row(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            TextButton(onPressed:(){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>const SignInView()));
            }, child:RichText(
                text:  TextSpan(
                    text: "Already have an account? ",
                    style: const TextStyle(
                        color:Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                    children: [
                      TextSpan(
                        text: "Sign in.",
                        style: TextStyle(
                            color:FrontendConfigs.kPrimaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      )
                    ])),)
          ],
        ),
      ),
    );
  }
}
