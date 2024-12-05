import 'package:flutter/material.dart';

class search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.purple,
              pinned: true,
              centerTitle: true,
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Arama',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,

                    ),
                  ),
                ],
              ),
            ),
          ];
        },
        body: Center(

        ),
      ),
    );
  }
}
