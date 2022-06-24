import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'urlinput_page.dart';

// ignore: camel_case_types
class oitwebpage extends StatefulWidget {
  const oitwebpage({Key? key}) : super(key: key);

  @override
  State<oitwebpage> createState() => _oitwebpagestate();
}

final _url = ['https://www.portal.oit.ac.jp/CAMJWEB/top.do', 
             'https://www.oit.ac.jp/', 
             'https://oit.c-learning.jp/s/index', 
             '', '', '', '', ''];
final _pagename = ['ポータルサイト', '大阪工業大学 ホームページ', 'c-larning', 
                  '', '', '', '', ''];
final _onoff = [true, true, true, false, false, false, false, false];
int j =3; 
// ignore: non_constant_identifier_names
final _PopupValue = ['', '', '', '', '', '', '', ''];
// ignore: non_constant_identifier_names
final _PopupMenuValue = [['再登録', 'delete'], ['再登録', 'delete'], 
                        ['再登録', 'delete'], ['再登録', 'delete'], 
                        ['再登録', 'delete'], ['再登録', 'delete'], 
                        ['再登録', 'delete'], ['再登録', 'delete']];

// ignore: camel_case_types
class _oitwebpagestate extends State<oitwebpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          pageselect(
            url: _url[0],
            pagename: _pagename[0],
            onoff: _onoff[0],
            i: 0
          ),
          pageselect(
            url: _url[1],
            pagename: _pagename[1],
            onoff: _onoff[1],
            i: 1
          ),
          pageselect(
            url: _url[2],
            pagename: _pagename[2],
            onoff: _onoff[2],
            i: 2
          ),
          pageselect(
            url: _url[3],
            pagename: _pagename[3],
            onoff: _onoff[3],
            i: 3
          ),
          pageselect(
            url: _url[4],
            pagename: _pagename[4],
            onoff: _onoff[4],
            i: 4
          ),
          pageselect(
            url: _url[5],
            pagename: _pagename[5],
            onoff: _onoff[5],
            i: 5
          ),
          pageselect(
            url: _url[6],
            pagename: _pagename[6],
            onoff: _onoff[6],
            i: 6
          ),
          pageselect(
            url: _url[7],
            pagename: _pagename[7],
            onoff: _onoff[7],
            i: 7
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: FloatingActionButton.extended(
            tooltip: '登録する',
            icon: const Icon(Icons.add),
            label: const Text('add'),
            onPressed: () async {
              if (j >= 8) {
                showDialog(
                  context: context, 
                  builder: (_) {
                    return const AlertDialog(
                      title: Text('Sorry'),
                      content: Text('NO more can be added'),
                    );
                  },
                );
              } else {
                var result = await Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => urlinput(_pagename[j], _url[j])),
                );
                var strAry = result.split('##');
                if (strAry[0] != '' && strAry[1] != '') {
                  setState(() {
                    _pagename[j] = strAry[0];
                    _url[j] = strAry[1];
                    _onoff[j] = true;
                    j++;
                  });
                  pageadd(url: _url[j-1], pagename: _pagename[j-1]);
                }
              }
            }
          ),
        ),
    );
  }

  Widget pageselect({String url = '', String pagename = '', bool onoff = false, int i = 0}) {
    if(onoff == true) {
      return pageadd(url: url, pagename: pagename, i: i);
    } else if(onoff == false) {
      return pagedelete(url: url, pagename: pagename, i: i);
    } else {
      throw Error;
    }
  }

  Widget pageadd({String url = '', String pagename = '', int i = 0}) {
      return Container(
        height: MediaQuery.of(context).size.height * (7 / 100),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 146, 220, 255),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.lightBlue[50],
            onTap: () async {
              // ignore: deprecated_member_use
              if (await canLaunch(url)) {
                // ignore: deprecated_member_use
                await launch(url, forceSafariVC: true, forceWebView: true);
              } else {
                showDialog(
                  context: context, 
                  builder: (_) {
                    return const AlertDialog(
                      title: Text('Error!'),
                      content: Text('このURLは開くことができません'),
                    );
                  },
                );        
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(' '),
                Text(
                  pagename,
                  style: const TextStyle(
                    fontSize: 22,
                  ), 
                ),
                PopupMenuButton<String>(
                  initialValue: _PopupValue[i],
                  itemBuilder: (BuildContext context) {
                    return _PopupMenuValue[i].map((String s) {
                      return PopupMenuItem(
                        value: s,
                        child: Text(s),
                      );
                    }).toList();
                  },
                  onSelected: (String s) async {
                    setState(() {
                      _PopupValue[i] = s;
                    });
                    if(_PopupValue[i] == '再登録') {
                      var result = await Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => urlinput(_pagename[i], _url[i])),
                      );
                      var strAry = result.split('##');
                      if (strAry[0] != '' && strAry[1] != '') {
                        setState(() {
                          _pagename[i] = strAry[0];
                          _url[i] = strAry[1];
                          _onoff[i] = true;
                        });
                        pageadd(url: _url[i], pagename: _pagename[i]);
                      }
                    } else if(_PopupValue[i] == 'delete') {
                      _url.removeAt(i);
                      _url.add('');
                      _pagename.removeAt(i);
                      _pagename.add('');
                      _onoff.removeAt(i);
                      _onoff.add(false);
                      j--;
                    } else {
                      throw Error;
                    }
                  },
                )
              ],
            ),
          ),
        ),
      );
    } 

  Widget pagedelete({String url = '', String pagename = '', int i = 0}) {
    return Container(
        height: MediaQuery.of(context).size.height * (7 / 100),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: const Material(
          child: InkWell(
            onTap: null,
          ),
        ),
      );
  }
}