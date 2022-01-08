import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/shared/components/text_field_widget.dart';

import 'components/item_info_widget.dart';
import 'components/item_part_widget.dart';

class PartsPage extends StatefulWidget {
  const PartsPage({Key? key}) : super(key: key);

  @override
  _PartsPageState createState() => _PartsPageState();
}

class _PartsPageState extends State<PartsPage> {
  final partsScroll = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 48.0),
          child: SizedBox(
            height: 32,
            child: TextFieldWidget(
              textColor: Color(0xFF666666),
              suffixIcon: Icon(
                Icons.edit,
                size: 20.0,
                color: Color(0xFF666666),
              ),
            ),
          ),
          // TODO: Text Field Controller
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle),
            iconSize: 32,
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              // TODO: Add Part
            },
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            height: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 18.0),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Projeto',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                const SizedBox(height: 8.0),
                Expanded(
                  child: Row(
                    children: [
                      const Flexible(
                        child: ItemInfoWidget(
                          title: 'Trechos',
                        ),
                      ),
                      const Expanded(
                        child: ItemInfoWidget(
                          title: 'Bolsões',
                        ),
                      ),
                      Expanded(
                        child: ItemInfoWidget(
                          title: 'Volume de chuva',
                          onEdit: () {
                            // TODO: Edit Volume de Chuva
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8.0),
              ],
            ),
          ),
          const Divider(
            color: Color(0xFFC0C0C0),
            thickness: 2,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              controller: partsScroll,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Trechos',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    ListView.builder(
                      controller: partsScroll,
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (builder, i) {
                        return const ItemPartWidget();
                        // TODO: Edit Part
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
