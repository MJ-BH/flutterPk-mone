import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pokemone.dart';

class Component {
  loadlist(List<Pokemon> data) {
    return ListView.separated(
        itemBuilder: (_, index) {
          return InkWell(
            child: cardPokemone(data[index]),
            onHover: (value) {
              print("test");
            },
            onTap: () => Get.defaultDialog(
                backgroundColor: Colors.brown, title: "this is ${data[index].name}", 
                middleText:data[index].xdescription + "\n" + data[index].ydescription  , 
                ), 
          );
        },
        separatorBuilder: (_, index) => Divider(
              color: Colors.blueGrey,
              thickness: 2,
            ),
        itemCount: data.length);
  }
}

cardPokemone(Pokemon pok) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        width: Get.width * 0.25,
        height: Get.height * 0.1,
        child: Image.network(pok.imageurl),
      ),
      textpokemone(pok.category, pok.name)
    ],
  );
}

textpokemone(String categorey, String name) {
  return RichText(
      text: TextSpan(
          text: name,
          style: TextStyle(
              fontSize: 22,
              color: Colors.green,
              backgroundColor: Colors.indigo),
          children: <TextSpan>[
        TextSpan(
            text: "        " + categorey,
            style: TextStyle(fontSize: 22, color: Colors.redAccent))
      ]));
}
