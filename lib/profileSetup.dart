import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:relationship_ai/Theme/ColorsConstant.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  TextEditingController fname;
  TextEditingController lname;

  bool validate_fname = false;
  bool validate_lname = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fname = new TextEditingController();
    lname = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
    child: SafeArea(child: Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset("assets/full-heading.png",alignment: Alignment.bottomCenter,)
              ),
          Flexible(

              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset("assets/couple_1.png",alignment: Alignment.bottomCenter,),
                  Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 16)),
                      Container(
                        margin: EdgeInsets.all(16),
                        height: 20,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: [
                            Container(
                              color: lightPurple,

                            ),
                            Container(
                              color: backgroundColor,
                              width: MediaQuery.of(context).size.width*0.1,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: validate_fname?70:50,
                        padding: EdgeInsets.only(left: 16,right: 16),
                        child: new TextField(
                          controller: fname,
                          decoration: new InputDecoration(
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                              ),
                              filled: true,
                              hintStyle: new TextStyle(color: Colors.grey[800],fontSize: 16),
                              hintText: "First Name",
                              errorText: validate_fname?"Field cannot be empty":null,
                              fillColor: lightPurple),
                        )
                      ),
                      Container(
                          height: validate_lname?70:50,
                          margin: EdgeInsets.only(top: 16),
                          padding: EdgeInsets.only(left: 16,right: 16),
                          child: new TextField(
                            controller: lname,
                            decoration: new InputDecoration(
                                border: new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(10.0),
                                  ),
                                ),
                                filled: true,
                                hintStyle: new TextStyle(color: Colors.grey[800],fontSize: 16),
                                hintText: "Last Name",
                                errorText: validate_lname?"Field cannot be empty":null,
                                fillColor: lightPurple),
                          )
                      ),
                      Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(left: 16,right: 16,top: 16),
                          decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.all(const Radius.circular(10.0),)),
                          child: new FlatButton(
                            onPressed: (){
                              print("-----------");
                              print(fname.text);
                              print(lname);
                              if(fname.text==""){
                                setState(() {
                                  validate_fname=true;
                                });
                              }
                              if(lname.text=="") {
                                setState(() {
                                  validate_lname = true;
                                });
                              }else{
                                Navigator.pushReplacement(context, PageTransition(duration: Duration(milliseconds:200 ),type: PageTransitionType.rightToLeftWithFade, child: Profile_1()));
                              }

                            },
                            child: Text("Next",style: TextStyle(color: Colors.white,fontSize: 16),),
                          )
                      ),
                    ],
                  ),
                ],
              )),

        ],
      ),
    )));
  }
}

class Profile_1 extends StatefulWidget {
  @override
  _Profile_1State createState() => _Profile_1State();
}


class _Profile_1State extends State<Profile_1> {

  String dropDownValue;
  final _age = TextEditingController();
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset("assets/full-heading.png",alignment: Alignment.bottomCenter,)
              ),
              Flexible(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.asset("assets/couple_1.png",alignment: Alignment.bottomCenter,),
                      Column(
                        children: [
                          Padding(padding: EdgeInsets.only(top: 16)),
                          Container(
                            margin: EdgeInsets.all(16),
                            height: 20,
                            width: MediaQuery.of(context).size.width,
                            child: Stack(
                              children: [
                                Container(
                                  color: lightPurple,

                                ),
                                Container(
                                  color: backgroundColor,
                                  width: MediaQuery.of(context).size.width*0.3,
                                ),
                              ],
                            ),
                          ),
                          Container(
                              height: _validate?70:50,
                              padding: EdgeInsets.only(left: 16,right: 16),
                              child: new TextField(
                                controller: _age,
                                keyboardType: TextInputType.number,
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(10.0),
                                      ),
                                    ),
                                    filled: true,
                                    errorText: _validate ? 'Value Can\'t Be Empty' : null,
                                    hintStyle: new TextStyle(color: Colors.grey[800],fontSize: 16),
                                    hintText: "Age",
                                    fillColor: lightPurple),
                              )
                          ),
                          Container(
                              height: 50,
                              margin: EdgeInsets.only(top: 16,left: 16,right: 16),
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black45),
                                  color: lightPurple,
                                  borderRadius: BorderRadius.all(const Radius.circular(10.0),)),
                              child: DropdownButtonHideUnderline(child:
                              DropdownButton<String>(
                                isExpanded: true,
                                value: dropDownValue,
                                hint: Text("Select Gender"),
                                icon: Icon(Icons.keyboard_arrow_down),
                                iconSize: 24,
                                elevation: 16,
                                style: TextStyle(color:  Colors.grey[800],fontSize: 16),
                                onChanged: (String newValue) async{
                                  setState(() {
                                    dropDownValue = newValue;
                                  });
                                },
                                items: <String>['Male','Female',"Transgender"]
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              )
                          ),
                          Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(left: 16,right: 16,top: 16),
                              decoration: BoxDecoration(
                                  color: backgroundColor,
                                  borderRadius: BorderRadius.all(const Radius.circular(10.0),)),
                              child: new FlatButton(
                                onPressed: (){
                                  setState(() {
                                    if(int.parse(_age.text)<16 || _age.text==""){
                                      _validate=true;
                                    }else{

                                      Navigator.pushReplacement(context, PageTransition(duration: Duration(milliseconds:200 ),type: PageTransitionType.rightToLeftWithFade, child: Profile_2()));

                                    }
                                  });
                                },
                                child: Text("Next",style: TextStyle(color: Colors.white,fontSize: 16),),
                              )
                          )
                        ],
                      ),


                    ],
                  )),

            ],
          ),
        )));
  }
}


class Profile_2 extends StatefulWidget {
  @override
  _Profile_2State createState() => _Profile_2State();
}

class _Profile_2State extends State<Profile_2> {

  bool _validate=false;
  TextEditingController _exp;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _exp = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset("assets/full-heading.png",alignment: Alignment.bottomCenter,)
              ),
              Flexible(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.asset("assets/couple_1.png",alignment: Alignment.bottomCenter,),
                      Column(
                        children: [
                          Padding(padding: EdgeInsets.only(top: 16)),
                          Container(
                            margin: EdgeInsets.all(16),
                            height: 20,
                            width: MediaQuery.of(context).size.width,
                            child: Stack(
                              children: [
                                Container(
                                  color: lightPurple,

                                ),
                                Container(
                                  color: backgroundColor,
                                  width: MediaQuery.of(context).size.width*0.7,
                                ),
                              ],
                            ),
                          ),
                          Container(
                              height: _validate?70:50,
                              padding: EdgeInsets.only(left: 16,right: 16),
                              child: new TextField(
                                controller: _exp,
                                keyboardType: TextInputType.number,
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(10.0),
                                      ),
                                    ),
                                    filled: true,
                                    errorText: _validate ? 'Value Can\'t Be Empty' : null,
                                    hintStyle: new TextStyle(color: Colors.grey[800],fontSize: 16),
                                    hintText: "Experience",
                                    fillColor: lightPurple),
                              )
                          ),

                          Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(left: 16,right: 16,top: 16),
                              decoration: BoxDecoration(
                                  color: backgroundColor,
                                  borderRadius: BorderRadius.all(const Radius.circular(10.0),)),
                              child: new FlatButton(
                                onPressed: (){
                                  setState(() {
                                    if( _exp.text==""){
                                      _validate=true;
                                    }else{
                                      showDialog(
                                        barrierColor: lightPurple_1,
                                          barrierDismissible: false,
                                          builder: (BuildContext context) {

                                        return ProfileCompletion();}, context: context);
                                    }
                                  });
                                },
                                child: Text("Next",style: TextStyle(color: Colors.white,fontSize: 16),),
                              )
                          )
                        ],
                      ),


                    ],
                  )),

            ],
          ),
        )));
  }
}


class ProfileCompletion extends StatefulWidget {
  @override
  _ProfileCompletionState createState() => _ProfileCompletionState();
}

class _ProfileCompletionState extends State<ProfileCompletion> {
  @override
  Widget build(BuildContext context) {
    return Dialog2(
        backgroundColor: Colors.transparent,
        child:Container(
          decoration: BoxDecoration(
              color: Colors.white,
            borderRadius: BorderRadius.all(const Radius.circular(10.0),)
          ),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width*0.70,
          height: MediaQuery.of(context).size.height*0.40,

          child: Column(
            children: [
              Image.asset("assets/modal-heading-1.png"),
              Flexible(flex: 3,
              child: Container(),)
            ],
          ),
        )
    );
  }
}

class Dialog2 extends StatelessWidget {
  const Dialog2({
    Key key, this.backgroundColor, this.elevation,
    this.insetAnimationDuration = const Duration(milliseconds: 100),
    this.insetAnimationCurve = Curves.decelerate,
    this.shape, this.child,
  }) : super(key: key);

  final Color backgroundColor;final double elevation;
  final Duration insetAnimationDuration;
  final Curve insetAnimationCurve;final ShapeBorder shape;
  final Widget child;

  static const RoundedRectangleBorder _defaultDialogShape =
  RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2.0)));
  static const double _defaultElevation = 24.0;

  @override
  Widget build(BuildContext context) {
    final DialogTheme dialogTheme = DialogTheme.of(context);
    return  AnimatedPadding(
        padding: MediaQuery.of(context).viewInsets +  EdgeInsets.only(left:10,right: 10,top: 10,bottom: 20),
        duration: insetAnimationDuration, curve: insetAnimationCurve,
        child: MediaQuery.removeViewInsets(
            removeLeft: true, removeTop: true, removeRight: true,
            removeBottom: true, context: context,
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,child:Material(
              color: backgroundColor ?? dialogTheme.backgroundColor ?? Theme.of(context).dialogBackgroundColor,
              elevation: elevation ?? dialogTheme.elevation ?? _defaultElevation,
              shape: shape ?? dialogTheme.shape ?? _defaultDialogShape,
              type: MaterialType.card,
              child: child,
            ),
            ))

    );
  }
}