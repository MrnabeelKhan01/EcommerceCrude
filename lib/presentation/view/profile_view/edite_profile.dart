import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:single_vender_ecommerce/applications/user_provider.dart';
import 'package:single_vender_ecommerce/infrastructure/models/user.dart';
import 'package:single_vender_ecommerce/infrastructure/services/user.dart';
import 'package:single_vender_ecommerce/presentation/elements/app_button.dart';
import 'package:single_vender_ecommerce/presentation/elements/app_textfield.dart';
import 'package:single_vender_ecommerce/presentation/elements/custom_appbar.dart';

import '../../../configurations/frontend_configs.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _numberController = TextEditingController();

  final UserServices _userServices = UserServices();

  @override
  void initState() {
    // TODO: implement initState
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    _nameController =
        TextEditingController(text: userProvider.getUserData.name.toString());
    _addressController = TextEditingController(
        text: userProvider.getUserData.address.toString());
    _numberController =
        TextEditingController(text: userProvider.getUserData.phoneNumber.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              children: [
                const SizedBox(height:34,),
                AppTextField(
                    text: 'Edit name',
                    keyBoardType: TextInputType.text,
                    controller: _nameController),
                const SizedBox(
                  height: 18,
                ),
                AppTextField(
                    text: 'Edit address',
                    keyBoardType: TextInputType.text,
                    controller: _addressController),
                const SizedBox(
                  height: 18,
                ),
                AppTextField(
                    text: 'Number',
                    keyBoardType: TextInputType.number,
                    controller: _numberController),
                const SizedBox(height:18,),
                AppButton(
                    onPressed: () {
                      var userProvider =
                          Provider.of<UserProvider>(context, listen: false);
                      _userServices
                          .updateUser(UserModel(
                              name: _nameController.text,
                              address: _addressController.text,
                              phoneNumber: _numberController.text,
                              docId: userProvider.getUserData.docId.toString()))
                          .then((value) {
                        _userServices
                            .streamUsers(
                                userProvider.getUserData.docId.toString())
                            .first
                            .then((data) {
                          Provider.of<UserProvider>(context, listen: false)
                              .saveUserDate(data);
                        });
                        Navigator.pop(context);
                      });
                    },
                    btnLabel: 'Update')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
