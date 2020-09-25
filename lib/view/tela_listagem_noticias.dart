import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_mesa_mobile/controller/tela_listagem_noticias_controller.dart';
import 'package:teste_mesa_mobile/util/values.dart';
import 'package:intl/intl.dart';


class TelaListagemNoticias extends StatelessWidget {

  final TelaListagemNoticiasController _telaListagemNoticiasController = Get.put(TelaListagemNoticiasController());

  String stringToDate(var date){
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = DateFormat('dd-MM-yyyy – kk:mm').format(dateTime);
    return formattedDate;
  }

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
        body: CustomScrollView(
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
                height: double.maxFinite,
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
                                            child: Text(stringToDate(_.noticiasDestaques[index].published_at)),
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
            )
          ],
        ));
  }
}