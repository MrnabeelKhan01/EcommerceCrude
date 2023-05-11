import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:single_vender_ecommerce/applications/user_provider.dart';
import 'package:single_vender_ecommerce/infrastructure/models/cart.dart';
import 'package:single_vender_ecommerce/infrastructure/models/order.dart';
import 'package:single_vender_ecommerce/infrastructure/services/order.dart';
import 'package:single_vender_ecommerce/presentation/elements/custom_text.dart';

class OrderBody extends StatelessWidget {
  OrderBody({Key? key}) : super(key: key);
  final OrderServices _orderServices = OrderServices();
   final CartModel _cartModel =CartModel();
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context, listen: false);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            StreamProvider.value(
                value:
                    _orderServices.streamMyOrder(user.getUserData.docId.toString()),
                initialData: [OrderModel()],builder:(context,child){
                  List<OrderModel> _orderList=context.watch<List<OrderModel>>();
                  return ListView.builder(
                      shrinkWrap:true,
                      physics:const NeverScrollableScrollPhysics(),
                      itemCount:_orderList.length,
                      itemBuilder: (context,i){
                    return _orderList.isNotEmpty? Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.network(_orderList[i].user!.profileImage.toString(),height:100,width:100,),
                            Column(children: [

                              CustomText(text: _orderList[i].user!.name.toString()),
                              CustomText(text: _orderList[i].user!.address.toString()),
                              CustomText(text: _orderList[i].user!.phoneNumber.toString()),
                              CustomText(text: _orderList[i].totalBill.toString()),
                              CustomText(text: _orderList[i].adminID.toString()),
                            ],),
                          ],
                        ),
                      ),
                    ):CustomText(text: "Error");
                  });
            },)
          ],
        ),
      ),
    );
  }
}
