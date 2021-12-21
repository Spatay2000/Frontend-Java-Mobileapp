import 'package:flutter/material.dart';
import 'package:java_spring_frontend/model/shop_model.dart';
import 'package:java_spring_frontend/service/shop_service.dart';
import 'package:java_spring_frontend/utilities/widgets.dart';

class ShopPage extends StatefulWidget {
  ShopPage({Key? key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  Future<List<ShopModel>> showcaseInfo = ShopService().getSales();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.only(
            top: 15,
            bottom: 15,
          ),
          margin: EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: FutureBuilder<List<ShopModel>>(
              future: showcaseInfo,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Something Went Wrong');
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [getBoxShadow()],
                        ),
                        child: getShowcasesCards(
                          snapshot.data![index].salesProduct,
                          context,
                        ),
                      );
                    },
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              })),
    );
  }
}
