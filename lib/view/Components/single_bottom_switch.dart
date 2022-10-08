import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class FixedBottomSwitch extends StatelessWidget {
  const FixedBottomSwitch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => print('enquiry now clicked'),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff00A6F6),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      topLeft: Radius.circular(50)),
                ),
                alignment: Alignment.center,
                height: 45,
                width: 150,
                child: Text(
                  'Enqury Now',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: 2,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xff00A6F6),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              alignment: Alignment.center,
              height: 45,
              width: 150,
              child: GestureDetector(
                onTap: (){
                  _callNumber();
                  
                },
                child: Text(
                  'Call Now',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  _callNumber() async{
  const number = '8590385573'; //set the number here
  bool? res = await FlutterPhoneDirectCaller.callNumber(number);
}
}
