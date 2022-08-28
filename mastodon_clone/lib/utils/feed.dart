import 'package:flutter/material.dart';
import 'package:mastodon_clone/icons/iconsax_icons.dart';
import 'package:mastodon_clone/theme/app_colors.dart';


class Feed extends StatelessWidget{

  final String name;
  final String linkName;
  final String profileImg;
  final String timeStamp;
  final String postText;
  final String postImage;
   
   const Feed({
    required this.name, 
    required this.linkName,
    required this.profileImg,
    required this.timeStamp,
    required this.postText,
    required this.postImage,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
        margin: const EdgeInsets.only(left: 10.0,right: 10.0,top: 20),
        child: Column(
          children: [
            //user info and time stamp
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    //profile image
                    Container(
                      height: 38,
                      width: 38,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(profileImg),
                          fit: BoxFit.cover)
                  
                      ),
                    ),
                    const SizedBox(width: 7,), 
                    //username and link_name
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500, letterSpacing:0.5), ),
                        const SizedBox(height: 4,), 
                        Text(linkName,style: const TextStyle(color: linkTextColor, fontSize: 13.5,),),
                      ],
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     Text('55m', style: TextStyle(color: Colors.white.withOpacity(0.7))),
                     const SizedBox(width: 15,),
                     Transform.rotate(angle: 1.55,child: const Icon(Iconsax.more, color: Colors.white, size: 19,),)
            
                    ],
                  ),
                )
              ],
            ),
           const  SizedBox(height: 17,),
            //Content text
            RichText(text: TextSpan(
              children:  [
                TextSpan(
                  text: postText,
                  style: const TextStyle( color: Colors.white,
                  fontSize: 16,
                  //letterSpacing: 2,
                  wordSpacing: 4,
                  fontWeight: FontWeight.w100
                  )
                  )
              ]
            )),

            const SizedBox(height: 17,),
            //post image
            Container(
              height: 270,
              decoration: BoxDecoration(
                color: linkTextColor,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(postImage),
                  fit: BoxFit.cover
                ),
              )
            ),
            
            const SizedBox(height: 15,),
            //Misc functions
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  //chat icon
                  Icon(Iconsax.message, color: Colors.white, size: 20,),
                  //retweet icon
                  Icon(Iconsax.repeat, color: Colors.white,size: 20),
                  //love icon
                  Icon(Iconsax.heart, color: Colors.white,size: 20),
                  //share icon
                  Icon(Iconsax.send_2, color: Colors.white,size: 20),

                ],
              ),
            ),

          const SizedBox(height: 14,),

           Container(
            decoration: const BoxDecoration(
              border: Border(
               bottom: BorderSide(
                   color: secondaryColor,
                   width: 1 
                  ),
                )
              ),
            )
          ]
        ),
      );
  }
}