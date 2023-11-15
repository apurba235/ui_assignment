import 'package:ui_assignment/data/dummy_data.dart';

class GetData {
  GetData._();

  static final instance = GetData._();

  Map<String, dynamic> dummyData = {
    "app": {"theme": "light"},
    "widgets": [
      {
        "type": "grid",
        "children": [
          {
            "icon": "https://path/to/image.png",
            "company_name": "Reliance Power",
            "current": "20.50",
            "prev_close": "21.25"
          },
          {"icon": "https://path/to/image.png", "company_name": "Zomato", "current": "121.30", "prev_close": "121.85"},
          {
            "icon": "https://path/to/image.png",
            "company_name": "Suzlon Energy",
            "current": "37.90",
            "prev_close": "37.30"
          }
        ]
      },
      {
        "type": "horizontal_list",
        "children": [
          {"company_name": "Reliance Power", "current": "20.50", "prev_close": "21.25"},
          {"company_name": "Zomato", "current": "121.30", "prev_close": "121.85"},
          {"company_name": "Suzlon Energy", "current": "37.90", "prev_close": "37.30"}
        ]
      },
      {
        "type": "alert",
        "title": "All set for muhurat trading?",
        "message":
            "The 1-hour trading window open on 12 Nov, 6:15 PM. Orders placed now will be placed on 12 Nov, 6:15 PM.",
        "icon": "https://path/to/image.png"
      }
    ]
  };

  DummyData getData() {
    return DummyData.fromJson(dummyData);
  }
}
