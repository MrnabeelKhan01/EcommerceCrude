
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:single_vender_ecommerce/applications/user_provider.dart';
import 'package:single_vender_ecommerce/infrastructure/services/user.dart';
import 'package:single_vender_ecommerce/presentation/view/auth/sign_up/sign_up_view.dart';
import 'package:single_vender_ecommerce/presentation/view/bottom_nav_bar/bottom_navbar.dart';
import '../../../../../configurations/frontend_configs.dart';
import '../../../../../infrastructure/services/auth.dart';
import '../../../../elements/app_button.dart';
import '../../../../elements/auth_field.dart';
import '../../../../elements/custom_text.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({Key? key}) : super(key: key);

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final AuthServices _authServices = AuthServices();
  final UserServices _userServices=UserServices();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: isLoading
          ? const Center(
              child: SizedBox(
                  height: 45, width: 45, child: CircularProgressIndicator()),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 18,
                    ),
                    CustomText(
                      text: 'Login to Continue',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomTextField(
                        icon: Icons.email_outlined,
                        text: "Email",
                        controller: _emailController,
                        onTap: () {},
                        keyBoardType: TextInputType.emailAddress),
                    const SizedBox(
                      height: 18,
                    ),
                    CustomTextField(
                        isPassword: true,
                        isSecure: true,
                        controller: _passwordController,
                        icon: Icons.lock_outline_sharp,
                        text: "Password",
                        onTap: () {},
                        keyBoardType: TextInputType.emailAddress),
                    Transform.translate(
                      offset: const Offset(6, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 35,
                            child: TextButton(
                              onPressed: () {
                                // _authServices.resetPassword(_emailController.text);
                              },
                              child: CustomText(
                                text: 'Forgot Password?',
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    AppButton(
                      onPressed: () {
                        setState(() {
                          isLoading = true;
                        });
                        if (_emailController.text.isNotEmpty &&
                            _passwordController.text.isNotEmpty) {
                          _authServices
                              .logInAccount(
                                  email: _emailController.text,
                                  password: _passwordController.text).then((record){
                            _userServices.streamUsers(record.user!.uid.toString()).first.then((value){
                              Provider.of<UserProvider>(context,listen: false).saveUserDate(value);
                            });
                            setState(() {
                              isLoading = true;
                            });
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const BottomBarView()));
                          });
                        }else{
                          print('Fill Email & password Field ');
                        }
                      },
                      btnLabel: 'Sign in',
                      borderColor: FrontendConfigs.kPrimaryColor,
                    ),
                    const SizedBox(
                      height: 34,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Divider(
                          color: FrontendConfigs.kAuthIconColor,
                        )),
                        const SizedBox(
                          width: 12,
                        ),
                        CustomText(
                          text: "Or continue with",
                          fontSize: 16,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                            child: Divider(
                          color: FrontendConfigs.kAuthIconColor,
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
