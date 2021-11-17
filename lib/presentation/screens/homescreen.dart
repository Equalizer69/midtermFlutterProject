import 'package:flutter/material.dart';
import 'package:midterm_giga/presentation/views/view_item.dart';
import 'package:midterm_giga/utils/dummy_data.dart';
import 'package:midterm_giga/utils/helper.dart';
import 'detailed_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List carList = DUMMY_DATA;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cars"), actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, "/add_car");
          },
        ),
        const Text(" ")
      ]),
      drawerEnableOpenDragGesture: false,
      body: ListView.builder(
          itemBuilder: (ctx, index) {
            final car = carList[index];
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              background: Container(
                alignment: Alignment.centerLeft,
                color: Colors.red,
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              child: GestureDetector(
                  onLongPress: () => Navigator.pushNamed(context, "/edit_car",
                          arguments: {"car": car, "index": index}).then((_) {
                        setState(() {});
                      }),
                  onTap: () => Navigator.pushNamed(
                      context, CarDetails.routeName, arguments: car),
                  child: ViewItem(
                      brand: car.brand,
                      model: car.model,
                      year: car.year,
                      description: car.description,
                      imageUrl: car.imageUrl)),
              confirmDismiss: (direction) => showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        title: const Text("Delete Car"),
                        content: const Text("Are you sure?"),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("No")),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  CarMethods().deleteCar(car.id);
                                  Navigator.pop(context);
                                });
                              },
                              child: const Text("Yes")),
                        ],
                      )),
            );
          },
          itemCount: carList.length),
    );
  }
}
