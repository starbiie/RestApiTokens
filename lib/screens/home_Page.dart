import 'package:apitokens/model/model_user.dart';
import 'package:apitokens/model/products_model.dart';
import 'package:apitokens/screens/productDetailPage.dart';
import 'package:apitokens/servieces/productServices.dart';
import 'package:apitokens/utlis/NewBox.dart';
import 'package:apitokens/utlis/headers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomePage extends StatefulWidget {
  final UserModel? user;
  const HomePage({super.key, this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductServices productServices = ProductServices();

  @override
  void initState() {
    super.initState();
    productServices.getAllProducts();
  }

  String selectedPetType = 'Dog';
  @override
  Widget build(BuildContext context) {
    var numOfItems = 3;
    return Scaffold(
      // backgroundColor:      HexColor("F2DFB2"),

      appBar: AppBar(
        // backgroundColor:      HexColor("F2DFB2"),
        title: Text("Hi ${widget.user?.username ?? 'Guest'}"),
        actions: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:   Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.bell, color: Colors.black),
                ),
              ),
              if (numOfItems != 0)
                Positioned(
                  top: -4,
                  right: -4,
                  child: Container(
                    padding: const EdgeInsets.all(2.5),
                    decoration: BoxDecoration(
                      color: HexColor("F2DFB2"),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.red, width: 2),
                    ),
                    child: Text(
                      "$numOfItems",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              SizedBox(
                width: 55,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: HomeHeader(),
              ),
              SizedBox(
                width: 75,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sort by :",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: HexColor("#404040")),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 35,
                      width: 145,
                      child: DropdownButtonFormField<String>(
                        isDense: true,
                        value: selectedPetType,
                        onChanged: (value) {
                          setState(() {
                            selectedPetType = value!;
                          });
                        },
                        items: ['Dog', 'Cat', 'Fish', 'Bird']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                fontSize: 13,
                                color: HexColor("#404040"),
                                fontFamily: 'AbhayaLibre_regular',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 19, vertical: 3),
                          fillColor: HexColor("F2DFB2"),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(25),
                            ),
                            borderSide: BorderSide(color: HexColor("7A5600")),
                          ),
                          hintStyle: TextStyle(
                            color: HexColor("7A5600"),
                            fontFamily: 'AbhayaLibre_regular',
                            fontWeight: FontWeight.w600,
                          ),
                          hintText: 'Select Pet Type',
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(25),
                            ),
                            borderSide: BorderSide(color: HexColor("7A5600")),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // FutureBuilder(
              //   future: productServices.getAllProducts(),
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return Center(child: CircularProgressIndicator());
              //     } else if (snapshot.hasError) {
              //       return Center(child: Text('Error: ${snapshot.error}'));
              //     } else if (snapshot.hasData) {
              //       var products = snapshot.data!.products;
              //       if (products == null || products.isEmpty) {
              //         return Center(child: Text('No products available'));
              //       } else {
              //         return ListView.builder(
              //           shrinkWrap: true,
              //           itemCount: products.length,
              //           itemBuilder: (context, index) {
              //             var product = products[index];
              //
              //             return ListTile(
              //               leading: product.images != null &&
              //                       product.images!.isNotEmpty
              //                   ? CircleAvatar(
              //                       backgroundImage:
              //                           NetworkImage(product.images!.first),
              //                     )
              //                   : const CircleAvatar(
              //                       child: Icon(Icons.image),
              //                     ),
              //               title: Text(snapshot.data!.products![index].title!),
              //               subtitle: Text(snapshot
              //                   .data!.products![index].rating
              //                   .toString()),
              //             );
              //           },
              //         );
              //       }
              //     } else {
              //       return Center(child: Text('No data available'));
              //     }
              //   },
              // ),
              FutureBuilder(
                  future: productServices.getAllProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: LoadingAnimationWidget.flickr(
                          rightDotColor: Colors.black,
                          leftDotColor: const Color(0xfffd0079),
                          size: 30,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      var products = snapshot.data!.products;
                      if (products == null || products.isEmpty) {
                        return Center(child: Text('No products available'));
                      } else {
                        return GridView.builder(
                          shrinkWrap: true,
                          itemCount: products.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            var product = products[index];
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) => const birdmain(),
                                  //     ));
                                },
                                child: InkWell(onTap: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HealthDetailPage(img: product.images!.first, text:snapshot.data!.products![index].title!,
                                     pri: snapshot.data!.products![index].price!.toString(),),));
                                },
                                  child: NeuBox(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(
                                            fit: BoxFit.fitHeight,
                                            image: NetworkImage(
                                                product.images!.first),
                                          )),
                                      child: Stack(
                                        children: [
                                          Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: Colors.black26,
                                                    borderRadius:
                                                        BorderRadius.circular(5)),
                                                height: 40,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child:  Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 8.0),
                                                  child: Text(
                                                    snapshot.data!.products![index].title!,
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    } else {
                      return Center(child: Text('No data available'));
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
