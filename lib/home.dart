import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              semanticLabel: 'Menu',
            ),
            onPressed: () {
              print('Menu Button');
            },
          ),
          title: Text('SHRINE'),
          actions: [
            IconButton(
                onPressed: () {
                  print('Search Button');
                },
                icon: Icon(
                  Icons.search,
                  semanticLabel: 'Search',
                )),
            IconButton(
                onPressed: () {
                  print('filter Button');
                },
                icon: Icon(
                  Icons.tune,
                  semanticLabel: 'Filter',
                ))
          ],
        ),
        body: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 8/9,
            padding: EdgeInsets.all(16),
            children: _buildGridCards(10))
    );
  }

  List<Card> _buildGridCards(int count) {
    List<Card> cards = List.generate(count, (int index) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 18.0 / 11.0,
              child: Image.asset('assets/diamond.png'),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Title'),
                  SizedBox(
                    height: 8,
                  ),
                  Text('Secondary Text')
                ],
              ),
            )
          ],
        ),
      );
    });

    return cards;
  }
}
