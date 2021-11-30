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
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<List<SalesModel>>(
//         future: SalesService().getSales(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return Container(
//               child: ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (_, index) {
//                   return Text(
//                     '${snapshot.data![index].salesProduct}',
//                   );
//                 },
//               ),
//             );
//           } else if (snapshot.hasData) {
//             return Center(
//               child: Text('Error'),
//             );
//           } else {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
