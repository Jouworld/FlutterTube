import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:buscavideoyoutube/blocs/videos_bloc.dart';
import 'package:buscavideoyoutube/delegates/data_search.dart';
import 'package:buscavideoyoutube/widgets/VideoTile.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 25,
          child: Image.network("https://logodownload.org/wp-content/uploads/2014/10/youtube-logo-8.png"),
        ),
        elevation: 0,
        backgroundColor: Colors.black,
        actions: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text("0"),
          ),
          IconButton(
            icon: Icon(Icons.star),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: ()async{
              String result = await showSearch(context: context, delegate: DataSearch());
              if(result != null) BlocProvider.of<VideosBloc>(context).inSearch.add(result);
              },
          )

        ],
      ),
      body: StreamBuilder(
        stream: BlocProvider.of<VideosBloc>(context).outVideos,
        builder: (context, snapshot){
          if(snapshot.hasData)
            return ListView.builder(
                itemBuilder: (context, index){
                  return VideoTile(
                    snapshot.data[index]
                  );
                },
                itemCount: snapshot.data.length,
            );
          else
            return Container();


        },
      )
    );
  }
}
