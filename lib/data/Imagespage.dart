import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  get itemBuilder => 3;

  @override
  void initState() {
    ToastContext().init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var imagePathList = [
      'assets/images/pic1.jpg',
      'assets/images/pic2.png',
      'assets/images/pic3.png',
      'assets/images/play_store_512.png',
      'assets/images/rahul.jpeg'
    ];
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Album',
              textAlign: TextAlign.center,
              style: TextStyle(
                  decorationColor: Color.fromARGB(255, 44, 204, 97),
                  color: Colors.red),
            ),
          ),
        ),
        body: GridView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Toast.show("Love from  $index photo",
                    backgroundColor: const Color.fromARGB(255, 250, 59, 148));
              },
              child: Card(
                clipBehavior: Clip.hardEdge,
                elevation: 8,
                shadowColor: Colors.red,
                child: Image.asset(
                  imagePathList[index],
                ),
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
        )
        
        );
  }
}
