import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_mesa_mobile/controller/tela_cadastro_controller.dart';
import 'package:teste_mesa_mobile/util/values.dart';
import 'package:teste_mesa_mobile/view/tela_inicial.dart';
import 'package:toast/toast.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';


class TelaCadastro extends StatelessWidget{

  final TelaCadastroController _telaCadastroController = Get.put(TelaCadastroController());

  var nomeController = TextEditingController();
  var emailController = TextEditingController();
  var senhaController = TextEditingController();
  var confirmarSenhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: Text(
          "Cadastrar",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Values.MAIN_COLOR,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Form(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Container(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.people),
                        border: OutlineInputBorder(),
                        labelText: 'Nome',
                        labelStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal),
                      ),
                      controller: this.nomeController,
                    ),
                  ),
                  Container(
                    child: Container(
                      padding: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                          labelText: 'E-mail',
                          labelStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal),
                        ),
                        controller: this.emailController,
                      ),
                    ),
                  ),
                  Container(
                    child: Container(
                      padding: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(),
                          labelText: 'Senha',
                          labelStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal),
                        ),
                        controller: this.senhaController,
                        obscureText: true
                      ),
                    ),
                  ),
                  Container(
                    child: Container(
                      padding: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(),
                          labelText: 'Confirmar Senha',
                          labelStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal),
                        ),
                        controller: this.confirmarSenhaController,
                        obscureText: true,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      onPressed: () {
                        DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            onConfirm: (date) {
                              var _date = '${date.day}/${date.month}/${date.year}';
                              Get.find<TelaCadastroController>().changeDataNascimento(_date);
                            },
                            currentTime: DateTime.now(), locale: LocaleType.pt);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Data de Nascimento", style: TextStyle(fontSize: 13.5), overflow: TextOverflow.ellipsis,),
                            GetX<TelaCadastroController>(
                              builder: (_){
                                return Row(
                                  children: <Widget>[
                                    Container(
                                      child: Row(
                                        children: <Widget>[
                                          Text(_.dataNascimento.value, style: TextStyle(fontSize: 13.5), overflow: TextOverflow.ellipsis,),
                                          Container(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Icon(Icons.date_range, size: 13.5),
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
                    padding: EdgeInsets.only(top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: BorderSide(color: Values.MAIN_COLOR)),
                        color: Values.MAIN_COLOR,
                        textColor: Values.MAIN_COLOR,
                        padding: EdgeInsets.all(8.0),
                        onPressed: () async {
                          FocusScope.of(context).unfocus();
                          if(senhaController.text.toString().trim() != confirmarSenhaController.text.toString().trim()){
                            Toast.show("As senhas não estão iguais!", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                          } else {
                            var response = await Get.find<TelaCadastroController>().cadastrar(
                                nomeController.text.toString().trim(),
                                emailController.text.toString().trim(),
                                senhaController.text.toString().trim(), context);
                            if(response){
                              Get.offAll(TelaInicial());
                            }
                          }
                        },
                        child: Text("Cadastrar",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18))),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}