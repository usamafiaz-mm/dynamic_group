import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'form_builder_test.dart';

void main() {
  // MyFormBuilder formBuilder = MyFormBuilder();
  // formBuilder.init();
  // final order = formBuilder.getById(11) as FormControl;
  // final order = formBuilder.getById(0) as FormControl;
  // order.myMetaData;
  // order.updateValue('3');
  // print((order.value));

  // final gender = formBuilder.getById(11) as FormControl;
  // print((gender.value));
  // print(formBuilder.root.value);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late FormControl gender;
  late FormGroup root;

  @override
  void initState() {
    MyFormBuilder formBuilder = MyFormBuilder();
    root = formBuilder.init();
    gender = formBuilder.getById(13) as FormControl;
    gender.valueChanges.listen((event) {
      print("event" + event.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ReactiveForm(
          formGroup: root,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: Text(
                    "Gender",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                ReactiveRadioListTile(
                  value: 0,
                  formControl: root.control("gender") as FormControl<int>,
                  title: Text("Male"),
                ),
                ReactiveRadioListTile(
                    value: 1,
                    formControl: root.control("gender") as FormControl<int>,
                    title: Text("Female")),
                ReactiveTextField(
                  decoration: InputDecoration(label: Text("Name")),
                  formControl: root.control("name") as FormControl<String>,
                ),
                ReactiveTextField(
                  decoration: InputDecoration(label: Text("Age")),
                  formControl: root.control("age") as FormControl,
                ),
                ReactiveTextField(
                  decoration: InputDecoration(label: Text("City")),
                  formControl: root.control("address.city") as FormControl,
                ),
                ReactiveTextField(
                  decoration: InputDecoration(label: Text("Zip")),
                  formControl: root.control("address.zip") as FormControl,
                ),
                ReactiveTextField(
                  decoration: InputDecoration(label: Text("Province")),
                  formControl: root.control("address.province") as FormControl,
                ),
                ReactiveTextField(
                    decoration: InputDecoration(label: Text("Order ID")),
                    formControl: ((root.control("orders") as FormArray)
                            .controls[0] as FormGroup)
                        .control("orderId") as FormControl),
                ReactiveTextField(
                    decoration: InputDecoration(label: Text("Total")),
                    formControl: ((root.control("orders") as FormArray)
                            .controls[1] as FormGroup)
                        .control("total") as FormControl),
                ReactiveTextField(
                    decoration: InputDecoration(label: Text("Order ID")),
                    formControl: ((root.control("orders") as FormArray)
                            .controls[0] as FormGroup)
                        .control("orderId") as FormControl),
                ReactiveTextField(
                    decoration: InputDecoration(label: Text("Total")),
                    formControl: ((root.control("orders") as FormArray)
                            .controls[1] as FormGroup)
                        .control("total") as FormControl),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.pinkAccent,
                        fixedSize: Size(MediaQuery.of(context).size.width, 20)),
                    onPressed: () {
                      print(root.value);
                    },
                    child: Text(" Print Value"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
