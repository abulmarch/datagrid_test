
class ItemType {
    String? value;
    String? color;

    ItemType({this.value, this.color}); 

    ItemType.fromJson(Map<String, dynamic> json) {
        value = json['value'];
        color = json['color'];
    }
@override
  String toString() {
    return 'ItemType: { value: $value, color: $color }';
  }
}



class DataModel {
    int? id;
    String? title;
    String? itemid;
    bool? active;
    String? date;
    bool? overdue;
    ItemType? itemtype1;
    ItemType? itemtype2;
    List<ItemType?>? level1;
    List<ItemType?>? level2;
    Status? status;

    DataModel({this.id, this.title, this.itemid, this.active, this.date, this.overdue, this.itemtype1, this.itemtype2, this.level1, this.level2, this.status}); 

    DataModel.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        title = json['title'];
        itemid = json['item_id'];
        active = json['active'];
        date = json['date'];
        overdue = json['overdue'];
        itemtype1 = json['item_type1'] != null ? ItemType?.fromJson(json['item_type1']) : null;
        itemtype2 = json['item_type2'] != null ? ItemType?.fromJson(json['item_type2']) : null;
        if (json['level1'] != null) {
         level1 = <ItemType>[];
         json['level1'].forEach((v) {
         level1!.add(ItemType.fromJson(v));
        });
      }
        if (json['level2'] != null) {
         level2 = <ItemType>[];
         json['level2'].forEach((v) {
         level2!.add(ItemType.fromJson(v));
        });
      }
        status = json['status'] != null ? Status?.fromJson(json['status']) : null;
    }

}

class Status {
    int? currentcount;
    int? totalcount;

    Status({this.currentcount, this.totalcount}); 

    Status.fromJson(Map<String, dynamic> json) {
        currentcount = json['current_count'];
        totalcount = json['total_count'];
    }

}

