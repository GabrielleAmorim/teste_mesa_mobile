import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:teste_mesa_mobile/controller/tela_listagem_noticias_controller.dart';
import 'package:teste_mesa_mobile/util/values.dart';
import 'package:teste_mesa_mobile/view/tela_listagem_noticias.dart';

class TelaFiltro extends StatelessWidget {

  final TelaListagemNoticiasController _telaFiltroController = Get.put(TelaListagemNoticiasController());

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: Text(
            "Filtro",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Values.MAIN_COLOR,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Get.back();
            },
          ),
          actions: [
            GestureDetector(
                onTap: () {
                  Get.find<TelaListagemNoticiasController>().limparFiltro();
                },
                child: Container(
                  padding: EdgeInsets.only(right: 10),
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Limpar",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ))
          ],
        ),
        body: Column(
          children: [
            Container(
              child: RaisedButton(
                onPressed: () {
                  DatePicker.showDatePicker(context, showTitleActions: true,
                      onConfirm: (date) {
                    var _dateFiltro = '${date.day}/${date.month}/${date.year}';
                    var _dateFormatada = '${date.year}-${date.month}-${date.day}';
                    Get.find<TelaListagemNoticiasController>().changeData(_dateFiltro, _dateFormatada);
                  }, currentTime: DateTime.now(), locale: LocaleType.pt);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Data",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      GetX<TelaListagemNoticiasController>(
                        builder: (_) {
                          return Row(
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      _.dataFiltro.value,
                                      style: TextStyle(fontSize: 15),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Icon(Icons.date_range, size: 15),
                                    )
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      )
                    ],
                  ),
                ),
                color: Colors.white,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.09,
              child: Card(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: Text("Apenas favoritos",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                      child: SizedBox(
                          width: 80,
                          height: 10,
                          child: GetX<TelaListagemNoticiasController>(
                            builder: (_) {
                              return CupertinoSwitch(
                                value: _.apenasFavoritos.value,
                                onChanged: (bool val) {
                                  _.changeApenasFavoritos(val);
                                },
                              );
                            },
                          )))
                ],
              )),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: GestureDetector(
            child: Container(
                height: MediaQuery.of(context).size.height * 0.08,
                color: Values.MAIN_COLOR,
                child: Center(
                  child: Text(
                    "Filtrar",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                )),
            onTap: () async {
              Get.to(TelaListagemNoticias());
            },
          ),
        ));
  }
}
