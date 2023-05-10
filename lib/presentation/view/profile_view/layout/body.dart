import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:single_vender_ecommerce/applications/user_provider.dart';
import 'package:single_vender_ecommerce/infrastructure/services/auth.dart';
import 'package:single_vender_ecommerce/presentation/elements/app_button.dart';
import 'package:single_vender_ecommerce/presentation/elements/custom_text.dart';
import 'package:single_vender_ecommerce/presentation/view/profile_view/edite_profile.dart';

class ProfileBody extends StatelessWidget {
  ProfileBody({Key? key}) : super(key: key);
  final AuthServices _authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(
      context,
    );
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  Image.network(user.getUserData.profileImage.toString(),height:100,width:100,),
                ],
              ),
              CustomText(
                text: user.getUserData.name.toString(),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              CustomText(
                text: user.getUserData.address.toString(),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              CustomText(
                text: user.getUserData.phoneNumber.toString(),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(height:18,),
              AppButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const EditProfile()));
                  },
                  btnLabel: 'Edit Profile'),
              const SizedBox(
                height: 18,
              ),
              AppButton(
                  onPressed: () {
                    _authServices.signOut(context);
                  },
                  btnLabel: 'LogOut')
            ],
          ),
        ),
      ),
    );
  }
}
