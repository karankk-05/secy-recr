import 'package:flutter/material.dart';
import 'dart:math';

import '../colors_decorations/appcolors.dart';
import '../colors_decorations/decorations.dart';
import '../Constants/products_details.dart';
import 'product_details.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool displayAll = false;

  Widget _appbar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        height: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(width: 8),
                Icon(Icons.search, color: Theme.of(context).colorScheme.onBackground),
                Text('Search for products', style: mytext.headingtext1(fontSize: 15)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    mytext.context = context;
    return Scaffold(
      appBar: null,
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(top: 10),
            sliver: SliverAppBar(
              pinned: true,
              floating: true,
              snap: true,
              elevation: 0,
              collapsedHeight: 60,
              flexibleSpace: _appbar(context),
              expandedHeight: 40,
              foregroundColor: Theme.of(context).colorScheme.primaryContainer,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 0),
                    child: Text('Newly Arrived', style: mytext.headingbold(fontSize: 17)),
                  ),
                  Expanded(child: SizedBox()),
                  Padding(
                    padding: const EdgeInsets.only(top: 0, right: 20),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          displayAll = !displayAll;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: displayAll
                              ? Theme.of(context).colorScheme.background
                              : Theme.of(context).colorScheme.primaryContainer,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Text(displayAll ? 'View Less' : 'View All', style: mytext.headingtext1(fontSize: 15)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 220.0,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0,
                childAspectRatio: 0.8,
                mainAxisExtent: 250,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (!displayAll && index >= 7) {
                    return Container();
                  }
                  return ProductTile(
                    productname: product_details.names[index],
                    productdesc: product_details.details[index],
                    productimg: product_details.images[index],
                    productprice: product_details.prices[index],
                    seller: product_details.seller[index],
                    address: product_details.addresses[index],
                    onFavoritePressed: () {
                      // Handle favorite button tap here
                    },
                  );
                },
                childCount: displayAll
                    ? product_details.names.length
                    : min(7, product_details.names.length),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductTile extends StatefulWidget {
  final String productname;
  final String productdesc;
  final String productimg;
  final String productprice;
  final String seller;
  final String address;
  final VoidCallback? onFavoritePressed;

  const ProductTile({
    Key? key,
    required this.productname,
    required this.productdesc,
    required this.productimg,
    required this.productprice,
    required this.seller,
    required this.address,
    this.onFavoritePressed,
  }) : super(key: key);

  @override
  _ProductTileState createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(
              productName: widget.productname,
              productDesc: widget.productdesc,
              productImg: widget.productimg,
              productPrice: widget.productprice,
              seller: widget.seller,
              address: widget.address,
            ),
          ),
        );
      },
      child: Stack(
        children: [
          Card(
            color: Theme.of(context).colorScheme.primaryContainer,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/${widget.productimg}',
                            height: 160,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        widget.productname,
                        style: mytext.headingtext1(fontSize: 13),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Row(
                        children: [
                          Text(
                            '₹${widget.productprice}',
                            style: mytext.headingbold(fontSize: 15),
                            textAlign: TextAlign.left,
                          ),
                          Expanded(child: SizedBox()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isFavorite = !isFavorite;
                                  });
                                  if (widget.onFavoritePressed != null) {
                                    widget.onFavoritePressed!();
                                  }
                                },
                                child: Icon(
                                  isFavorite ? Icons.favorite : Icons.favorite_border,
                                  color: isFavorite ? Colors.red : Colors.grey,
                                  size: 25,
                                ),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
