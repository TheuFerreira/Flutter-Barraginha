// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/app.dart';
import 'package:flutter_barraginha/app/screens/projects/components/drawer_widget.dart';

class PartnersPage extends StatelessWidget {
  const PartnersPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 120),
          child: Builder(
            builder: (context) => IconButton(
              icon: const Icon(
                Icons.reorder,
                size: 30,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ),
        centerTitle: true,
        title: Container(
          child: const Text(
            'Parceiros',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          ),
          padding: const EdgeInsets.only(top: 30),
        ),
        toolbarHeight: 180,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /*Padding(
            padding: const EdgeInsets.only(
              top: 40,
              bottom: 40,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child:  ClipRRect
                  (
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset
                    (
                      'images/epamig.png', width: 100, height: 100,
                    ),
                  ),
                  
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 0,
                        blurRadius: 1,
                        blurStyle: BlurStyle.normal,
                        offset: Offset.fromDirection(90),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 290,
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: const [
                        Text(
                          'Epamig',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'A EPAMIG é uma empresa com a finalidade de desenvolver pesquisas relacionadas à agropecuária em Patos de Minas.',
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.justify,
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 0,
                        blurRadius: 1,
                        blurStyle: BlurStyle.normal,
                        offset: Offset.fromDirection(90),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
          ),

          Padding(
            padding: const EdgeInsets.only(
              top: 40,
              bottom: 40,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child:  ClipRRect
                  (
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset
                    (
                      'images/if.png', width: 100, height: 100,
                    ),
                  ),
                  
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 0,
                        blurRadius: 1,
                        blurStyle: BlurStyle.normal,
                        offset: Offset.fromDirection(90),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 290,
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: const [
                        Text(
                          'IFMG Bambuí',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'É uma instituição de ensino da Rede Federal de Educação, que oferta, cursos técnicos e superiores de forma gratuita.',
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.justify,
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 0,
                        blurRadius: 1,
                        blurStyle: BlurStyle.normal,
                        offset: Offset.fromDirection(90),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
          ),*/
          Center
          (
            child: Column
            (
              children: 
              [
                Container
                (
                  width: MediaQuery.of(context).size.width -30,
                  height: MediaQuery.of(context).size.height/4,
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration
                  (
                    color: Colors.white,

                    borderRadius: BorderRadius.only
                    (
                      bottomLeft: Radius.circular(30),
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),

                     boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 0,
                        blurRadius: 1,
                        blurStyle: BlurStyle.normal,
                        offset: Offset.fromDirection(90),
                      ),
                    ],
                  ),

                  child: Row
                  (
                    children: 
                    [
                      Image.asset
                      (
                        'images/epamig.png',
                       /* width: 150,
                        height: 150,*/
                        width: MediaQuery.of(context).size.width/2.7,
                        height: MediaQuery.of(context).size.width/2.7,
                      ),

                      Padding
                      (
                        padding: const EdgeInsets.only
                        (
                          top: 20,
                          left: 0
                        ),
                        child: Column
                        (
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: 
                          // ignore: prefer_const_literals_to_create_immutables
                          [
                            Text
                            (
                              'EPAMIG',
                              style: TextStyle
                              (
                                color: Colors.black54,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10,),
                            SizedBox
                            (
                              width: 200,
                              child: Text
                              (
                                'A EPAMIG é uma empresa com a finalidade de desenvolver pesquisas relacionadas à agropecuária em Patos de Minas.',
                                style: TextStyle
                                (
                                color: Colors.black38,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(height: 40,),

                Container
                (
                  width: MediaQuery.of(context).size.width -30,
                  height: MediaQuery.of(context).size.height/4,
                  decoration: BoxDecoration
                  (
                    color: Colors.white,

                    borderRadius: BorderRadius.only
                    (
                      bottomLeft: Radius.circular(30),
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),

                     boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 0,
                        blurRadius: 1,
                        blurStyle: BlurStyle.normal,
                        offset: Offset.fromDirection(90),
                      ),
                    ],
                  ),

                  child: Row
                  (
                    children: 
                    [
                      Image.asset
                      (
                        'images/if.png',
                        width: MediaQuery.of(context).size.width/2.8,
                        height: MediaQuery.of(context).size.width/2.7,
                      ),

                      Padding
                      (
                        padding: const EdgeInsets.only
                        (
                          top: 20,
                          left: 0
                        ),
                        child: Column
                        (
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: 
                          // ignore: prefer_const_literals_to_create_immutables
                          [
                            Text
                            (
                              'IFMG - BAMBUÍ',
                              style: TextStyle
                              (
                                color: Colors.black54,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10,),
                            SizedBox
                            (
                              width: 200,
                              child: Text
                              (
                                'É uma instituição de ensino da Rede Federal de Educação, que oferta, cursos técnicos e superiores de forma gratuita.',
                                style: TextStyle
                                (
                                color: Colors.black38,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
          
        ],
        
      ),
    );
  }
}
