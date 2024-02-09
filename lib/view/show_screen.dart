import 'package:flutter/material.dart';


class ShowScreen extends StatefulWidget {
  const ShowScreen({super.key});

  @override
  State<ShowScreen> createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Shows'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
        child: SizedBox(
          height: double.infinity,
          // width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => const DetailScreen()));
                  },
                  child: Container(
                    height: 180,
                    width: 100,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
