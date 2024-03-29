import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'color.dart' as color;
class VideoInfo extends StatefulWidget {
  const VideoInfo({super.key});

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videoInfo=[];
  final bool _playArea=false;
  late VideoPlayerController _controller;
  _initData() async {
    await DefaultAssetBundle.of(context).loadString("json/videoinfo.json").then((value){
      setState(() {
        videoInfo=json.decode(value);
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
        body: Container(
          decoration: _playArea==false?BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.AppColor.gradientFirst.withOpacity(0.9),
                color.AppColor.gradientSecond,
              ],
              begin: const FractionalOffset(0.0,0.4),
              end: Alignment.topRight,
            )
          ):BoxDecoration(
            color: color.AppColor.gradientSecond,
          ),
          child: Column(
            children: [
              _playArea==false?Container(
                padding: EdgeInsets.only(top: 70,left: 30,right: 30),
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap:(){
                            Get.back();
                          },
                          child: Icon(Icons.arrow_back_ios,
                          size: 20,
                          color: Colors.white,
                          ),
                        ),
                        Expanded(child: Container()),
                        Icon(Icons.info_outline,
                          size: 20,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Leg's Toning",style: TextStyle(
                      fontSize:25,
                      color: color.AppColor.secondpageTitleColor,
                    ),),
                    const SizedBox(height: 5),
                    Text(
                      "and Glutes Workout",style: TextStyle(
                      fontSize:25,
                      color: color.AppColor.secondpageTitleColor,
                    ),),
                    SizedBox(height: 50),
                    Row(
                      children: [
                       Container(
                         width: 90,
                         height: 30,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           gradient: LinearGradient(
                             colors:[
                               color.AppColor.secondpageContainerGradient1stColor,
                               color.AppColor.secondpageContainerGradient2stColor,
                               ],
                             begin: Alignment.bottomLeft,
                             end: Alignment.topRight,
                           )
                         ),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Icon(Icons.timer_outlined,
                             size: 20,
                             color: Colors.white,
                             ),
                             SizedBox(width:10),
                             Text("60 min",
                             style: TextStyle(
                               fontSize: 16,
                               color: Colors.white,
                             ),)
                           ],
                         ),
                       ),
                        SizedBox(width: 20),
                        Container(
                          width: 240,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors:[
                                  color.AppColor.secondpageContainerGradient1stColor,
                                  color.AppColor.secondpageContainerGradient2stColor,
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.handshake_outlined,
                                size: 20,
                                color: Colors.white,
                              ),
                              SizedBox(width:10),
                              Text("Resistant Band,Kettelbell",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),)
                            ],
                          ),
                        )
                      ],
                    ),


                  ],
                ),
              ):Container(
               child: Column(
                 children: [
                   Container(
                     height: 100,
                       padding: EdgeInsets.only(top: 50,left: 30,right: 30),
                       child: Row(
                         children: [
                           InkWell(
                             onTap: (){
                               debugPrint("tapped");
                             },
                             child: Icon(Icons.arrow_back_ios,
                             size: 20,
                             color: Colors.white,
                             ),
                           ),
                           Expanded(child: Container()),
                           Icon(Icons.info_outline,
                           size: 20,
                           color: Colors.white,
                           )
                         ],
                       ),
                   ),
                   _playVideo(context),
                 ],
               ),
              ),
              Expanded(child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70),
                  )
                ),
                child: Column(
                  children: [
                    SizedBox(height:30),
                    Row(
                      children: [
                        SizedBox(width: 30),
                        Text("Circuit 1:Legs Toning",
                          style:TextStyle(
                            fontSize: 20,
                            color: color.AppColor.circuitsColor,
                            fontWeight: FontWeight.bold,
                          ) ,),
                        Expanded(child: Container()),
                        Row(
                          children: [
                            Icon(Icons.loop,
                              size: 30,
                              color: color.AppColor.loopColor,),
                            SizedBox(width: 10,),
                            Text("3 Sets",
                            style: TextStyle(
                              fontSize: 15,
                              color: color.AppColor.setColor,
                            ),)
                          ],
                        ),
                        SizedBox(width: 20,),
                      ],
                    ),
                    SizedBox(height: 20),
                    Expanded(
                        child: _listView()),
                  ],
                ),
              ))
            ],
          ),
        ));
  }
  Widget _playVideo(BuildContext context){
    final controller= _controller;
    if(_controller!=null&&controller.value.isInitialized){
      return Container(
        height: 300,
        width: 300,
        child: VideoPlayer(controller),
      );
    }else{
      return Text("Being Initialzed pls wait");
    }
  }
  _onTapVideo(int index){
final controller=VideoPlayerController.networkUrl(videoInfo[index]["viderUrl"]);
_controller=controller;
setState(() {
});
controller..initialize().then((_){
  _controller.play();
  setState(() {
  });
});

  }
  _listView(){
return  ListView.builder(
    padding: EdgeInsets.symmetric(horizontal: 30,vertical:8),
    itemCount: videoInfo.length,
    itemBuilder: (_,int index){
      return GestureDetector(
        onTap: (){
          _onTapVideo(index);
          debugPrint(index.toString());
          setState(() {
            if(_playArea==false){
              _playArea==true;
            }
          });
        },
        child:_buildCard(index),
      );
    });
  }
  _buildCard(int index){
    return Container(
      height: 135,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(
                            videoInfo[index]["thumbnail"]
                        )
                    )
                ),
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(videoInfo[index]["title"],
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(top: 3),
                    child: Text(
                      videoInfo[index]["time"],
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ),

                ],
              )
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Container(
                width: 80,
                height: 20,
                decoration: BoxDecoration(
                  color: Color(0xFFeaeefc),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "15s REST",
                    style: TextStyle(
                        color: Color(0xFF839fed)
                    ),
                  ),
                ),

              ),
              Row(
                children: [
                  for (int i=0;i<70;i++)
                    i.isEven?Container(
                      width: 3,
                      height: 1,
                      decoration: BoxDecoration(
                        color: Color(0xFF839fed),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ):Container(
                      width: 3,
                      height: 1,
                      color: Colors.white,
                    )
                ],
              )
            ],
          ),
        ],
      ),


    );


  }
}
