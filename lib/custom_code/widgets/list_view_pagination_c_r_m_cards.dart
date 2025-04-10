// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/components/search_card/search_card_widget.dart'; // Importe o componente SearchCardWidget

class ListViewPaginationCRMCards extends StatefulWidget {
  const ListViewPaginationCRMCards(
      {super.key,
      this.width,
      this.height,
      required this.list,
      this.callbackApi,
      this.itemCallback, // Novo callback adicionado
      this.selectedItem});

  final double? width;
  final double? height;
  final List<SearchsCardsStruct>? list;
  final Future Function()? callbackApi;
  final Future Function(int selected)?
      itemCallback; // Callback para acessar o callback do SearchCardWidget
  final int? selectedItem;

  @override
  State<ListViewPaginationCRMCards> createState() =>
      _ListViewPaginationCRMCardsState();
}

class _ListViewPaginationCRMCardsState
    extends State<ListViewPaginationCRMCards> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;
  List<SearchsCardsStruct> _items = [];

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_onScroll);

    // Carrega os dados iniciais
    if (widget.list == null || widget.list!.isEmpty) {
      _fetchInitialData();
    } else {
      _items = widget.list!;
    }
  }

  Future<void> _fetchInitialData() async {
    if (widget.callbackApi != null) {
      setState(() => _isLoadingMore = true);
      await widget.callbackApi!();
      setState(() {
        _items = widget.list ?? [];
        _isLoadingMore = false;
      });
    }
  }

  void _onScroll() async {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent &&
        !_isLoadingMore) {
      setState(() => _isLoadingMore = true);
      if (widget.callbackApi != null) {
        await widget.callbackApi!();
        setState(() {
          _items = widget.list ?? _items;
          _isLoadingMore = false;
        });
      }
    }
  }

  @override
  void didUpdateWidget(covariant ListViewPaginationCRMCards oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.list != oldWidget.list) {
      setState(() {
        _items = widget.list ?? [];
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _items.length + (_isLoadingMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == _items.length) {
            // Exibe o indicador de carregamento no final da lista
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xFF492065), // Cor do loading ajustada
                  ),
                ),
              ),
            );
          }

          final item = _items[index];

          return SearchCardWidget(
            nome: item.nome,
            cpf: item.cpf,
            etapa: item.etapa,
            updatedAt: item.updatedAt,
            id: item.id,
            selectedItem: widget.selectedItem,
            callback: (int selected) async {
              // Chama o callback adicional passado para o ListViewPaginationCRMCards
              if (widget.itemCallback != null) {
                await widget.itemCallback!(selected);
              }
            },
          );
        },
      ),
    );
  }
}
