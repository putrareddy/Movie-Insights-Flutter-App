import 'package:flutter/material.dart';
import 'package:movie_database/utils/test.dart';

import '../description.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  const TrendingMovies({Key ?key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text:'Trending Movies',size: 26),
          SizedBox(height: 10,),
          Container(height: 270,
          child: ListView.builder(itemCount: trending.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                    Description(
                      name: trending[index]['title'] == null?'Loading...':trending[index]['title'],
                      bannerurl: trending[index]['backdrop_path']==null?"https://thumbs.gfycat.com/RigidPaltryAntelope-max-1mb.gif" :
                      'https://image.tmdb.org/t/p/w500'+trending[index]['backdrop_path'],
                      posterurl: trending[index]['poster_path']==null? "https://thumbs.gfycat.com/RigidPaltryAntelope-max-1mb.gif" :
                      'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path'],
                      description: trending[index]['overview'] == null?'Loading...':trending[index]['overview'],
                      vote: trending[index]['vote_average']== null?'Loading':trending[index]['vote_average'].toString(),
                      launch_on: trending[index]['release_date'] == null?'Loading...':trending[index]['release_date'],
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
                            'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path']
                          )
                        )
                      ),
                    ),
                    Container(child: ModifiedText(text: trending[index]['title']!=null?
                      trending[index]['title']:'Loading',size: 15,),)
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
