import 'package:flutter/material.dart';
import 'package:ui_assignment/data/dummy_data.dart';
import 'package:ui_assignment/data/get_data.dart';
import 'package:ui_assignment/graphics/custom_grid_card.dart';
import 'package:ui_assignment/graphics/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DummyData? response = DummyData();

  @override
  void initState() {
    response = GetData.instance.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 20),
            AlertBanner(
              title: response?.widgets?[2].title ?? '',
              message: response?.widgets?[2].message ?? '',
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 90,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: response?.widgets?[1].children?.length ?? 0,
                itemBuilder: (context, index) {
                  return CustomListCard(
                    cardTitle: response?.widgets?[1].children?[index].companyName ?? '',
                    price: response?.widgets?[1].children?[index].current ?? '',
                    differenceValue: getDifferenceValue(
                        double.parse(response?.widgets?[1].children?[index].current ?? ''),
                        double.parse(response?.widgets?[1].children?[index].prevClose ?? '')),
                    increaseStatus: getVolatilityStatus(
                        double.parse(response?.widgets?[1].children?[index].current ?? ''),
                        double.parse(response?.widgets?[1].children?[index].prevClose ?? '')),
                    volatilityValue:
                        ' (${getDifferencePercentage(double.parse(response?.widgets?[1].children?[index].current ?? ''), double.parse(response?.widgets?[1].children?[index].prevClose ?? ''))}%)',
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'Most bought',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 400,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 2.0,
                  mainAxisExtent: 150,
                ),
                itemCount: response?.widgets?[0].children?.length ?? 0,
                itemBuilder: (context, index) {
                  return CustomGridCard(
                    title: response?.widgets?[0].children?[index].companyName ?? '',
                    price: response?.widgets?[0].children?[index].current ?? '',
                    differenceValue: getDifferenceValue(
                        double.parse(response?.widgets?[0].children?[index].current ?? ''),
                        double.parse(response?.widgets?[0].children?[index].prevClose ?? '')),
                    volatilityStatus: getVolatilityStatus(
                        double.parse(response?.widgets?[0].children?[index].current ?? ''),
                        double.parse(response?.widgets?[0].children?[index].prevClose ?? '')),
                    volatilityValue:
                        ' (${getDifferencePercentage(double.parse(response?.widgets?[0].children?[index].current ?? ''), double.parse(response?.widgets?[0].children?[index].prevClose ?? ''))}%)',
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

String getDifferenceValue(double currentValue, double prevValue) {
  if (currentValue >= prevValue) {
    String tempValue = (currentValue - prevValue).toStringAsFixed(2);
    return tempValue;
  } else {
    String tempValue = (prevValue - currentValue).toStringAsFixed(2);
    return tempValue;
  }
}

String getDifferencePercentage(double currentValue, double prevValue) {
  final temp = double.parse(getDifferenceValue(currentValue, prevValue));
  final percentage = ((temp * 100) / prevValue).toStringAsFixed(2);
  return percentage;
}

bool getVolatilityStatus(double currentValue, double prevValue) {
  if (currentValue >= prevValue) {
    return true;
  } else {
    return false;
  }
}
