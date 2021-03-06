import 'package:flutter/material.dart';
import 'package:jetpack/data/android_components.dart';
import 'package:jetpack/data/flutter_components.dart';
import 'package:jetpack/pages/jetpacks/jetpack.dart';

class WidgetMenuNewHome extends StatefulWidget {
  @override
  _WidgetMenuNewHomeState createState() => _WidgetMenuNewHomeState();
}

class _WidgetMenuNewHomeState extends State<WidgetMenuNewHome>
    with SingleTickerProviderStateMixin {
  List _tabs = [
    'Flutter',
    'Android',
  ];

  TabController _tabController;
  int _index = 0;

  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          _index = _tabController.index;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[_buildLargeTabBar(), _buildBody()],
      ),
    );
  }

  _buildLargeTabBar() {
    return Align(
      alignment: Alignment.centerLeft,
      child: TabBar(
        controller: _tabController,
        isScrollable: true,
        tabs: _tabs
            .map((e) => Tab(
                  child: Text(e),
                ))
            .toList(),
      ),
    );
  }

  _buildBody() {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: <Widget>[
          PageJetPack(
            headTitle: FlutterComponents.headTitle,
            headDesc: FlutterComponents.headDesc,
            componentsTitles: FlutterComponents.componentsTitles,
            selectComponentsDataForArc:
                FlutterComponents.selectComponentsDataForArc(),
            selectComponentsDataForBasic:
                FlutterComponents.selectComponentsDataForBasic(),
            selectComponentsDataForBehavior:
                FlutterComponents.selectComponentsDataForBehavior(),
            selectComponentsDataForUI:
                FlutterComponents.selectComponentsDataForUI(),
          ),
          PageJetPack(
            headTitle: AndroidComponents.headTitle,
            headDesc: AndroidComponents.headDesc,
            componentsTitles: AndroidComponents.componentsTitles,
            selectComponentsDataForArc:
                AndroidComponents.selectComponentsDataForArc(),
            selectComponentsDataForBasic:
                AndroidComponents.selectComponentsDataForBasic(),
            selectComponentsDataForBehavior:
                AndroidComponents.selectComponentsDataForBehavior(),
            selectComponentsDataForUI:
                AndroidComponents.selectComponentsDataForUI(),
          )
        ],
      ),
    );
  }

//  _buildContent(index) {
//    if (index == 0)
//      return PageJetPack(
//        headTitle: FlutterComponents.headTitle,
//        headDesc: FlutterComponents.headDesc,
//        componentsTitles: FlutterComponents.componentsTitles,
//        selectComponentsDataForArc:
//            FlutterComponents.selectComponentsDataForArc(),
//        selectComponentsDataForBasic:
//            FlutterComponents.selectComponentsDataForBasic(),
//        selectComponentsDataForBehavior:
//            FlutterComponents.selectComponentsDataForBehavior(),
//        selectComponentsDataForUI:
//            FlutterComponents.selectComponentsDataForUI(),
//      );
//    if (index == 1)
//      return PageJetPack(
//        headTitle: AndroidComponents.headTitle,
//        headDesc: AndroidComponents.headDesc,
//        componentsTitles: AndroidComponents.componentsTitles,
//        selectComponentsDataForArc:
//            AndroidComponents.selectComponentsDataForArc(),
//        selectComponentsDataForBasic:
//            AndroidComponents.selectComponentsDataForBasic(),
//        selectComponentsDataForBehavior:
//            AndroidComponents.selectComponentsDataForBehavior(),
//        selectComponentsDataForUI:
//            AndroidComponents.selectComponentsDataForUI(),
//      );
//    return Container();
//  }
}
