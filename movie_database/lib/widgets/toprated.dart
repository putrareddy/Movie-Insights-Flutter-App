import 'package:flutter/material.dart';
import 'package:movie_database/utils/test.dart';

import '../description.dart';

class TopRated extends StatelessWidget {
  final List toprated;
  const TopRated({Key ?key, required this.toprated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text:'Top Rated Movies',size: 26),
          SizedBox(height: 10,),
          Container(height: 270,
            child: ListView.builder(itemCount: toprated.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>
                          Description(
                            name: toprated[index]['title'] == null?'Loading...':toprated[index]['title'],
                            bannerurl: toprated[index]['backdrop_path']==null?"https://thumbs.gfycat.com/RigidPaltryAntelope-max-1mb.gif" :
                            'https://image.tmdb.org/t/p/w500'+toprated[index]['backdrop_path'],
                            posterurl: toprated[index]['poster_path']==null? "https://thumbs.gfycat.com/RigidPaltryAntelope-max-1mb.gif" :
                            'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path'],
                            description: toprated[index]['overview'] == null?'Loading...':toprated[index]['overview'],
                            vote: toprated[index]['vote_average']== null?'Loading':toprated[index]['vote_average'].toString(),
                            launch_on: toprated[index]['release_date'] == null?'Loading...':toprated[index]['release_date'],
                          )
                      )
                      );},
                    child: Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path']
                                    )
                                )
                            ),
                          ),
                          Container(child: ModifiedText(text: toprated[index]['title']!=null?
                          toprated[index]['title']:'Loading',size: 15,),)
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
