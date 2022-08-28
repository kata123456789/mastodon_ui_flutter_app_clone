import 'package:flutter/material.dart';
import 'package:mastodon_clone/icons/iconsax_icons.dart';
import 'package:mastodon_clone/theme/app_colors.dart';
import 'package:mastodon_clone/utils/add_button.dart';
import 'package:mastodon_clone/utils/feed.dart';
import 'package:mastodon_clone/utils/feed_data.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  List bottomNavItems = [
    {
      'icon': Iconsax.home,
      'isIcon': true
    },
    {
      'icon': Iconsax.search_normal,
      'isIcon': true
    },
    {
      'icon': '',
      'isIcon': false
    },
    {
      'icon': Iconsax.message,
      'isIcon': true
    },
    {
      'icon': Iconsax.setting,
      'isIcon': true
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor ,
      body: getBody(),
      appBar: getHeader(),
      bottomNavigationBar: getFooter(),
    );
  }

  PreferredSizeWidget? getHeader(){
    return AppBar(
      backgroundColor: mainColor,
      elevation: 0,
      title: Container(
       // padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 38,
              width: 38,
              //padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: secondaryColor
              ),
              child: const Icon(Iconsax.search_normal, color: Colors.white, size: 18,),
            ),
            const Text('Mastodon', style: TextStyle(fontWeight: FontWeight.w500, letterSpacing: 1),),
            Stack(
              children: [
                const SizedBox(
                  height: 38,
                  width: 38,                  
                child:  Icon(Iconsax.notification, color: Colors.white,),
            ),
            Positioned(
              top: 5,
              right: 11,
              child: Container(
                  height: 6,
                  width: 6,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: blueColor
                  ),
                ),
              )
              ],
            )
           
          ],
        ),
      ),
    );
  }

Widget getBody(){
  return ListView.builder(
      itemCount: feedInfo.length,
      itemBuilder: (_, int index){
      return Feed(
       name: feedInfo[index]['name'],
       linkName: feedInfo[index]['linkName'],
       profileImg: feedInfo[index]['profileImg'],
       timeStamp: feedInfo[index]['timeStamp'],
       postText: feedInfo[index]['postText'],
       postImage: feedInfo[index]['postImage']
       );
    });
}

  Widget getFooter(){
   return Container(
    height: 60,
    width: double.infinity,
    color: secondaryColor,
    child: Padding(
      padding: const EdgeInsets.only(top: 5,left: 15, right:15, bottom:5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(bottomNavItems.length, (index){
          return bottomNavItems[index]['isIcon']?
          InkWell(
            onTap: (){
              onsetState(index);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Icon(bottomNavItems[index]['icon'],
                 color: pageIndex == index? blueColor: Colors.grey[100] ,),
                 const SizedBox(height: 5,),
                Container(
                  height: 4.5,
                  width: 4.5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: pageIndex == index? blueColor: secondaryColor
                  ),
                )
              ]
            )
          ): 
          InkWell(
            onTap: (){
              onsetState(index);
            },
            child:const AddButton()); 
          }),
        ),
      ),
    );
  }

   onsetState(index){
    setState(() {
      pageIndex = index;
    });
  }

}