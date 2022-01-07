import 'package:flutter/material.dart';

import 'components/item_info_widget.dart';

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
          child: TextFieldWidget(),
          // TODO: Text Field Controller
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle),
            color: const Color(0xFF00695C),
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
            height: 160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8.0),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Projeto',
                    style: TextStyle(
                      color: Color(0xFF666666),
                      fontSize: 24.0,
                    ),
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
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Trechos',
                        style: TextStyle(
                          color: Color(0xFF666666),
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    ListView.builder(
                      controller: partsScroll,
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (builder, i) {
                        return const ItemPartWidget();
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

class ItemPartWidget extends StatelessWidget {
  const ItemPartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 8.0,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 16.0,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Trecho 1',
                        style: TextStyle(
                          color: Color(0xFF666666),
                          fontWeight: FontWeight.bold,
                          fontSize: 26.0,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.info),
                        iconSize: 32,
                        color: Color(0xFF666666),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Tamanho',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Color(0xFF666666),
                            ),
                          ),
                          Text(
                            'Raio: 2m',
                            style: TextStyle(
                              height: 1.5,
                              fontSize: 16.0,
                              color: Color(0xFFA8A8A8),
                            ),
                          ),
                          Text(
                            'Profundidade: 2m',
                            style: TextStyle(
                              height: 1.5,
                              fontSize: 16.0,
                              color: Color(0xFFA8A8A8),
                            ),
                          ),
                          Text(
                            'Volume: 20000L',
                            style: TextStyle(
                              height: 1.5,
                              fontSize: 16.0,
                              color: Color(0xFFA8A8A8),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            'Bolsões',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Color(0xFF666666),
                            ),
                          ),
                          Text(
                            '6',
                            style: TextStyle(
                              height: 1.5,
                              fontSize: 16.0,
                              color: Color(0xFFA8A8A8),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            'Distância',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Color(0xFF666666),
                            ),
                          ),
                          Text(
                            '200m',
                            style: TextStyle(
                              height: 1.5,
                              fontSize: 16.0,
                              color: Color(0xFFA8A8A8),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: Icon(Icons.arrow_forward),
                iconSize: 32,
                color: Color(0xFF00695C),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  final Function(String)? onChanged;
  const TextFieldWidget({
    Key? key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: TextField(
        cursorColor: const Color(0xFF666666),
        style: const TextStyle(color: Color(0xFF666666)),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 16.0),
          fillColor: const Color(0xFFF1F1F1),
          filled: true,
          suffixIcon: const Icon(
            Icons.edit,
            size: 20.0,
            color: Color(0xFF666666),
          ),
          border: _defaultBorder(),
          enabledBorder: _defaultBorder(),
          focusedBorder: _defaultBorder(),
        ),
        onChanged: onChanged,
      ),
    );
  }

  _defaultBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.transparent,
      ),
      borderRadius: BorderRadius.circular(24),
    );
  }
}
