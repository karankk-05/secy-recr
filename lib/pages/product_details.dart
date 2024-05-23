import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:url_launcher/url_launcher.dart';
import '../main.dart';
import '../colors_decorations/appcolors.dart';
import '../colors_decorations/decorations.dart';
import 'dart:js' as js;

class ProductDetailsPage extends StatefulWidget {
  final String productName;
  final String productDesc;
  final String productImg;
  final String productPrice;
  final String seller;
  final String address;

  const ProductDetailsPage({
    Key? key,
    required this.productName,
    required this.productDesc,
    required this.productImg,
    required this.productPrice,
    required this.seller,
    required this.address,
  }) : super(key: key);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late GoogleMapController mapController;
  

  @override

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

 

 void _launchMaps(String address) async {
    if (kIsWeb) {
      // Launching maps in a web browser
      final Uri mapsUrl = Uri.parse(
          'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(address)}');
      if (await canLaunch(mapsUrl.toString())) {
        await launch(mapsUrl.toString());
      } else {
        throw 'Could not launch $mapsUrl';
      }
    } else {
      // Handle maps launch for other platforms (not web)
      // For example, you can use platform-specific plugins for Android and iOS.
    }
  }
// Define kIsWeb constant if it's not available
static const bool kIsWeb = identical(0, 0.0);
bool dealInitiated=false;
  @override
  Widget build(BuildContext context) {
    mytext.context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.productName,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left side: Image and buttons
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Card(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/${widget.productImg}',
                            height: 250,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(Size(100, 60)),
                                backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.red,
                                ),
                              ),
                              child: Text(
                                'Add To Favorites',
                                style: mytext.headingbold(fontSize: 18)
                              ),
                              onPressed: () {
                                // Add to favorites action
                              },
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(Size(100, 60)),
                                backgroundColor: MaterialStateProperty.all<Color>(
                                  dealInitiated ? Color.fromARGB(255, 12, 69, 7) : Colors.green, // Change button color based on deal initiation
                                ),
                              ),
                              child: Text(
                                dealInitiated ? 'Chat Now' : 'Make a Deal', // Change button text based on deal initiation
                                style: mytext.headingbold(fontSize: 18)
                              ),
                              onPressed: () {
                                setState(() {
                                  dealInitiated = !dealInitiated; // Toggle deal initiation status
                                });
                                // Handle chat or deal initiation action
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 20),
            // Right side: Product details
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product details card
                    Card(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.productName,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '₹${widget.productPrice}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              widget.productDesc,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Seller information card
                    Card(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Seller: ${widget.seller}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Address card
                    Card(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Address:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              widget.address,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all(Size(120, 60)),
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                    Colors.blue,
                                  ),
                                ),
                                onPressed: () {
                                  // For mobile platforms, launch the map application
                                  _launchMaps(widget.address);
                                  
                                  // For web, open the map URL in a new browser tab
                                  if (kIsWeb) {
                                    js.context.callMethod('open', [
                                      'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(widget.address)}',
                                      '_blank'
                                    ]);
                                  }
                                },
                                child: Text(
                                  'Go to Address',
                                  style: mytext.headingbold(fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Google Map
                   
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary, // Set background color
    );
  }
}
