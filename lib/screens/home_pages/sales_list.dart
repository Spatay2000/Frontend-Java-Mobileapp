import 'package:flutter/material.dart';
import 'package:java_spring_frontend/model/sales_product_model.dart';
import 'package:java_spring_frontend/service/sales_service.dart';
import 'package:java_spring_frontend/utilities/widgets.dart';

class FridgeList extends StatelessWidget {
  Future<List<SalesModel>> showcaseInfo = SalesService().getSales();

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
          child: FutureBuilder<List<SalesModel>>(
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
                        child: getShowcaseCards(
                          snapshot.data![index].salesProduct,
                          snapshot.data![index].value,
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
