import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../servieces/buildBulletListItem.dart';
import '../servieces/buildDetailItem.dart';
import '../servieces/buildFeatureRatingBar.dart';
import '../servieces/productServices.dart';

class HealthDetailPage extends StatefulWidget {
  HealthDetailPage({
    super.key,
    required this.img,
    required this.text,
    required this.pri,
  });

  final String img;
  final String text;
  final String pri;

  @override
  State<HealthDetailPage> createState() => _HealthDetailPageState();
}

class _HealthDetailPageState extends State<HealthDetailPage> {
  var pass = true;
  final ProductServices productServices = ProductServices();

  @override
  void initState() {
    super.initState();
    productServices.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: HexColor("F2DFB2"),
      appBar: AppBar(
        // backgroundColor: HexColor("F2DFB2"),
        leading: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const AlertDialog(
                      title: Text("Add to favourite"),
                      actions: [
                        Text("yes"),
                        Text("Cancel"),
                      ],
                    );
                  },
                );
              },
              child: IconButton(
                onPressed: () {
                  setState(() {
                    pass = !pass;
                  });
                },
                icon: pass
                    ? const Icon(Icons.favorite_outline_outlined)



                    : const Icon(Icons.favorite, color: Colors.red),
              ),
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.img),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.text,
                      style: TextStyle(
                          color: HexColor("604401"),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Gluten-free, cruelty-free & preservative-free",
                      style: TextStyle(
                          color: HexColor("3A3A3A"),
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "MRP:",
                          style: TextStyle(
                              color: HexColor("636161"),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "₹750.00:",
                          style: TextStyle(
                            color: HexColor("636161"),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        Text(
                          widget.pri,
                          style: TextStyle(
                              color: HexColor("000000"),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '15% Off',
                          style: TextStyle(
                              color: HexColor("E19B47"),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Product details",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: HexColor("604401")),
                    ),
                    const SizedBox(height: 15),
                    buildDetailItem("Diet Type", "veg Similarly"),
                    buildDetailItem("Age Range (Description)", "veg Similarly"),
                    buildDetailItem("Item Form", "veg Similarly"),
                    buildDetailItem(
                        "Specific Uses For Product", "veg Similarly"),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Text(
                      "About this item",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: HexColor("604401")),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildBulletListItem(
                        "Complete and balanced nutrition for "),
                    buildBulletListItem(
                        "Antioxidants, vitamins and other "),
                    buildBulletListItem(
                        "Enriched with omega 3 and 6 fatty acids for "),
                    buildBulletListItem("Ideal for all breeds"),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Customer ratings by feature",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: HexColor("604401")),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
