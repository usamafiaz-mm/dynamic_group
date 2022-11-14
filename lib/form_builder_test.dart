import 'package:reactive_forms/reactive_forms.dart';

class MyFormBuilder {
  final FormGroup root = fb.group({});
  List<Map<String, dynamic>> list = [];
  static int id = 0;

  FormGroup init() {
    final name = FormControl(
        value: "John Doe",
        metaData: MyMetaData(
            name: "usama",
            label: "String",
            required: true,
            type: "Text",
            id: 12,
            validators: {"val": 1}));
    // name.setMetadataData();
    addControl("name", name, root);
    final age = FormControl(value: 19);
    addControl("age", age, root);
    final address = FormGroup({});
    addControl("address", address, root);
    final city = FormControl(value: "Islamabad");
    addControl("city", city, address);
    final zip = FormControl(value: 44000);
    addControl("zip", zip, address);
    final province = FormControl(value: "Capital");
    addControl("province", province, address);
    final orders = FormArray([]);
    addControl("orders", orders, root);
    final anonymous = FormGroup({});
    addControlFormArray(anonymous, orders);
    final orderId = FormControl(value: 1);
    addControl("orderId", orderId, anonymous);
    final total = FormControl(value: 20);
    addControl("total", total, anonymous);
    final anonymous2 = FormGroup({});
    addControlFormArray(anonymous2, orders);
    final orderId2 = FormControl(value: 2);
    addControl("orderId", orderId2, anonymous2);
    final total2 = FormControl(value: 40);
    addControl("total", total2, anonymous2);
    final gender = FormControl(value: 0);
    addControl("gender", gender, root);
    return root;
  }

  void addControl(String name, dynamic control, FormGroup parent) {
    parent.addAll({name: control});
    print(id);
    print(name);
    list.add({"id": id, "reference": control});
    id += 1;
  }

  void addControlFormArray(dynamic control, FormArray parent) {
    parent.add(control);
    list.add({"id": id, "reference": control});
    id += 1;
  }

  getById(int id) {
    final object = list.firstWhere((element) => element["id"] == id);
    return object["reference"];
  }
}
