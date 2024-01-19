import 'package:flutter/material.dart';
import 'package:hero/Hero/hero_details.dart';
import 'package:hero/Hero/hero_info.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HeroItems();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Zaitoon"),
      ),
      body: ListView.builder(
          itemCount: controller.items.length,
          itemBuilder: (context,index){
            return ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HeroDetails(items: controller.items[index])));
              },
              title: Text(controller.items[index].title),
              subtitle: Text(controller.items[index].subtitle),
              leading: Hero(
                //Tag should be different
                //having identical tag will not work in hero animation
                tag: controller.items[index].image,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(controller.items[index].image),
                ),
              ),
            );
          }),
    );
  }
}
