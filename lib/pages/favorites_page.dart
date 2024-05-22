import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:memes_api/models/local_meme.dart';
import 'package:memes_api/pages/detail_meme_page.dart';

import '../boxes.dart';

class favoritesPage extends StatefulWidget {
  const favoritesPage({super.key});

  @override
  State<favoritesPage> createState() => _favoritesPageState();
}

class _favoritesPageState extends State<favoritesPage> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Boxes.getFavoritesMemes().listenable(),
        builder: (context,box,_){
            final favoriteMemeBox=box.values.toList().cast<LocalMeme>();
            return ListView.builder(
              itemCount: favoriteMemeBox.length,
              itemBuilder: (BuildContext context, int index){
                final meme= favoriteMemeBox[index];
                return InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>detailMemePage(meme)));
                    },
                    child:Card(
                    surfaceTintColor: Colors.white54,
                    elevation: 4.0,
                    child: Column(
                      children: [
                        ListTile(
                            title: Text("Meme # ${meme.id!}",
                                style: TextStyle(
                                    color: Colors.black,fontSize: 20)
                            )
                        ),
                        Container(
                            height: 300,
                            width: 300,
                            child: Ink.image(image: NetworkImage("${meme.url}"))
                        ),
                        const SizedBox(
                          height: 16,
                        )
                      ],
                    ),
                  )
                );
              }

            );
        }
    );
  }
}
