class FocusModel {
  List<FocusItem> result;

  FocusModel({this.result});

  FocusModel.fromJson(Map<String, dynamic> json) {
    result = new List<FocusItem>();
    List resultList = json["result"];
    if (resultList != null) {
      resultList.forEach((v) {
        result.add(FocusItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FocusItem {
  String sId;
  String title;
  String status;
  String pic;
  String url;

  FocusItem({this.sId, this.title, this.status, this.pic, this.url});

  FocusItem.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    status = json['status'];
    pic = json['pic'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['status'] = this.status;
    data['pic'] = this.pic;
    data['url'] = this.url;
    return data;
  }
}
