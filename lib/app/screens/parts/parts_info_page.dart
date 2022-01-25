// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_barraginha/Consts/app_colors.dart';
import 'package:flutter_barraginha/Consts/text_styles.dart';
import 'package:flutter_barraginha/app/app.dart';

class PartsInfoPage extends StatelessWidget {
  const PartsInfoPage ({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold
    (
     body: Container
     (
       width: size.width,
       height: size.height,

       child: Column
    (
        children: 
        [
          Expanded
          (
            child: Container
            (
              
              decoration: BoxDecoration
              (
                color: AppColors.primaryClor
              ),
              child: SafeArea(
                child: Column
                (
                  children: 
                  [
                    Row
                    (
                      children: 
                      // ignore: prefer_const_literals_to_create_immutables
                      [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: IconButton(onPressed: () 
                          {
                            Navigator.pop(context);
                          }, 
                          icon: Icon
                          (
                            Icons.arrow_back_ios, color: Colors.white,
                          ),
                       ),
                        )

                      ],
                    ),

                    Expanded
                    (
                      child: Container
                      (
                        padding: EdgeInsets.only(bottom: 20), 
                        child: Center
                        (
                          child: Text
                          (
                            'Informações do Trecho',
                            style: TextStyles.title,
                            
                          ),
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ),
            
          ),
          Expanded
          (
            child: 
            Column
            (
            
              children: 
              // ignore: prefer_const_literals_to_create_immutables
              [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: 
                  // ignore: prefer_const_literals_to_create_immutables
                  [
                    Padding
                    (
                      padding: const EdgeInsets.only(top: 30, left: 20),
                      child: Text
                      (
                        'Básico',
                        style: TextStyles.titleBold,
                        
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40,),
                Expanded(
                  child: Row
                  (
                    children: 
                    [
                      Expanded
                      ( 
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column
                          (
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: 
                            // ignore: prefer_const_literals_to_create_immutables
                            [
                              Text
                              (
                                'Tamanho',
                                style: TextStyles.titleNormal,
                              ),

                              SizedBox(height: 5,),

                              Text
                              (
                                'Raio: 2m',//trocar por parametro,
                                style: TextStyles.textNormal,
                                textAlign: TextAlign.left,
                              ),

                               SizedBox(height: 3,),

                              Text
                              (
                                'Profundidade: 21m',//trocar por parametro,
                                style: TextStyles.textNormal,
                                textAlign: TextAlign.left,
                              ),

                               SizedBox(height: 3,),

                                Text
                              (
                                'Volume: 2111L',//trocar por parametro,
                                style: TextStyles.textNormal,
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                        )
                      ),

                       Expanded
                      ( 
                        child: Column
                        (
                          
                          children: 
                          [
                            Text
                            (
                              'Bolsões',
                              style: TextStyles.titleNormal,
                            ),
                            SizedBox(height: 5,),

                              Text
                            (
                              '9',//trocar por variavel
                              style: TextStyles.textNormal,
                            )
                          ],
                        )
                      ),
                       Expanded
                      ( 
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column
                          (
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: 
                            [
                                Text
                              (
                                'Distância',
                                style: TextStyles.titleNormal,
                              ),
                              SizedBox(height: 5,),

                                Text
                              (
                                '90m',//trocar por variavel
                                style: TextStyles.textNormal,

                                textAlign: TextAlign.end,
                              ),
                              
                            ],
                          ),
                        )
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          Divider(thickness: 1,),

          Expanded
          (
            child: 
            Column
            (
            
              children: 
              // ignore: prefer_const_literals_to_create_immutables
              [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: 
                  // ignore: prefer_const_literals_to_create_immutables
                  [
                    Padding
                    (
                      padding: const EdgeInsets.only(top: 30, left: 20),
                      child: Text
                      (
                        'Extra',
                        style: TextStyles.titleBold,
                        
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40,),
                Expanded(
                  child: Row
                  (
                    children: 
                    [
                      Expanded
                      ( 
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column
                          (
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: 
                            // ignore: prefer_const_literals_to_create_immutables
                            [
                              Text
                              (
                                'Solo',
                                style: TextStyles.titleNormal,
                              ),

                              SizedBox(height: 5,),

                              Text
                              (
                                'Tipo01',//trocar por parametro,
                                style: TextStyles.textNormal,
                                textAlign: TextAlign.left,
                              ),

                               SizedBox(height: 10,),

                              Text
                              (
                                'Declividade',
                                style: TextStyles.titleNormal,
                                textAlign: TextAlign.left,
                              ),

                               SizedBox(height: 3,),

                                Text
                              (
                                '2111m',//trocar por parametro,
                                style: TextStyles.textNormal,
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                        )
                      ),

                       Expanded
                      ( 
                        child: Column
                        (
                          
                          children: 
                          [
                            Text
                            (
                              'Altitude',
                              style: TextStyles.titleNormal,
                            ),
                            SizedBox(height: 5,),

                            Text
                            (
                              'Ponto 1: 5000m',//trocar por variavel
                              style: TextStyles.textNormal,
                            ),

                            Text
                            (
                              'Ponto 2: 2000m',//trocar por variavel
                              style: TextStyles.textNormal,
                            ),
                          ],
                        )
                      ),
                       Expanded
                      ( 
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column
                          (
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: 
                            [
                                Text
                              (
                                'Coordenadas',
                                style: TextStyles.titleNormal,
                              ),

                              SizedBox(height: 5,),

                              Text
                              (
                                'Ponto1',
                                style: TextStyles.textNormal,

                                textAlign: TextAlign.end,
                              ),

                              Text
                              (
                                'Lat: 54455445541',//trocar por variavel
                                style: TextStyles.textNormal,

                                textAlign: TextAlign.end,
                              ),

                               Text
                              (
                                'Long: 5445544554',//trocar por variavel
                                style: TextStyles.textNormal,

                                textAlign: TextAlign.end,
                              ),

                              SizedBox(height: 10,),

                                Text
                              (
                                'Ponto2',
                                style: TextStyles.textNormal,

                                textAlign: TextAlign.end,
                              ),

                                 Text
                              (
                                'Lat: 54455445541',//trocar por variavel
                                style: TextStyles.textNormal,

                                textAlign: TextAlign.end,
                              ),

                               Text
                              (
                                'Long: 5445544554',//trocar por variavel
                                style: TextStyles.textNormal,

                                textAlign: TextAlign.end,
                              ),

                             
                              
                            ],
                          ),
                        )
                      ),
                    ],
                  ),
                )
              ],
            ),
            
          )
        ],
     ),
    )
    );
  }
}