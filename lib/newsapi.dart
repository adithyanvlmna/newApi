import 'package:flutter/material.dart';
import 'package:newapi/providers/news_provider.dart';
import 'package:provider/provider.dart';

class Newsapi extends StatefulWidget {
  const Newsapi({super.key});

  @override
  State<Newsapi> createState() => _NewsapiState();
}

class _NewsapiState extends State<Newsapi> {
  String dropdownvalue = "zero";
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final provider = Provider.of<Newsprovider>(context, listen: false);
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 188, 230, 190),
        appBar: AppBar(
          elevation: 25,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.black,
          shadowColor: Colors.black,
          title: const Text(
            "News",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.white,
                elevation: 25,
                child: DropdownButton(
                    value: dropdownvalue,
                    isExpanded: true,
                    icon: const Icon(Icons.arrow_downward),
                    items: const [
                      DropdownMenuItem(
                          value: "zero",
                          child: Text(
                            "Select",
                            style: TextStyle(color: Colors.black),
                          )),
                      DropdownMenuItem(
                          value: "in",
                          child: Text(
                            "India",
                            style: TextStyle(color: Colors.black),
                          )),
                      DropdownMenuItem(
                          value: "jp",
                          child: Text(
                            "Japan",
                            style: TextStyle(color: Colors.black),
                          )),
                    ],
                    onChanged: (value) {
                      setState(() {
                        dropdownvalue = value!;
                      });
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () {
                  String country = dropdownvalue;
                  provider.newss(country);
                },
                color: Colors.white,
                textColor: Colors.black,
                elevation: 25,
                highlightColor: Colors.black,
                splashColor: const Color.fromARGB(255, 201, 232, 202),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26)),
                minWidth: width * 0.002,
                child: const Text(
                  "Search",
                ),
              ),
            ),
            Consumer<Newsprovider>( 
              builder: (context,data,_) {
                return Expanded(
                    child: GridView.builder(
                      itemCount: data.newGetter.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount( 
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          childAspectRatio: 0.10,
                            crossAxisCount: 2),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(width: width*0.004,color: Colors.black)
                            ),
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(data.newGetter[index].title),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(data.newGetter[index].name),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(data.newGetter[index].id),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(data.newGetter[index].auther),
                                
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(data.newGetter[index].publishedAt),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(data.newGetter[index].url),
                              ),
                            ],),
                            
                          );
                        }));
              }
            )
          ],
        ));
  }
}

//  final data = userMap["des"] ?? "";
