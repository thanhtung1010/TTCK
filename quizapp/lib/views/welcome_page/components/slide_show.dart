import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizapp/views/welcome_page/components/img_list.dart';

class SlideShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      child: CarouselSlider.builder(
        itemCount: imgLists.length,
        itemBuilder: (context, index, realIdx) {
          return Column(
            children: <Widget>[
              index == 0
                  ? SvgPicture.asset(
                      imgLists[index].imgURL,
                      height: size.height * 0.5,
                    )
                  : Image.asset(
                      imgLists[index].imgURL,
                      height: size.height * 0.5,
                    ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Text(
                imgLists[index].text,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          );
        },
        options: CarouselOptions(
          height: size.height * 0.65,
          viewportFraction: 1.0,
          enlargeCenterPage: false,
          enableInfiniteScroll: true,
          autoPlay: false,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 1500),
          autoPlayCurve: Curves.fastOutSlowIn,
          initialPage: 0,
        ),
      ),
    );
  }
}
