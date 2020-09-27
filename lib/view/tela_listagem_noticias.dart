import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_mesa_mobile/controller/tela_listagem_noticias_controller.dart';
import 'package:teste_mesa_mobile/util/helper.dart';
import 'package:teste_mesa_mobile/util/values.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';


class TelaListagemNoticias extends StatelessWidget {

  final TelaListagemNoticiasController _telaListagemNoticiasController = Get.put(TelaListagemNoticiasController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: Text(
            "Mesa News",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Values.MAIN_COLOR,
          leading: Container(),
          actions: [
            IconButton(
              icon: Icon(Icons.filter_list, color: Colors.white,),
            )
          ],
        ),
        body: WillPopScope(
          onWillPop: () => exit(0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 20, left: 20),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Destaques",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                  child: Container(
                      height: MediaQuery.of(context).size.height / 4,
                      padding: EdgeInsets.only(left: 20, top: 10),
                      child: GetX<TelaListagemNoticiasController> (
                        builder: (_) {
                          return ListView.builder(
                              itemCount: _.noticiasDestaques.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          child: Image.network(_.noticiasDestaques[index].image_url, width: 180, height: 150,),
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(16.0),
                                              width: MediaQuery.of(context).size.width * 0.6,
                                              child: Text(_.noticiasDestaques[index].title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: IconButton(icon: Icon(Icons.favorite_border),),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(top:16, left: 20),
                                                  child: Text(Helper.stringToDate(_.noticiasDestaques[index].published_at)),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              }
                          );
                        },
                      )
                  )
              ),
              SliverToBoxAdapter(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10, left: 20),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Últimas notícias",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              PagewiseSliverList(
                  pageSize: 10,
                  loadingBuilder: (context) {
                    return Text('Carregando...');
                  },
                  noItemsFoundBuilder: (context) {
                    return Text('Não foram encontrados registros!');
                  },
                  itemBuilder: (context, entry, index) {
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 30),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: FittedBox(
                            child: Image.network(entry.image_url),
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(icon: Icon(Icons.favorite_border), iconSize: 25),
                              Text(Helper.stringToDate(entry.published_at), style: TextStyle(fontSize: 16),)
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, right:10),
                          child: Text(entry.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.justify,),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                          child: Text(entry.description, style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 16), textAlign: TextAlign.justify),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 10, left:10),
                          child: Divider(color: Colors.black,),
                        )
                      ],
                    );
                  },
                  pageFuture: (pageIndex) => Get.find<TelaListagemNoticiasController>().loadNoticias(pageIndex + 1)
              ),
            ],
          ),
        )
    );
  }
}
