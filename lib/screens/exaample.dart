import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class storeCard extends StatefulWidget {
  final String imageUrl;
  final String itemName;
  final String itemPrice;
  final String itemDes;

  storeCard({
    required this.imageUrl,
    required this.itemName,
    required this.itemPrice,
    required this.itemDes,
  });

  @override
  State<storeCard> createState() => _storeCardState();
}

class _storeCardState extends State<storeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: null,
      decoration: BoxDecoration(      color: Colors.red,
borderRadius: BorderRadius.all(Radius.circular(12))),
      child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: Image.network(
              widget.imageUrl,
              fit: BoxFit.cover,
              height: 100,
              width: double.infinity,
            ),
          ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      '${widget.itemName}',
                      maxLines: 4,
                      style: TextStyle(
                        color: Colors.white,// Use your AppColors.dark_primaryColor
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '${widget.itemPrice}/-',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '${widget.itemDes}',
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber
                    // Use your AppColors.dark_primaryColor
                    ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
    
                  // Use your AppColors.dark_primaryColor
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/whatsapp.svg',
                      height: 20,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      'Whatsapp',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
      ),
    );
  }
}