 import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:workout_ui/video_info.dart';
import 'color.dart' as color;
class HomePage extends StatefulWidget {
   const HomePage({super.key});
 
   @override
   State<HomePage> createState() => _HomePageState();
 }
 
 class _HomePageState extends State<HomePage> {
  List info=[];
    _initData(){
      DefaultAssetBundle.of(context).loadString("json/info.json").then((value){
        setState(() {
          info=json.decode(value);
        });
      });
    }

  @override
  void initState(){
    super .initState();
    _initData();
  }
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor:color.AppColor.homePageBackground,
       body:Container(
         padding: const EdgeInsets.only(top: 70,left: 30,right: 30),
         child: Column(
           children: [
             Row(
               children: [
                 Text("Traning",style: TextStyle(
                   fontSize: 30,
                   color: color.AppColor.homePageTitile,
                   fontWeight: FontWeight.w700,
                 ),),
                 Expanded(child: Container()),
                 Icon(Icons.arrow_back_ios,
                 size:20,
                 color: color.AppColor.homePageicon,
                 ),
                 const SizedBox(width: 10),
                 Icon(Icons.calendar_today_outlined,
                 size:20,
                 color: color.AppColor.homePageicon,
                 ),
                 const SizedBox(width: 15),
                    Icon(Icons.arrow_forward_ios,
                   size: 20,
                   color: color.AppColor.homePageicon,
                   ),
               ],
             ),
            const SizedBox(height: 30),
             Row(
         children: [
           Text("Traning",
             style: TextStyle(
             fontSize: 20,
             color: color.AppColor.homePageSubtitile,
             fontWeight: FontWeight.w700,
           ),),
           Expanded(child: Container()),
           const Text("Details",
             style: TextStyle(
               fontSize: 20,
               color: Colors.blue,
             ),),
     InkWell(
     onTap: (){
     Get.to(()=>const VideoInfo());
     },
             child: Icon(Icons.arrow_forward,
             size: 20,
             color: Colors.blue,
             ),
           ),
         ],
       ),
             const SizedBox(height: 20),
             Container(
               height: 220,
               width: MediaQuery.of(context).size.width,
               decoration: BoxDecoration(
                 gradient: LinearGradient(
                   colors: [
                     color.AppColor.gradientFirst.withOpacity(0.8),
                     color.AppColor.gradientSecond.withOpacity(0.9),
                   ],
                   begin: Alignment.bottomLeft,
                   end: Alignment.centerRight,
                 ),
                 borderRadius: const BorderRadius.only(
                     topLeft:Radius.circular(10),
                 bottomRight: Radius.circular(10),
                 bottomLeft:Radius.circular(10),
                   topRight: Radius.circular(80),
                 ),
                 boxShadow:[
                   BoxShadow(
                     offset:const Offset(5,10),
                     blurRadius:10,
                     color:color.AppColor.gradientSecond.withOpacity(0.2),
                   )
                 ]
               ),
               child: Container(
                 padding: const EdgeInsets.only(left: 20,top: 25,right: 20),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text("Next Workout",style: TextStyle(
                       fontSize:16,
                       color: color.AppColor.homePageContainerTextSmall,
                     ),),
                     const SizedBox(height: 5),
                     Text(
                       "Leg's Toning",style: TextStyle(
                       fontSize:25,
                       color: color.AppColor.homePageContainerTextSmall,
                     ),),
                     const SizedBox(height: 5),
                     Text(
                       "and Glutes Workout",style: TextStyle(
                       fontSize:25,
                       color: color.AppColor.homePageContainerTextSmall,
                     ),),
                     const SizedBox(height: 20),
                     Row(
                       crossAxisAlignment: CrossAxisAlignment.end,
                       children: [
                         Row(
                           children: [
                             Icon(Icons.timer_outlined,
                             size: 20,
                             color: color.AppColor.homePageContainerTextSmall,),
                             const SizedBox(width: 10),
                             Text("60 min",
                               style: TextStyle(
                               fontSize:15,
                               color: color.AppColor.homePageContainerTextSmall,
                             ),),
                           ],
                         ),
                         Expanded(child: Container()),
                         Container(
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(60),
                             boxShadow: [
                               BoxShadow(
                                 color: color.AppColor.gradientFirst,
                                 blurRadius: 10,
                                 offset: const Offset(4,8),
                               )
                             ]
                           ),
                           child: const Icon(
                             Icons.play_circle_fill_outlined,
                             color: Colors.white,
                             size: 60,
                           ),
                         ),

                       ],
                     )
                   ],
                 ),
               ),
             ),
             const SizedBox(height: 5),
             Container(
               height: 180,
               width: MediaQuery.of(context).size.width,
               margin: const EdgeInsets.only(top: 30),
               child:Stack(
                 children: [
                   Container(
                     width: MediaQuery.of(context).size.width,
                     height: 120,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                         image: const DecorationImage(
                           image: AssetImage("images/card1.png"),
                           fit: BoxFit.fill,
                         ),
                       boxShadow: [
                         BoxShadow(
                           blurRadius: 40,
                           offset: const Offset(8,10),
                           color: color.AppColor.gradientSecond.withOpacity(0.3),
                         ),
                         BoxShadow(
                           blurRadius: 10,
                           offset: const Offset(-1,-5),
                           color: color.AppColor.gradientSecond.withOpacity(0.3),
                         )

                       ]
                     ),
                   ),
                   Container(
                     height: 200,
                     width:MediaQuery.of(context).size.width,
                     margin: const EdgeInsets.only(right: 200,bottom:60),
                     decoration: BoxDecoration(
                         //color: Colors.redAccent.withOpacity(0.2),
                         borderRadius: BorderRadius.circular(20),
                         image: const DecorationImage(
                           image: AssetImage("images/figure1.jpg"),
                           fit: BoxFit.fill,
                         ),
                         boxShadow: [
                           BoxShadow(
                             blurRadius: 40,
                             offset: const Offset(8,10),
                             color: color.AppColor.gradientSecond.withOpacity(0.3),
                           ),
                           BoxShadow(
                             blurRadius: 10,
                             offset: const Offset(-1,-5),
                             color: color.AppColor.gradientSecond.withOpacity(0.3),
                           )

                         ]
                     ),
                   ),
                   Container(
                     width: double.maxFinite,
                     height: 80,
                     margin: const EdgeInsets.only(left:80,top: 30),
                     child: Column(
                       children: [
                         Text("You are doing great",style: TextStyle(
                           fontSize: 18,
                           fontWeight: FontWeight.bold,
                           color: color.AppColor.homePageDetails,
                         ),),
                         const SizedBox(height: 10),
                         RichText(text: TextSpan(
                             text: "Keep It Up\n",
                         style: TextStyle(
                           color: color.AppColor.homePageDetails,
                           fontSize: 16,
                         ),
                           children: [
                             const TextSpan(
                               text: "Stick To Your Goals",
                               style: TextStyle(

                               )
                             )
                           ]
                         )),

                       ],
                     ),
                   ),
                 ],
               ),

             ),
             Row(
               children: [
                 Text("Area of focus",
                 textAlign: TextAlign.center,
                 style: TextStyle(
                   fontSize: 25,
                   fontWeight: FontWeight.w500,
                   color:color.AppColor.homePageTitile,
                 ),)
               ],
             ),
             Expanded(child: OverflowBox(
               maxWidth: MediaQuery.of(context).size.width,
               child: MediaQuery.removePadding(
                 removeTop: true,
                 context: context,
                 child: ListView.builder(
                   itemCount: info.length.toDouble()~/2.toInt(),
                     itemBuilder: (_,i){
                     int a=2*i;
                     int b=2*i+1;
                       return Row(
                         children: [
                           Container(
                             height: 170,
                             width: (MediaQuery.of(context).size.width-90)/2,
                             margin:const EdgeInsets.only(left:30,bottom: 15,top: 15),
                             padding: const EdgeInsets.only(bottom: 1),
                             decoration: BoxDecoration(
                               color: Colors.white,
                               borderRadius: BorderRadius.circular(15),
                               image: DecorationImage(
                                 image: AssetImage(
                                   info[a]['img']
                                 ),
                                 fit: BoxFit.contain
                               ),
                               boxShadow: [
                                 BoxShadow(
                                   blurRadius: 3,
                                   offset: const Offset(5,5),
                                   color: Colors.grey.withOpacity(0.1),
                                 ),
                                 BoxShadow(
                                   blurRadius: 3,
                                   offset: const Offset(-5,-5),
                                   color: Colors.grey.withOpacity(0.1),
                                 )
                               ]
                             ),
                             child: Center(
                               child: Align(
                                 alignment: Alignment.bottomCenter,
                                 child: InkWell(
                                   onTap: (){
                                     Get.to(()=>const VideoInfo());
                                   },
                                   child: Text(
                                       info[a]['title'],
                                   style: const TextStyle(
                                     fontSize: 20,
                                     fontWeight: FontWeight.bold,
                                     color: Colors.grey
                                   ),),
                                 ),
                               ),
                             ),
                           ),
                           Container(
                             height: 170,
                             width: (MediaQuery.of(context).size.width-90)/2,
                             margin:const EdgeInsets.only(left:30,bottom: 15,top: 15),
                             padding:  const EdgeInsets.only(bottom: 1),
                             decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.circular(15),
                                 image: DecorationImage(
                                     image: AssetImage(
                                         info[b]['img']
                                     ),
                                     fit: BoxFit.contain
                                 ),
                                 boxShadow: [
                                   BoxShadow(
                                     blurRadius: 3,
                                     offset: const Offset(5,5),
                                     color: Colors.grey.withOpacity(0.1),
                                   ),
                                   BoxShadow(
                                     blurRadius: 3,
                                     offset: const Offset(-5,-5),
                                     color: Colors.grey.withOpacity(0.1),
                                   )
                                 ]
                             ),
                             child: Center(
                               child: Align(
                                 alignment: Alignment.bottomCenter,
                                 child: Text(
                                   info[b]['title'],
                                   style: const TextStyle(
                                       fontSize: 20,
                                       fontWeight: FontWeight.bold,
                                       color: Colors.grey
                                   ),),
                               ),
                             ),
                           ),
                         ],
                       );
                     }
                 ),
               ),
             )
             ),
           ]
         ),
     ),
     );
   }
 }
 