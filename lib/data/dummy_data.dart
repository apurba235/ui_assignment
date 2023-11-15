class DummyData {
  App? app;
  List<Widgets>? widgets;

  DummyData({this.app, this.widgets});

  DummyData.fromJson(Map<String, dynamic> json) {
    app = json['app'] != null ? App.fromJson(json['app']) : null;
    if (json['widgets'] != null) {
      widgets = <Widgets>[];
      json['widgets'].forEach((v) {
        widgets!.add(Widgets.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   if (app != null) {
  //     data['app'] = app!.toJson();
  //   }
  //   if (widgets != null) {
  //     data['widgets'] = widgets!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class App {
  String? theme;

  App({this.theme});

  App.fromJson(Map<String, dynamic> json) {
    theme = json['theme'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['theme'] = theme;
  //   return data;
  // }
}

class Widgets {
  String? type;
  List<Children>? children;
  String? title;
  String? message;
  String? icon;

  Widgets({this.type, this.children, this.title, this.message, this.icon});

  Widgets.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(Children.fromJson(v));
      });
    }
    title = json['title'];
    message = json['message'];
    icon = json['icon'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['type'] = type;
  //   if (children != null) {
  //     data['children'] = children!.map((v) => v.toJson()).toList();
  //   }
  //   data['title'] = title;
  //   data['message'] = message;
  //   data['icon'] = icon;
  //   return data;
  // }
}

class Children {
  String? icon;
  String? companyName;
  String? current;
  String? prevClose;

  Children({this.icon, this.companyName, this.current, this.prevClose});

  Children.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    companyName = json['company_name'];
    current = json['current'];
    prevClose = json['prev_close'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['icon'] = icon;
  //   data['company_name'] = companyName;
  //   data['current'] = current;
  //   data['prev_close'] = prevClose;
  //   return data;
  // }
}
