import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:networking_demo/services/webservice.dart';
import 'package:networking_demo/utils/constants.dart';
import 'package:incrementally_loading_listview/incrementally_loading_listview.dart';
class ImagesListState extends State<ImagesList> {
  List<dynamic> _imagesArticles = [];
  ScrollController controller;
  bool _loadingMore;
  bool _hasMoreItems;
  int _maxItems = Constants.page*Constants.per_page;
  int _numItemsPage = 10;
  Future _initialLoad;
  List<Item> items=[];

  @override
  void initState() {
    super.initState();
    _populateImagesArticles('preview');
   _initialitems();
    //controller = new ScrollController()..addListener(_scrollListener);
  }

  void _initialitems(){
    _initialLoad = Future.delayed(Duration(seconds: Constants.page), () {
      // List items = [];
      items = <Item>[];
      for (var i = 0; i < _numItemsPage; i++) {
        items.add(Item(_imagesArticles[i]));
      }
      _hasMoreItems = true;
    });
  }

  Future _loadMoreItems() async {
    final totalItems = items.length;
    await Future.delayed(Duration(seconds: Constants.page), () {
      for (var i = 0; i < _numItemsPage; i++) {
        items.add(Item(_imagesArticles[totalItems+i]));
      }
    });

    _hasMoreItems = items.length < _maxItems;
  }

  /*int length=7;
  void _scrollListener() {
    print(controller.position.extentAfter);
    if (controller.position.extentAfter < 7) {
      setState(() {
        _imagesArticles.addAll(_imagesArticles[length+1]);
      });
    }
  }*/
  Future<void> _populateImagesArticles(String val) async {
    /*List<String> id;
    id=await Webservice().load();
    setState(() {
      _imagesArticles=id;
    });*/
    Webservice().load(val).then((imagesArticles) async {
      setState(() {
        _imagesArticles = imagesArticles;
        print(imagesArticles);
      });
    });
  }

  ListTile _buildItemsForListView(BuildContext context, int index) {
    return ListTile(
      title: _imagesArticles[index] == null
          ? Image.asset(Constants.Images_PLACEHOLDER_IMAGE_ASSET_URL)
          : Image.network(_imagesArticles[index]),
      //title: Text(_imagesArticles[index], style: TextStyle(fontSize: 18)),
    );
  }

  void handleClick(String value) {
    setState(() {
      switch (value) {
        case 'preview':
          _populateImagesArticles('preview');
          break;
        case 'small_thumb':
          _populateImagesArticles('small_thumb');
          break;
        case 'large_thumb':
          _populateImagesArticles('large_thumb');
          break;
        case 'huge_thumb':
          _populateImagesArticles('huge_thumb');
          break;
        case 'preview_1000':
          _populateImagesArticles('preview_1000');
          break;
        case 'preview_1500':
          _populateImagesArticles('preview_1500');
          break;
      }
      _initialitems();
    });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Shutterstock Images"),
        actions: [PopupMenuButton<String>(
          onSelected: handleClick,
          itemBuilder: (BuildContext context) {
            return {'preview','small_thumb','large_thumb','huge_thumb','preview_1000','preview_1500'}.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        ),],
      ),
      body: FutureBuilder(
        future: _initialLoad,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              return IncrementallyLoadingListView(
                hasMore: () => _hasMoreItems,
                itemCount: () => items.length,
                loadMore: () async {
                  // can shorten to "loadMore: _loadMoreItems" but this syntax is used to demonstrate that
                  // functions with parameters can also be invoked if needed
                  await _loadMoreItems();
                },
                onLoadMore: () {
                  setState(() {
                    _loadingMore = true;
                  });
                },
                onLoadMoreFinished: () {
                  setState(() {
                    _loadingMore = false;
                  });
                },
                loadMoreOffsetFromBottom: 2,
                itemBuilder: (context, index) {
                  final item = items[index];
                  if ((_loadingMore ?? false) && index == items.length - 1) {
                    return Column(
                      children: <Widget>[
                        ItemCard(item: item),
                      ],
                    );
                  }
                  return ItemCard(item: item);
                },
              );
            default:
              return Text('Something went wrong');
          }
        },
      ),
    );
  }

  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Images'),
        ),
        body: ListView.builder(
          controller: controller,
          itemCount: _imagesArticles.length,
          itemBuilder: _buildItemsForListView,
        ));
  }*/
}

class ImagesList extends StatefulWidget {
  @override
  createState() => ImagesListState();
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key key,
    this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Image.network(item.avatarUrl),
            ],
          ),
        ),
      ),

    );
  }
}

class Item {
  final String avatarUrl;

  Item(this.avatarUrl);

}