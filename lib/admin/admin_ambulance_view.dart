import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/custom_colors.dart';

class AdminAmbulanceView extends StatefulWidget {
  const AdminAmbulanceView({super.key});

  @override
  State<AdminAmbulanceView> createState() => _AdminAmbulanceViewState();
}

class _AdminAmbulanceViewState extends State<AdminAmbulanceView> {
  int _rateValue = 5;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: CustomColors.primaryColor,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 350,
              child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: CustomColors.adminSecondary,
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black,
                                            blurRadius: 3.0,
                                          )
                                        ],
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'https://s3-alpha-sig.figma.com/img/3a2a/62e9/f52fa16373246f8a7f0500ddd7a5eab0?Expires=1714953600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=HsH1pDpI2bmrvOAX6nIVhKTO81IYiLeRN2OiDgLjATyB3EV9-rxAKsZZmHmxyWccAuw9PXPzv81HgRVYEYzEKgysO4FcEUG2uSH5QeNm8iFqadpxhvbJPvp5mZHadut4f0ZzlK9u39jXaXbhTFlZnvNpllVVTH-wEFcBrL4-0aBJ3WAaNzMwrx4aSKsehG4pJsNQwsSZPy~lWWQI01284S8ihBpsBgLINli0cZ37stHl5~yRDnV9EfxfgoLoMwj7xfMaNhnnTV-WWc7HddiC65NQulBR~vhCvLzIbqvV09~vlVjtCmk6afow2FIVbeUFSciDbEsH1WHrgD~XRJH~LQ__'))),
                                    width: 90,
                                    height: 60,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "$_rateValue",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("KL 53 H 4564",
                                      style: TextStyle(
                                          color: Colors.white,
                                          decoration: TextDecoration.none,
                                          fontSize: 15)),
                                  const Text("Angadippuram PHC",
                                      style: TextStyle(
                                          color: Colors.black,
                                          decoration: TextDecoration.none,
                                          fontSize: 15)),
                                  TextButton(
                                      style: TextButton.styleFrom(
                                          backgroundColor: Colors.black,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      onPressed: () {},
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: const Text(
                                          "Remove",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width / 2,
            child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://s3-alpha-sig.figma.com/img/c963/5a6e/d38dcdb7632763a7f780d48f0bcc7519?Expires=1714953600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=jOW~sYxtrt9WtYQWhcCeg~U1-a~qRqgatVCzRoit2Z~lET~WQA~UBcFOYpylfgcl4OFFBPTwAIGnQqAMUG9-dsRjaUulvpBAGGf5uBKRSSBAkTefFdwYV7gLqtG4qiYFBFINTFOPnwzlZXArGN8cTpUUDDLsxtVEhFL7jDPCSnHBygF1hz5vs08oxQP51SDIuOP6ItUjcHnK3k4vL~a2nn47-w7d0VwJcHjlLenV7UZrGx0m3E9ccwi7JPfOzkW61t1c0dcXU80Hc3ZQKt9NgSDmMYBpbhfR-0zvkgwV5PErzeSTUPLVpn9G8m9u7muS6ddgttMF5HJfn5I59tT~ig__')),
          )
        ],
      ),
    );
  }
}
