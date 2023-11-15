import 'package:flutter/material.dart';

class CustomGridCard extends StatelessWidget {
  const CustomGridCard({Key? key, required this.title, required this.price, required this.volatilityStatus, required this.differenceValue, required this.volatilityValue, }) : super(key: key);
  final String title;
  final String price;
  final bool volatilityStatus;
  final String differenceValue;
  final String volatilityValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 30, width: 30, color: Colors.grey),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 14),
              Text(
                '₹$price',
                style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
              ),
              const SizedBox(height: 5),
               Text(
                volatilityStatus ? '+$differenceValue $volatilityValue' : '-$differenceValue $volatilityValue',
                style: TextStyle(color: volatilityStatus ? const Color(0xff31a686) : const Color(0xffba5156), fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
