import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:single_vender_ecommerce/applications/user_provider.dart';
import '../../../../../configurations/frontend_configs.dart';
import '../../../../../infrastructure/models/user.dart';
import '../../../../../infrastructure/services/auth.dart';
import '../../../../../infrastructure/services/user.dart';
import '../../../../elements/app_button.dart';
import '../../../../elements/auth_field.dart';
import '../../../../elements/custom_text.dart';
import '../../sign_in/sign_in_view.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  bool isLoading = false;
  final AuthServices _authServices = AuthServices();
  final UserServices _userServices = UserServices();

  @override
  Widget build(BuildContext context) {
    var userProvider=Provider.of<UserProvider>(context,listen: false);
    return SafeArea(
      child: isLoading
          ? Center(
              child: SizedBox(
                  height: 45,
                  width: 45,
                  child: CircularProgressIndicator(
                    color: FrontendConfigs.kPrimaryColor,
                  )))
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
                      text: 'Create account',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                        isSecure: false,
                        controller: _nameController,
                        icon: Icons.person_outline_outlined,
                        text: 'Full Name',
                        onTap: () {},
                        keyBoardType: TextInputType.text),
                    const SizedBox(
                      height: 18,
                    ),
                    CustomTextField(
                        isSecure: false,
                        controller: _addressController,
                        icon: Icons.account_circle_outlined,
                        text: 'Address',
                        onTap: () {},
                        keyBoardType: TextInputType.text),
                    const SizedBox(
                      height: 18,
                    ),
                    CustomTextField(
                        isSecure: false,
                        controller: _numberController,
                        icon: Icons.contact_page_outlined,
                        text: 'Phone Number',
                        onTap: () {},
                        keyBoardType: TextInputType.phone),
                    const SizedBox(
                      height: 18,
                    ),
                    CustomTextField(
                        isSecure: false,
                        controller: _emailController,
                        icon: Icons.email_outlined,
                        text: 'Email',
                        onTap: () {},
                        keyBoardType: TextInputType.emailAddress),
                    const SizedBox(
                      height: 18,
                    ),
                    CustomTextField(
                      controller: _passwordController,
                      icon: Icons.lock_outline_sharp,
                      text: 'Password',
                      onTap: () {},
                      keyBoardType: TextInputType.text,
                      isSecure: true,
                      isPassword: true,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    AppButton(
                        onPressed: () {
                          if (
                              _emailController.text.isNotEmpty &&
                              _passwordController.text.isNotEmpty) {
                            setState(() {
                              isLoading = true;
                            });
                            _authServices
                                .createAccount(
                                    email: _emailController.text,
                                    password: _passwordController.text)
                                .then((value) {
                              _userServices.createUser(
                                  UserModel(
                                name:_nameController.text,
                                email: _emailController.text,
                                docId: value.user!.uid,
                                phoneNumber: _numberController.text,
                                address: _addressController.text,
                              ));
                              setState(() {
                                isLoading = false;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const SignInView()));
                            }).then((user) {
                              if (user != null) {
                                setState(() {
                                  isLoading = false;
                                });
                                print('User created successfully');
                              } else {
                                print('Account Created failed');
                              }
                            });
                          } else {
                            print('Please Fill the Fields');
                          }
                        },
                        btnLabel: "Sign up"),
                  ],
                ),
              ),
            ),
    );
  }
}
