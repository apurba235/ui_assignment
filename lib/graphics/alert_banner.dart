import 'package:flutter/material.dart';

class AlertBanner extends StatelessWidget {
  const AlertBanner({
    super.key,
    required this.title,
    required this.message,
    this.onTapClose,
  });

  final String title;
  final String message;
  final void Function()? onTapClose;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.blueGrey)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              IconButton(onPressed: onTapClose, icon: const Icon(Icons.close_outlined, color: Colors.grey))
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.white),
                ),
              ),

              /// we can use network image instead of asset image
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    'assets/image/rocket_edit.png',
                    fit: BoxFit.fitHeight,
                    height: 80,
                    width: 80,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
