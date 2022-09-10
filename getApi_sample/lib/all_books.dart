import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:getapi_sample/text_widget.dart';
import 'article_info.dart';
import 'package:getapi_sample/my_api.dart';


class AllBooks extends StatefulWidget {
  const AllBooks({Key? key}) : super(key: key);
  @override
  _AllBooksState createState() => _AllBooksState();
}

class _AllBooksState extends State<AllBooks> {

  var articles = <ArticleInfo>[];
  @override
  void initState() {
    _getArticles();
    super.initState();
  }
  _getArticles() {
  CallApi().getArticleData('getrecent').then((response){
  Iterable list = json.decode(response.body),
  articles = list.map((model) => ArticleInfo.fromJson(model)).toList();

  });
}
@override
Widget build(BuildContext context) {
  final double height=MediaQuery.of(context).size.height;
  final double width=MediaQuery.of(context).size.width;
  return Scaffold(
      body: Container(
        color:Colors.white,
        child: SafeArea(
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height*0.02,),
                Container(
                  padding: const EdgeInsets.only(left:20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon:
                          const Icon(Icons.arrow_back_ios, color:Color(0xFF363f93)),
                          onPressed:()=> Navigator.pop(context)),
                      IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon:
                          const Icon(Icons.home_outlined, color:Color(0xFF363f93)),
                          onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Container()))),
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
                Expanded(
                  child: SingleChildScrollView(
                    child: articles.length == 0 ? const CircularProgressIndicator(): Column(
                      // to have a ciculerProgressIndicator before d dsiplay of server data


                      children:
                      articles.map((article){
                        return   GestureDetector(
                            onTap:(){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>Container())
                              );
                            },
                            child:Container(
                                padding: const EdgeInsets.only(left: 20, right: 20),
                                height: 250,

                                child: Stack(
                                  children: [
                                    Positioned(
                                        top:35,
                                        child: Material (
                                            elevation: 0.0,
                                            child: Container(
                                              height: 180.0,
                                              width: width*0.9,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(0.0),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.grey.withOpacity(0.3),
                                                      offset: const Offset(0.0, 0.0),
                                                      blurRadius: 20.0,
                                                      spreadRadius: 4.0)],
                                              ),
                                              // child: Text("This is where your content goes")
                                            )
                                        )
                                    ),
                                    Positioned(
                                        top:0,
                                        left: 10,
                                        child: Card(
                                            elevation: 10.0,
                                            shadowColor: Colors.grey.withOpacity(0.5),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(15.0),
                                            ),
                                            child:Container(
                                                height: 200,
                                                width: 150,
                                                decoration:BoxDecoration(
                                                  borderRadius:BorderRadius.circular(10.0),
                                                  image:  DecorationImage(
                                                    fit:BoxFit.fill,
                                                    image:NetworkImage("http://mark.dbestech.com/uploads/" +article.img),
                                                  ),
                                                )

                                            )
                                        )
                                    ),
                                    Positioned(
                                        top:45,
                                        left: width*0.4,
                                        child: Container (
                                            height: 200,
                                            width: 150,
                                            child:Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                TextWidget(
                                                    text: article.title,
                                                    fontSize: 20,
                                                    color:Colors.grey
                                                ),
                                                TextWidget(
                                                    text:"Author: Mike Ahmed",
                                                    fontSize:16
                                                ),
                                                const Divider(
                                                    color:Colors.black
                                                ),
                                                TextWidget(
                                                    text: article.description,
                                                    fontSize: 16,
                                                    color:Colors.grey
                                                ),
                                              ],
                                            )
                                        )
                                    ),
                                  ],
                                )
                            )
                        );
                        }).toList(),
                      //debugPrint(article.img.toString());


                    ),

                  ),
                ),
              ],
            )
        ),
      )
  );
}

}

