import 'package:flutter/material.dart';
import 'package:memes_api/models/local_meme.dart';
import 'package:memes_api/pages/favorites_page.dart';

import '../boxes.dart';

class detailMemePage extends StatefulWidget {
  var meme;


  detailMemePage(this.meme);

  @override
  State<detailMemePage> createState() => _detailMemePageState(meme);
}

class _detailMemePageState extends State<detailMemePage> {
  var meme;

  _detailMemePageState(this.meme);

  bool isFavorite=false;

  void _getFavoritesMemes(){
    final box = Boxes.getFavoritesMemes();
    box.values.forEach((element){
      if(element.id == meme.id){
        print("${element.id} is in favorities");
        isFavorite=true;
      }
    });
  }

  @override
  void initState(){
    _getFavoritesMemes();
    super.initState();
  }

  void _onFavoriteButtonClicked(){
    var localMeme = LocalMeme()
    ..id=meme.id
    ..description=meme.description
    ..url=meme.url;

    final box = Boxes.getFavoritesMemes();
    if(isFavorite){
      print("Deleted");
      box.delete(localMeme.id);
    }else{
      print("Added");
      box.put(localMeme.id,localMeme);
    }

    setState(() {
      isFavorite= !isFavorite;
    });

  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${meme.id}"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 350,
                  width: 350,
                  child: Ink.image(image: NetworkImage("${meme.url}"))
              ),
              Row(
                  children: [
                    Expanded(
                        child: IconButton(
                          alignment: Alignment.topRight,
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border
                          ),
                          color: Colors.red,
                          onPressed: ((){
                             _onFavoriteButtonClicked();
                          }),
                        )
                    )
                  ],
              ),
              const SizedBox(
                height: 7,
              ),
              Text("Description: ${meme.description}")

            ]

          ),
        ),
      ),
    );
  }
}
