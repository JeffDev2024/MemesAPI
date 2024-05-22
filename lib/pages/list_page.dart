import 'package:flutter/material.dart';
import 'package:memes_api/pages/detail_meme_page.dart';
import 'package:memes_api/repository/meme_db_api.dart';

import '../models/response_api.dart';

class listPage extends StatefulWidget {
  const listPage({super.key});

  @override
  State<listPage> createState() => _listPageState();
}

class _listPageState extends State<listPage>{

  List<Memes> _listMemes= <Memes>[];
  final memesDBApi _memesDBApi  = memesDBApi();

  Future _getMemes() async{
    var resultsFuture = await _memesDBApi.getMemesList();
    setState(() {
      resultsFuture.memes?.forEach((meme){
        _listMemes.add(meme);
      });
    });

  }

  @override
  void initState(){
    _getMemes();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 16),
        child: ListView.builder(
            itemCount: _listMemes.length,
            itemBuilder: (context,index){
              Memes meme = _listMemes[index];
              return InkWell(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>detailMemePage(meme)));
                },
                child: Card(
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
                ),
              );
            }
        ),
      )
    );
  }
}
