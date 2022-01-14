import 'package:flutter/material.dart';
import './border_styles.dart';

class BillCalculator extends StatefulWidget {
  const BillCalculator({Key? key}) : super(key: key);

  @override
  _BillCalculatorState createState() => _BillCalculatorState();
}

class _BillCalculatorState extends State<BillCalculator> {
  double billAmt = 0;
  String billAmtStr = "0";
  String unitsConsumedStr="0";
  TextEditingController InitialReadingController = TextEditingController();
  TextEditingController FinalReadingController = TextEditingController();
  void _calculateBill() {
    int unitsConsumed = int.parse(FinalReadingController.text) -
        int.parse(InitialReadingController.text);
//print();
    if ((unitsConsumed) <= 100) {

        billAmt = 0;
        billAmtStr="0";
        unitsConsumedStr = unitsConsumed.toString();

    } else if (unitsConsumed > 100 && unitsConsumed <= 200) {

        billAmt = ((unitsConsumed - 100) * 1.5) + 20;


    } else if(unitsConsumed >200 && unitsConsumed <=500){
      if(unitsConsumed<=200){
        billAmt = (((unitsConsumed-100)*2)+30);
      }
      else {
        billAmt=(230+((unitsConsumed-200)*3));
      }

    }
    else if(unitsConsumed>500){
      if(unitsConsumed<=200){
        billAmt = (((unitsConsumed-100)*3.5)+50);
    } else if(unitsConsumed>200 && unitsConsumed<=500){
        billAmt=(400+((unitsConsumed-200)*4.6));
      }
      else {
        billAmt=(1780+((unitsConsumed-500)*6.6));
      }
      }
setState(() {
  billAmtStr = billAmt.toString();
  unitsConsumedStr = unitsConsumed.toString();
});

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              reverse: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                      padding: EdgeInsets.all(20),
                      child: Center(
                        child: Text(
                          'Enter Readings',
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Bebas Neue',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 6.0),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      controller: InitialReadingController,
                      decoration: const InputDecoration(
                          labelText: "Initial Reading",
                          hintText: "eg: 1000",
                          suffixText: "kW"),
                      style: const TextStyle(
                          letterSpacing: 3.0, color: Colors.white),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Something!';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                      onFieldSubmitted: (value) {
                        //print('Pressed');
                        _calculateBill();
                      },
                      controller: FinalReadingController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: "Current Reading",
                          hintText: "eg: 1500",
                          suffixText: "kW"),
                      style: const TextStyle(
                          letterSpacing: 3.0, color: Colors.white),
                    ),
                  ),
                  Center(
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: IconButton(
                            icon: Image.asset('assets/buttons/button.gif'),
                            iconSize: 150,
                            onPressed: () {
                              //print('Pressed');
                              FocusManager.instance.primaryFocus?.unfocus();
                              _calculateBill();
                            },
                          ))),
                  Center(
                    child: Container(
                      child: RichText(textAlign: TextAlign.center,text: TextSpan(text: () {
                        if (billAmt == 0||billAmt<0) {
                          return '$unitsConsumedStr Units Consumed.\nThe Bill is ';
                        }
                        return '$unitsConsumedStr Units Consumed.\nThe Bill is ';
                      }(),style: const TextStyle(
                          color: Colors.white, fontFamily: 'Bebas Neue', fontSize: 30,letterSpacing: 3),children:[TextSpan(text: ' ₹ $billAmtStr', style: TextStyle(color: Colors.green))] ),),
                    ),
                  )
                ],
              ),
            ),
          )),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          inputDecorationTheme: GeneralStyles().theme()),
    );
  }
}
