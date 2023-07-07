import 'package:flutter/material.dart';
import 'package:movie_database/utils/test.dart';

import '../description.dart';

class TV extends StatelessWidget {
  final List tv;
  const TV({Key ?key, required this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text:'Popular Tv Shows',size: 26),
          SizedBox(height: 10,),
          Container(height: 200,
            child: ListView.builder(
                itemCount: tv.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, index){
                  return InkWell(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      Description(
                        name: tv[index]['title'] == null?'Loading...':tv[index]['title'],
                        bannerurl: tv[index]['backdrop_path']==null?"https://thumbs.gfycat.com/RigidPaltryAntelope-max-1mb.gif" :
                          'https://image.tmdb.org/t/p/w500'+tv[index]['backdrop_path'],
                        posterurl: tv[index]['poster_path']==null? "https://thumbs.gfycat.com/RigidPaltryAntelope-max-1mb.gif" :
                          'https://image.tmdb.org/t/p/w500'+tv[index]['poster_path'],
                        description: tv[index]['overview'] == null?'Loading...':tv[index]['overview'],
                        vote: tv[index]['vote_average']== null?'Loading':tv[index]['vote_average'].toString(),
                        launch_on: tv[index]['release_date'] == null?'Loading...':tv[index]['release_date'],
                      )
                    ));},
                    child: Container(
                      padding: EdgeInsets.all(5),
                      width: 250,
                      child: Column(
                        children: [
                          Container(
                            width: 250,
                            height:140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: tv[index]['backdrop_path'] == null ? NetworkImage("https://thumbs.gfycat.com/RigidPaltryAntelope-max-1mb.gif") : NetworkImage(
                                        'https://image.tmdb.org/t/p/w500'+tv[index]['backdrop_path']
                                    ),fit: BoxFit.cover
                                )
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(child: ModifiedText(text: tv[index]['original_name']!=null?
                          tv[index]['original_name']:'Loading',size: 15,),)
                        ],
                      ),
                    ),
                  );
                }
            ),)
        ],
      ),
    );
  }
}
