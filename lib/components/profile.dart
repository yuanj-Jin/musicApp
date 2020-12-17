import 'package:flutter/material.dart';

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
          _buildTitle("Skills"),
          SizedBox(height: 10.0,),
          _buildSkillRow("Java",0.8),
          _buildSkillRow("Vue",0.5),
          _buildSkillRow("Flutter",0.6),
          SizedBox(height: 10.0,),
          _buildTitle("Experience"),
          _buildTitle("Education"),
          _buildTitle("Socials")
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
          child: Text(title.toUpperCase()),),
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
          child: Image.asset("assets/images/4.jpg"),
        ),
        Column(
          children: <Widget>[
              Text("YUAN JING",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
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

