import 'package:flutter/material.dart';

class CustomListCard extends StatelessWidget {
  const CustomListCard({
    super.key,
    required this.cardTitle,
    required this.price,
    required this.differenceValue,
    required this.increaseStatus,
    required this.volatilityValue,
  });

  final String cardTitle;
  final String price;
  final String differenceValue;
  final bool increaseStatus;
  final String volatilityValue;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 25.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cardTitle,
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                text: '₹$price  ',
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                children: [
                  TextSpan(
                    text: increaseStatus ? '+$differenceValue $volatilityValue' : '-$differenceValue $volatilityValue',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: increaseStatus ? const Color(0xff31a686) : const Color(0xffba5156)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
