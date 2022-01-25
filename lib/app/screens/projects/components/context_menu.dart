// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:flutter_barraginha/Consts/app_colors.dart';
import 'package:flutter_barraginha/Consts/text_styles.dart';
import 'package:flutter_barraginha/app/screens/projects/controllers/projects_controller.dart';
import 'package:flutter_barraginha/app/screens/projects/dialogs/save_project_dialog.dart';
import 'package:flutter_barraginha/app/shared/database/responses/display_project_response.dart';
import 'package:flutter_barraginha/app/shared/services/dialog_service.dart';
import 'package:google_fonts/google_fonts.dart';

class ContextMenu extends StatelessWidget {
  final DisplayProjectResponse project;
  final ProjectsController controller;
  final TextEditingController searchController;
  const ContextMenu({ Key? key, required this.controller , required this.project, required this.searchController}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
  editar()
  {

    showDialog
    (
      
      context: context, 
      builder: (BuildContext context)
      {
        return SaveProjectDialog(project,);
      }
    );

    
  }

  excluir()
  async 
  {
     final result = await DialogService.showQuestionDialog(
      context,
      'Excluir',
      'Deseja realmente excluir o projeto ${project.title}?',
    );

    if (!result) return;

    await controller.delete(project);
    await controller.search(searchController.text);

    Navigator.of(context).pop();
  }

  
    return  Center
      (
        child: SizedBox
        (
          width: 300,
          height: 166,
          child: Container
          (
           

            decoration: BoxDecoration
            (
               color: Colors.white,
               borderRadius: BorderRadius.circular(20)
            ),

            child: Column
            (
              children: 
              [
                SizedBox(
                  height: 75,
                  width: 300,
                  child: TextButton
                  (
                    onPressed: editar,
                    child: Row
                    (
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: 
                      // ignore: prefer_const_literals_to_create_immutables
                      [
                        Text
                        (
                          'Editar',
                          style: TextStyle
                          (
                            color: Color(0xff666666),
                            fontSize: 20,
                            fontWeight: FontWeight.w400
                          ),
                        ),

                      ],
                    )
                  ),
                ),

                Divider(thickness: 1,),

                SizedBox(
                  height: 75,
                  width: 300,
                  child: TextButton
                  (
                    onPressed: excluir,
                    child: Text
                    (
                      'Excluir',
                      style: TextStyle
                      (
                        color: Color(0xff666666),
                        fontSize: 20,
                        fontWeight: FontWeight.w400
                      ),
                    )
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }
}