import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/models/courses.dart';
import 'package:quizapp/views/Constants.dart';
import 'package:quizapp/views/components/service_list.dart';

class IntroducePage extends StatefulWidget {
  @override
  _IntroducePageState createState() => _IntroducePageState();
}

class _IntroducePageState extends State<IntroducePage> {
  List courses = [];
  @override
  void initState() {
    super.initState();
    fecthCourseList();
  }

  fecthCourseList() async {
    dynamic resultant = await DataCourses().GetCourseList();

    if (resultant == null) {
      print('Unable to get course');
    } else {
      setState(() {
        courses = resultant;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [lightBlue, lightPurple, Colors.blue[900]],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.2, 0.5, 0.8],
            ),
          ),
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/AGU.png',
                    height: 150,
                    width: 150,
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Text(
                    'TRUNG TÂM TIN HỌC',
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                  Text(
                    'TRƯỜNG ĐẠI HỌC AN GIANG',
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.red[800],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                    width: size.width * 0.3,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 2,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ), //redline
                  Container(
                    height: size.height * 1.78,
                    width: size.width,
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            'Giới thiệu',
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        Text(
                          '   Trung tâm Tin học là đơn vị chuyên trách quản lý và cung cấp các dịch vụ về công nghệ thông tin của Trường Đại học An Giang.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Image.asset(
                          'assets/images/hinh-gioithieu-1.jpg',
                          width: size.width * 0.7,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(
                          '   Trung tâm có chức năng nghiên cứu, tư vấn và triển khai các giải pháp công nghệ thông tin cho các đơn vị trong và ngoài Trường. Trung tâm chịu trách nhiệm quản lý toàn bộ hệ thống mạng thông tin của Nhà trường, từ hạ tầng cho đến các dịch vụ mạng.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(
                          '   Với một tập thể có trình độ chuyên môn cao, giàu năng lực và kinh nghiệm, Trung tâm đã giúp Nhà trường xây dựng hệ thống mạng thông tin với băng thông tối thiểu là 1 Gigabit và hệ thống Data Center hiện đại được vận hành ổn định 24/24. Trung tâm đã nghiên cứu và triển khai thành công nhiều dịch vụ, ứng dụng, dịch vụ trên nền mã nguồn mở phục vụ hiệu quả cho các hoạt động quản lý và chuyên môn của Nhà trường như: hệ thống chia sẻ cộng tác, hệ thống quản lý công văn, hệ thống lưu trữ trực tuyến, hệ thống website các đơn vị, tổ chức và cá nhân trong Trường, .v.v…',
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Image.asset(
                          'assets/images/hinh-gioi-thieu-2.jpg',
                          width: size.width * 0.7,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(
                          '   Về hoạt động dịch vụ, Trung tâm Tin học thường xuyên tổ chức đào tạo và kiểm tra cấp chứng chỉ tin học trình độ A, B Quốc gia, và các lớp chuyên đề (Quản trị mạng, Thiết kế & Lập trình web, Lắp ráp & Cài đặt máy tính). Ngoài ra, Trung tâm còn mở các lớp đào tạo tin học theo yêu cầu và thực hiện các hợp đồng: bảo trì, sửa chữa, phục hồi dữ liệu máy tính; tư vấn, thiết kế, triển khai và bảo trì hệ thống mạng; thiết kế website, phát triển phần mềm; tư vấn về lĩnh vực dự án đầu tư, ...',
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Image.asset(
                          'assets/images/hinh-gioi-thieu-3.jpg',
                          width: size.width * 0.7,
                        ),
                      ],
                    ),
                  ), //Gioithieu
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Container(
                    height: size.height * 0.7,
                    width: size.width,
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            'Dịch Vụ',
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        CarouselSlider(
                          options: CarouselOptions(
                            height: size.height * 0.6,
                            aspectRatio: 2.0,
                            enlargeCenterPage: true,
                            viewportFraction: 1.0,
                          ),
                          items: listService
                              .map((context) => Container(
                                    height: size.width,
                                    width: size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.grey,
                                          Colors.white,
                                          Colors.grey,
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        stops: [0.1, 0.5, 0.9],
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 15, 0, 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                height: size.height * 0.18,
                                                width: size.height * 0.2,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    border:
                                                        Border.all(width: 2)),
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        5, 0, 5, 0),
                                                width: size.height * 0.27,
                                                child: AutoSizeText(
                                                  context.name,
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                    fontFamily: 'Avenir',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: size.height * 0.010),
                                        Container(
                                          height: size.height * 0.3,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          alignment: Alignment.center,
                                          child: AutoSizeText(
                                            context.description,
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                  ), //DuchVu
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Container(
                    height: size.height * 0.6,
                    width: size.width,
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            'Đào Tạo',
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        CarouselSlider.builder(
                          options: CarouselOptions(
                            height: size.width,
                            aspectRatio: 2.0,
                            enlargeCenterPage: true,
                            viewportFraction: 1.0,
                          ),
                          itemCount: courses.length,
                          itemBuilder: (context, index, rlIdx) {
                            return Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.grey,
                                    Colors.white,
                                    Colors.grey,
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: [0.1, 0.5, 0.9],
                                ),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.network(
                                        '${courses[index]['imgURL']}',
                                        height: size.width * 0.4,
                                        width: size.width * 0.4,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 20, 0, 0),
                                        alignment: Alignment.topLeft,
                                        height: size.width * 0.4,
                                        width: size.width * 0.51,
                                        child: Column(
                                          children: [
                                            Text(
                                              '${courses[index]['courseName']}',
                                              style: TextStyle(
                                                fontFamily: 'Avenir',
                                                fontSize: 30,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w900,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            SizedBox(
                                              height: size.width * 0.03,
                                            ),
                                            Text(
                                              'Học phí: ......',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'Đánh giá: .....',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'Giảng viên: .....',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    alignment: Alignment.topLeft,
                                    height: size.width * 0.43,
                                    child: Text(
                                      '${courses[index]['courseDes']}',
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: Offset(0, -3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(50),
                        gradient: LinearGradient(
                          colors: [
                            Colors.white,
                            Colors.grey,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.05, 0.25],
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/AGU.png',
                          width: 100,
                          height: 100,
                        ),
                        Container(
                          width: size.width * 0.6,
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Column(
                            children: [
                              Container(
                                child: Text(
                                  '© TRUNG TÂM TIN HỌC - TRƯỜNG ĐẠI HỌC AN GIANG',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border(bottom: BorderSide(width: 1))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Điện thoại:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text('+84 296 6253599'),
                                        Text('+84 296 6256565'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      border:
                                          Border(bottom: BorderSide(width: 1))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Fax:',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text('+84 296 3842560'),
                                    ],
                                  )),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border(bottom: BorderSide(width: 1))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Email:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text('cict@agu.edu.vn'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ), //bottom
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
