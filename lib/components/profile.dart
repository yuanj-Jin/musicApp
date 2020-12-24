import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          AvatarWidget(),
          Divider(color: Colors.grey,),
          Container(
            margin: const EdgeInsets.all(16.0 ),
            padding: const EdgeInsets.all(16.0 ),
            decoration: BoxDecoration(
              color: Colors.grey.shade200
            ),
            child: Text("""To make [Text] react to touch events, wrap it in a [GestureDetector] widget
               with a [GestureDetector.onTap] handler.
               In a material design application, consider using a [FlatButton] instead, or
              if that isn't appropriate, at least using an [InkWell] instead of"""),
          ),
          Divider(color: Colors.grey,),
          _buildTitle("Skills"),
          SizedBox(height: 10.0,),
          _buildSkillRow("Java",0.8),
          _buildSkillRow("Vue",0.5),
          _buildSkillRow("Flutter",0.6),
          SizedBox(height: 10.0,),
          _buildTitle("Experience"),
          _buildExperienceRow("广州世纪龙信息网络有限责任公司","Wordpress Developer","2019-2020"),
          _buildExperienceRow("成都职工投资集团","java Developer","2020-2020"),
          _buildExperienceRow("成都油管家科技有限责任公司","java Developer","2020-2020"),
          _buildTitle("Education"),
          _buildExperienceRow("四川农业大学","计算机科学与技术","2015-2019"),
          _buildExperienceRow("仁寿职业教育中心","升学班","2013-2015"),
          _buildTitle("CONTACT"),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(top: 8.0,left: 20.0),
              child: Icon(Icons.email),
            ),
            title: Text("yuanjing.zlantan@gmail.com"),
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(top: 8.0,left: 20.0),
              child: Icon(Icons.phone),
            ),
            title: Text("18180102594"),
          ),

          Row(
            children: [
              IconButton(color: Colors.indigo,icon: Icon(FontAwesomeIcons.facebookF), onPressed: (){
                _launchURL("https://facebook.com/lohanidamodar");
              }),
              IconButton(color: Colors.indigo,icon: Icon(FontAwesomeIcons.tencentWeibo), onPressed: (){
                _launchURL("https://www.baidu.com");
              }),
              IconButton(color: Colors.indigo,icon: Icon(FontAwesomeIcons.youtube), onPressed: (){
                _launchURL("https://www.youtube.com/channel/UCuRY1zGy8t0uvtHciHZ7GSg");
              }),
              IconButton(color: Colors.indigo,icon: Icon(FontAwesomeIcons.github), onPressed: (){
                _launchURL("https://github.com/lohanidamodar");
              }),
            ],
          )
        ],
      ),
    );
  }


  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  ListTile _buildExperienceRow(String company,String position,String duration){
    return ListTile(
      leading: Icon(Icons.arrow_right),
      title: Text(company,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$position（$duration）"),
        ],
      ),
    );
  }

  Container _buildTitle(String title) {
    return Container(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(title.toUpperCase(),style: TextStyle(
              fontSize: 18.0,
            fontWeight: FontWeight.bold
          ),),
        );
  }
  Row _buildSkillRow(String title,double level) {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 2,
            child: Text(title.toUpperCase(),
                textAlign: TextAlign.right,
            )
        ),

        SizedBox(width: 10.0,),
        Expanded(
          flex: 5,
          child: LinearProgressIndicator(
            value: level,
          ),
        )
      ],
    );
  }

}



class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(width: 50.0,),
        Container(
          width: 80.0,
          height: 80.0,
          child: CircleAvatar(
            radius:  40,
              backgroundColor: Colors.purple,
              child: CircleAvatar(
                  radius: 35.0,
                  backgroundImage: AssetImage("assets/images/4.jpg")),
          )
        ),
        Column(
          children: <Widget>[
            Row(
              children: [
                Text("YUAN JING",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                IconButton(
                  icon: Icon(Icons.info),
                  onPressed: (){
                    Navigator.pushNamed(context, "other");
                  },
                )
              ],
            ),
              Text("Full Stack Developer"),
              Row(
                children: <Widget>[
                  SizedBox(width: 25.0,),
                  Icon(Icons.location_on,color: Colors.grey,),
                  Text("CHENGDU,SICHUAN,CHINA"),
                ],
              )
          ],
        )
      ],
    );
  }
}

