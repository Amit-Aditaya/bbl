import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/custom_widgets/child_circle_avatar.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';

class RemedyAgePage extends StatelessWidget {
  const RemedyAgePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Colors.white,
        title: 'Remedy Age ',
      ),
      body: Container(
        color: Colors.transparent,
        width: double.infinity,
        child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              return Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 12.5),
                  padding: const EdgeInsets.all(5),
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'finalRemedyPage');
                        },
                        child: const ChildCircleAvatar(),
                      ),
                      const SizedBox(height: 7.5),
                      const Text(
                        'ABCD',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
