

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:introappui/home_page.dart';
import 'package:introappui/utils/Strings.dart';

class IntroPage extends StatefulWidget {
  static final String id = "intro_page";
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController _pageController;
  int _pageIndex=0;
  int currentIndex = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(
      initialPage: 0,

    );
    super.initState();

  }
  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.pushReplacementNamed(context, HomePage.Id);
    },
            child:  Padding(
              padding: EdgeInsets.only(left: 20, right: 20),



            ) ,
          )

        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged:(int index){
              setState((){
                _pageIndex=index;
              });
            },

            children: [
              makePage(

             title: Strings.stepOneTitle,
               content: Strings.stepOneContent,
                image: "assets/images/6666.png",
                 ),
              makePage(

                title: Strings.stepTwooTitle,
                content: Strings.stepTwooContent,
                image: "assets/images/66666.jpg",
              ),
              makePage(

                title: Strings.stepThreeTitle,
                content: Strings.stepThreeContent,
                image: "assets/images/6666.png",
              ),

            ],

          ),
          Container(
            margin: EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator (),

            ),
          ),
          if(_pageIndex==2)Container(
            margin:EdgeInsets.only(right:30,bottom:43),
            child:Row(
              mainAxisAlignment:MainAxisAlignment.end,
              children:[
                _skipButton(title:'Skip'),
              ],
            ),
          ),

        ],
      ),

    );
  }

  Widget makePage({image, title, content}){
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
              ),
              Text(title,style: TextStyle(color: Colors.red,fontSize: 30),),
              SizedBox(height: 10,),
              Text(content,style: TextStyle(color: Colors.grey,fontSize: 15),textAlign: TextAlign.center,),
              SizedBox(height: 10,),

              Image.asset(image),

            ],


          )
        ],

      ),

    );
  }
  Widget _indicator (bool isActive){
    return AnimatedContainer(


      duration: Duration(microseconds: 300),
      height: 6,
     width: isActive ? 30:6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
  List<Widget> _buildIndicator(){
    List<Widget> indicator = [];


    for (int i=0; i<3; i++){
      if(currentIndex == i){
        indicator.add(_indicator(true));
      }else{
        indicator.add(_indicator(false));
      }



    }
    return indicator;
  }
  Widget _skipButton({title}){
    return Container(
      child:GestureDetector(
        onTap:()async{
          await Navigator.pushReplacementNamed(context,HomePage.Id);
        },
        child:Text(title,style:TextStyle(color:Colors.deepOrange,fontSize:20),),
      ),
    );
  }


}
