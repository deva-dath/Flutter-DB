import 'dart:io';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewSample extends StatelessWidget {
  const ListViewSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
            itemBuilder: (ctx, index) {
              return ListTile(
                title: Text('Person $index'),
                subtitle: Text('Message $index'),
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/originals/8c/16/cb/8c16cb9da19085e9ff307c5934ead19d.jpg'),
                ),
                trailing: Text('1$index:00PM'),
              );
            },
            separatorBuilder: (ctx, index) {
              return Divider();
            },
            itemCount: 50),
      ),
    );
  }
}
