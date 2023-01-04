import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:e_gift_shoppe/DataBaseClasses/Products.dart';
import 'package:e_gift_shoppe/Admin/AddProducts.dart';
import 'package:e_gift_shoppe/DataBaseClasses/Products.dart';
import 'package:sqflite/sqflite.dart';

import '../Database/Database.dart';

class admin_Home_Page extends StatefulWidget {
  const admin_Home_Page({super.key});
  @override
  State<admin_Home_Page> createState() => _admin_Home_PageState();
}

class _admin_Home_PageState extends State<admin_Home_Page> {
  // Variable Declaration
  late List<Products> productList = [];
  int count = 0;

  @override
  initState() {
    super.initState();
    updateListView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Manage Products"),
          leading: GestureDetector(
            onTap: () {
              navigateToDetail(Products(
                  name: "", details: "", price: "", quantity: "", id: 0));
            },
            child: const Icon(
              Icons.add,
              size: 50,
              textDirection: TextDirection.rtl,
            ),
          ),
        ),
        body: ListView.builder(
          //itemCount: productsData.length,
          itemCount: count,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: ListTile(
                  title: Text(productList[index].name,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(
                      "${productList[index].details}\n${productList[index].quantity}\n${productList[index].price}"),
                  isThreeLine: true,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      GestureDetector(
                        child: const Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                        onTap: () {
                          navigateToDetail(productList[index]);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }

  void updateListView() {
    Future<List<Products>> productListFuture = DBProvider.db.getAllProducts();
    productListFuture.then((productList) {
      setState(() {
        print("Product List = $productList");
        this.productList = productList;
        this.count = productList.length;
      });
    }, onError: (error) {
      print(error.toString());
    });
  }

  // void getAllProductListFromDB() {
  //   Future<List<Products>> productListFuture = DBProvider.db.getAllProducts();
  //   productListFuture.then((productList) {
  //     print("Product List = $productList");
  //     this.productList = productList;
  //     this.count = productList.length;
  //   }, onError: (error) {
  //     print(error.toString());
  //   });
  // }

  void navigateToDetail(Products products) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AddProduct(product: products);
    }));
    if (result == true) {
      updateListView();
    }
  }
}
