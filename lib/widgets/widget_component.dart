import 'package:flutter/material.dart';
import 'package:jetpack/data/components.dart';
import 'package:url_launcher/url_launcher.dart';

class WidgetComponents extends StatefulWidget {
  final Components components;

  const WidgetComponents({Key key, @required this.components})
      : super(key: key);

  @override
  _WidgetComponentState createState() => _WidgetComponentState();
}

class _WidgetComponentState extends State<WidgetComponents> {
  @override
  Widget build(BuildContext context) {
    return _buildCard(widget.components);
  }

  _buildCard(Components components) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              components.title,
              maxLines: 2,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              components.subTitle,
              maxLines: 5,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  InkWell(
                    onTap: () {
//                        _launchURL(components.url);
                    },
                    child: Text(
                      "示例",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  Text('，'),
                  InkWell(
                    onTap: () {
                      _launchURL(components.url);
                    },
                    child: Text(
                      "源码",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  Text('，'),
                  InkWell(
                    onTap: () {
//                        _launchURL(components.url);
                    },
                    child: Text(
                      "博客",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
