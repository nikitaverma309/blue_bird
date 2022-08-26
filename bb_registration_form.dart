import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../utils/bb_constants.dart';
import '../../utils/bb_custom_colors.dart';
import '../../utils/bb_custom_string.dart';
import '../../utils/bb_custom_widgets.dart';

class Registration extends StatefulWidget {
  final String? from;

  const Registration({
    Key? key,
    this.from,
  }) : super(key: key);
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController edtname = TextEditingController();
  TextEditingController enquiryDate = TextEditingController();
  TextEditingController enrollmentNo = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController secondName = TextEditingController();
  TextEditingController thirdName = TextEditingController();
  TextEditingController ageOfChild = TextEditingController();
  TextEditingController FatherFirst = TextEditingController();
  TextEditingController FatherSecond = TextEditingController();
  TextEditingController FatherThird = TextEditingController();
  TextEditingController MotherThird = TextEditingController();
  TextEditingController MotherSecond = TextEditingController();
  TextEditingController MotherFirst = TextEditingController();
  TextEditingController MotherOccupation = TextEditingController();
  TextEditingController previousSchool = TextEditingController();
  TextEditingController Address = TextEditingController();
  TextEditingController Toys = TextEditingController();
  TextEditingController FavoriteColors = TextEditingController();
  TextEditingController FavoriteFoods = TextEditingController();
  TextEditingController FatherOccupation = TextEditingController();
  TextEditingController forgotedtemail = TextEditingController();
  GlobalKey<ScaffoldState>? scaffoldKey;
  bool _obscureText = true, _conobscureText = true;
  bool acceptterms = false;
  String dropdownvalue = 'General';
  String dropdownvalue1 = 'Male';
  String dropdownvalue2 = 'A+';

  bool Drawing = false;
  bool Coloring = false;
  bool Scribbling = false;
  bool HearStories = false;
  bool IndoorGames = false;
  bool OutdoorGames = false;
  bool WatchingTV = false;
  bool Others = false;
  bool createValue = false;
  DateTime selectedDate = DateTime.now();
  String mSelectedDate = 'selectDate';

  // List of items in our dropdown menu
  var items = [
    'General',
    'OBC',
    'SC',
    'HT',
  ];
  var items1 = [
    'Male',
    'Female',
    'Others',
  ];
  var items2 = [
    'A+',
    'A',
    'B',
    'c',
  ];

  @override
  void initState() {
    super.initState();
    scaffoldKey = GlobalKey<ScaffoldState>();
  }

  Future<bool> _backPress() {
    return new Future.value(true);
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1947),
      lastDate: DateTime(2501),
    );
    setState(() {
      if (picked != null && picked != selectedDate) selectedDate = picked;
      // if(GlobalFunction().isAdult(DateFormat('dd-MM-yyyy').format(selectedDate).toString())) {
      mSelectedDate = DateFormat('dd-MM-yyyy').format(selectedDate).toString();
      // }else{
      //   mSelectedDate = null;
      //   toast('Sorry you are not adult!\nPlease enter correct Date of Birth');
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return WillPopScope(
        onWillPop: _backPress,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: ColorsRes.bgcolor,
          body: Stack(
            children: [
              CachedNetworkImage(
                imageUrl:
                'https://smartkit.wrteam.in/smartkit/foodmaster/login_bg.png',
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top + 15,
                        left: 15,
                        right: 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Card(
                          shape: DesignConfig.setRoundedBorder(
                              ColorsRes.white, 8, false),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Icon(
                              Icons.keyboard_arrow_left,
                              color: ColorsRes.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Enquiry Label
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        //top: kToolbarHeight,
                        bottom: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        StringsRes.lblRegister,
                        style: Theme.of(context).textTheme.headline4!.merge(
                            TextStyle(
                                color: ColorsRes.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            //top: kToolbarHeight,
                            bottom: 10),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  StringsRes.lblname,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .merge(TextStyle(
                                      color: ColorsRes.black54,
                                      fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: width * 0.27,
                                    decoration:
                                    DesignConfig.boxDecorationContainer(
                                        ColorsRes.white, 10),
                                    margin: EdgeInsets.only(top: 2),
                                    padding: EdgeInsets.only(left: 10),
                                    child: TextFormField(
                                      style: TextStyle(color: ColorsRes.black),
                                      cursorColor: ColorsRes.black,
                                      decoration: InputDecoration(
                                        hintText: StringsRes.lblfirst,
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .merge(TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: ColorsRes.grey
                                                .withOpacity(0.5))),
                                        border: InputBorder.none,
                                      ),
                                      keyboardType: TextInputType.text,
                                      controller: firstname,
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.27,
                                    decoration:
                                    DesignConfig.boxDecorationContainer(
                                        ColorsRes.white, 10),
                                    margin: EdgeInsets.only(top: 2),
                                    padding: EdgeInsets.only(left: 10),
                                    child: TextFormField(
                                      style: TextStyle(color: ColorsRes.black),
                                      cursorColor: ColorsRes.black,
                                      decoration: InputDecoration(
                                        hintText: StringsRes.lblsecond,
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .merge(TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: ColorsRes.grey
                                                .withOpacity(0.5))),
                                        border: InputBorder.none,
                                      ),
                                      keyboardType: TextInputType.text,
                                      controller: secondName,
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.27,
                                    decoration:
                                    DesignConfig.boxDecorationContainer(
                                        ColorsRes.white, 10),
                                    margin: EdgeInsets.only(top: 2),
                                    padding: EdgeInsets.only(left: 10),
                                    child: TextFormField(
                                      style: TextStyle(color: ColorsRes.black),
                                      cursorColor: ColorsRes.black,
                                      decoration: InputDecoration(
                                        hintText: StringsRes.lbllast,
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .merge(TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: ColorsRes.grey
                                                .withOpacity(0.5))),
                                        border: InputBorder.none,
                                      ),
                                      keyboardType: TextInputType.text,
                                      controller: thirdName,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),

                              //Date Of birth
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  StringsRes.dob,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .merge(TextStyle(
                                      color: ColorsRes.black54,
                                      fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Container(
                                decoration: DesignConfig.boxDecorationContainer(
                                    ColorsRes.white, 10),
                                margin: EdgeInsets.only(top: 2),
                                padding: EdgeInsets.only(left: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    selectDate(context);
                                    print('Ho rha h');
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 16, 16, 16),
                                          child: Text(
                                            mSelectedDate,
                                            textAlign: TextAlign.start,
                                            maxLines: 1,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: ColorsRes.grey
                                                  .withOpacity(0.5),
                                            ),
                                          )),
                                      Container(
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                              color: ColorsRes.appcolor,
                                              borderRadius:
                                              const BorderRadius.only(
                                                  topRight:
                                                  Radius.circular(5),
                                                  bottomRight:
                                                  Radius.circular(5))),
                                          child: const Text(
                                            'Pick Date',
                                            style:
                                            TextStyle(color: Colors.white),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),

                              //Age of child
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  StringsRes.age,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .merge(TextStyle(
                                      color: ColorsRes.black54,
                                      fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Container(
                                decoration: DesignConfig.boxDecorationContainer(
                                    ColorsRes.white, 10),
                                margin: EdgeInsets.only(top: 2),
                                padding: EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  style: TextStyle(color: ColorsRes.black),
                                  cursorColor: ColorsRes.black,
                                  decoration: InputDecoration(
                                    hintText: StringsRes.yourage,
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .merge(TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: ColorsRes.grey
                                            .withOpacity(0.5))),
                                    border: InputBorder.none,
                                  ),
                                  keyboardType: TextInputType.phone,
                                  controller: ageOfChild,
                                ),
                              ),
                              SizedBox(height: 10),

                              //Gender
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  StringsRes.gender,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .merge(TextStyle(
                                      color: ColorsRes.black54,
                                      fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                decoration: DesignConfig.boxDecorationContainer(
                                    ColorsRes.white, 10),
                                margin: EdgeInsets.only(top: 2),
                                padding: EdgeInsets.only(left: 10),
                                child: DropdownButton(
                                  dropdownColor: Colors.white,
                                  isExpanded: true,
                                  underline: SizedBox(),
                                  // Initial Value
                                  value: dropdownvalue1,

                                  // Down Arrow Icon
                                  icon: Icon(Icons.keyboard_arrow_down),

                                  // Array list of items
                                  items: items1.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  // After selecting the desired option,it will
                                  // change button value to selected value
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownvalue1 = newValue!;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(height: 10),

                              //Grade
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  StringsRes.grade,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .merge(TextStyle(
                                      color: ColorsRes.black54,
                                      fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                decoration: DesignConfig.boxDecorationContainer(
                                    ColorsRes.white, 10),
                                margin: EdgeInsets.only(top: 2),
                                padding: EdgeInsets.only(left: 10),
                                child: DropdownButton(
                                  dropdownColor: Colors.white,
                                  isExpanded: true,

                                  underline: SizedBox(),
                                  // Initial Value
                                  value: dropdownvalue2,

                                  // Down Arrow Icon
                                  icon: Icon(Icons.keyboard_arrow_down),

                                  // Array list of items
                                  items: items2.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  // After selecting the desired option,it will
                                  // change button value to selected value
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownvalue2 = newValue!;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(height: 10),
                              //Caste
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  StringsRes.caste,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .merge(TextStyle(
                                      color: ColorsRes.black54,
                                      fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                decoration: DesignConfig.boxDecorationContainer(
                                    ColorsRes.white, 10),
                                margin: EdgeInsets.only(top: 2),
                                padding: EdgeInsets.only(left: 10),
                                child: DropdownButton(
                                  dropdownColor: Colors.white,
                                  isExpanded: true,
                                  underline: SizedBox(),
                                  // Initial Value
                                  value: dropdownvalue,
                                  // Down Arrow Icon
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  // Array list of items
                                  items: items.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  // After selecting the desired option,it will
                                  // change button value to selected value
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownvalue = newValue!;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(height: 10),
                              //siblingAttend
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  StringsRes.siblingAttend,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .merge(TextStyle(
                                      color: ColorsRes.black54,
                                      fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Container(
                                decoration: DesignConfig.boxDecorationContainer(
                                    ColorsRes.white, 10),
                                margin: EdgeInsets.only(top: 2),
                                padding: EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  keyboardType: TextInputType.multiline,
                                  minLines:
                                  1, //Normal textInputField will be displayed
                                  maxLines:
                                  10, // when user presses enter it will adapt to it
                                  style: TextStyle(color: ColorsRes.black),
                                  cursorColor: ColorsRes.black,
                                  decoration: InputDecoration(
                                    hintText: StringsRes.desc,
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .merge(TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: ColorsRes.grey
                                            .withOpacity(0.5))),
                                  ),
                                  // keyboardType: TextInputType.text,
                                ),
                              ),
                              SizedBox(height: 10),
                              //Fathers Name
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  StringsRes.parentN,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .merge(TextStyle(
                                      color: ColorsRes.black54,
                                      fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: width * 0.27,
                                    decoration:
                                    DesignConfig.boxDecorationContainer(
                                        ColorsRes.white, 10),
                                    margin: EdgeInsets.only(top: 2),
                                    padding: EdgeInsets.only(left: 10),
                                    child: TextFormField(
                                      style: TextStyle(color: ColorsRes.black),
                                      cursorColor: ColorsRes.black,
                                      decoration: InputDecoration(
                                        hintText: StringsRes.lblfirst,
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .merge(TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: ColorsRes.grey
                                                .withOpacity(0.5))),
                                        border: InputBorder.none,
                                      ),
                                      keyboardType: TextInputType.text,
                                      controller: FatherFirst,
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.27,
                                    decoration:
                                    DesignConfig.boxDecorationContainer(
                                        ColorsRes.white, 10),
                                    margin: EdgeInsets.only(top: 2),
                                    padding: EdgeInsets.only(left: 10),
                                    child: TextFormField(
                                      style: TextStyle(color: ColorsRes.black),
                                      cursorColor: ColorsRes.black,
                                      decoration: InputDecoration(
                                        hintText: StringsRes.lblsecond,
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .merge(TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: ColorsRes.grey
                                                .withOpacity(0.5))),
                                        border: InputBorder.none,
                                      ),
                                      keyboardType: TextInputType.text,
                                      controller: FatherSecond,
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.27,
                                    decoration:
                                    DesignConfig.boxDecorationContainer(
                                        ColorsRes.white, 10),
                                    margin: EdgeInsets.only(top: 2),
                                    padding: EdgeInsets.only(left: 10),
                                    child: TextFormField(
                                      style: TextStyle(color: ColorsRes.black),
                                      cursorColor: ColorsRes.black,
                                      decoration: InputDecoration(
                                        hintText: StringsRes.lbllast,
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .merge(TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: ColorsRes.grey
                                                .withOpacity(0.5))),
                                        border: InputBorder.none,
                                      ),
                                      keyboardType: TextInputType.text,
                                      controller: FatherThird,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              //Fathers Occupation
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  StringsRes.Occupation,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .merge(TextStyle(
                                      color: ColorsRes.black54,
                                      fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Container(
                                decoration: DesignConfig.boxDecorationContainer(
                                    ColorsRes.white, 10),
                                margin: EdgeInsets.only(top: 2),
                                padding: EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  style: TextStyle(color: ColorsRes.black),
                                  cursorColor: ColorsRes.black,
                                  decoration: InputDecoration(
                                    hintText: StringsRes.Occupation,
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .merge(TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: ColorsRes.grey
                                            .withOpacity(0.5))),
                                    border: InputBorder.none,
                                  ),
                                  keyboardType: TextInputType.text,
                                  controller: FatherOccupation,
                                ),
                              ),
                              //adress
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  StringsRes.address,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .merge(TextStyle(
                                      color: ColorsRes.black54,
                                      fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Container(
                                decoration: DesignConfig.boxDecorationContainer(
                                    ColorsRes.white, 10),
                                margin: EdgeInsets.only(top: 2),
                                padding: EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  style: TextStyle(color: ColorsRes.black),
                                  cursorColor: ColorsRes.black,
                                  decoration: InputDecoration(
                                    hintText: StringsRes.ContAddress,
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .merge(TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: ColorsRes.grey
                                            .withOpacity(0.5))),
                                    border: InputBorder.none,
                                  ),
                                  controller: Address,
                                  maxLines: 4,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                decoration: DesignConfig.boxDecorationContainer(
                                    ColorsRes.white, 10),
                                margin: EdgeInsets.only(top: 2),
                                padding: EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  style: TextStyle(color: ColorsRes.black),
                                  cursorColor: ColorsRes.black,
                                  decoration: InputDecoration(
                                    hintText: StringsRes.streetAd,
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .merge(TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: ColorsRes.grey
                                            .withOpacity(0.5))),
                                    border: InputBorder.none,
                                  ),
                                  keyboardType: TextInputType.text,
                                  controller: FatherOccupation,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                decoration: DesignConfig.boxDecorationContainer(
                                    ColorsRes.white, 10),
                                margin: EdgeInsets.only(top: 2),
                                padding: EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  style: TextStyle(color: ColorsRes.black),
                                  cursorColor: ColorsRes.black,
                                  decoration: InputDecoration(
                                    hintText: StringsRes.streetAdd,
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .merge(TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: ColorsRes.grey
                                            .withOpacity(0.5))),
                                    border: InputBorder.none,
                                  ),
                                  keyboardType: TextInputType.text,
                                  controller: FatherOccupation,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                  height: 50,
                                  decoration:
                                  DesignConfig.boxDecorationContainer(
                                      ColorsRes.white, 10),
                                  margin: EdgeInsets.only(top: 2),
                                  padding: EdgeInsets.all(8),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.4,
                                              child: Text(
                                                StringsRes.email,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle2!
                                                    .merge(TextStyle(
                                                    color:
                                                    ColorsRes.black54,
                                                    fontWeight:
                                                    FontWeight.bold)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.4,
                                              child: Text(
                                                StringsRes.phone,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle2!
                                                    .merge(TextStyle(
                                                    color:
                                                    ColorsRes.black54,
                                                    fontWeight:
                                                    FontWeight.bold)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                              Container(
                                  height: 50,
                                  decoration:
                                  DesignConfig.boxDecorationContainer(
                                      ColorsRes.white, 10),
                                  margin: EdgeInsets.only(top: 2),
                                  padding: EdgeInsets.all(8),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.4,
                                              child: TextFormField(
                                                style: TextStyle(
                                                    color: ColorsRes.black),
                                                cursorColor: ColorsRes.black,
                                                decoration: InputDecoration(
                                                  hintText: StringsRes.desc,
                                                  hintStyle: Theme.of(context)
                                                      .textTheme
                                                      .subtitle2!
                                                      .merge(TextStyle(
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      color: ColorsRes.grey
                                                          .withOpacity(
                                                          0.5))),
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      width: 1,
                                                    ),
                                                  ),
                                                ),
                                                keyboardType:
                                                TextInputType.text,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.4,
                                              child: TextFormField(
                                                style: TextStyle(
                                                    color: ColorsRes.black),
                                                cursorColor: ColorsRes.black,
                                                decoration: InputDecoration(
                                                  hintText: StringsRes.desc,
                                                  hintStyle: Theme.of(context)
                                                      .textTheme
                                                      .subtitle2!
                                                      .merge(TextStyle(
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      color: ColorsRes.grey
                                                          .withOpacity(
                                                          0.5))),
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      width: 1,
                                                    ),
                                                  ),
                                                ),
                                                keyboardType:
                                                TextInputType.text,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, bottom: 10, top: 20),
                                child: GestureDetector(
                                    onTap: () async {
                                      Constant.goToMainPage("login", context);
                                    },
                                    child: DesignConfig.shadowButtonFullwidgth(
                                        ColorsRes.appcolor,
                                        StringsRes.lblButton.toUpperCase(),
                                        ColorsRes.white,
                                        25,
                                        ColorsRes.appcolor,
                                        context)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
