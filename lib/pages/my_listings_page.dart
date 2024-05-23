import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../colors_decorations/appcolors.dart';
import '../colors_decorations/decorations.dart';
class ListingsHomePage extends StatefulWidget {
  @override
  _ListingsHomePageState createState() => _ListingsHomePageState();
}

class _ListingsHomePageState extends State<ListingsHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:null,
      
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Consumer<ProductProvider>(
          builder: (context, productProvider, _) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: productProvider.products.length,
              itemBuilder: (context, index) {
                return ProductTile(
                  product: productProvider.products[index],
                  onDeletePressed: () {
                    productProvider.deleteProduct(productProvider.products[index].name);
                  },
                  onEditPressed: () {
                    // Handle edit action
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}




class ProductTile extends StatefulWidget {
  final Product product;
  final VoidCallback? onDeletePressed;
  final VoidCallback? onEditPressed;

  const ProductTile({
    Key? key,
    required this.product,
    this.onDeletePressed,
    this.onEditPressed,
  }) : super(key: key);

  @override
  _ProductTileState createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    mytext.context = context;
    return Stack(
      children: [
        Card(
          color: Theme.of(context).colorScheme.primaryContainer,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: widget.product.imageUrls.isNotEmpty
                      ? Image.network(
                          widget.product.imageUrls[0],
                          width: 350,
                          height: 350,
                          fit: BoxFit.cover,
                        )
                      : Icon(
                          Icons.person,
                          size: 150,
                          color: Colors.white,
                        ),
                ),
                SizedBox(height: 10),
                Text(
                  widget.product.name,
                  style: mytext.headingtext1(fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Row(
                  children: [
                    Text(
                      '₹${widget.product.price}',
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
                            // Handle favorite action
                          },
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : Colors.grey,
                            size: 25,
                          ),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            if (widget.onDeletePressed != null) {
                              widget.onDeletePressed!();
                            }
                          },
                          child: Icon(
                            Icons.delete,
                            color: Colors.grey,
                            size: 25,
                          ),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            if (widget.onEditPressed != null) {
                              widget.onEditPressed!();
                            }
                          },
                          child: Icon(
                            Icons.edit,
                            color: Colors.grey,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
