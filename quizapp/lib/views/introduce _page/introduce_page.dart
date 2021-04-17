import 'package:flutter/material.dart';
import 'package:quizapp/views/Constants.dart';

class IntroducePage extends StatelessWidget {
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
                  ),
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
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Container(
                    height: size.height * 1.5,
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
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Phát Triển Web',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        Container(
                          width: size.width * 0.4,
                          child: Column(
                            children: [
                              Text(
                                'Phát triển website (web development):',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Thiết kế website.',
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Bảo trì & nâng cấp website.',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                    Text(
                                      'Quản trị & và cập nhật website.',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                    Text(
                                      'Tư vấn giải pháp quảng bá bằng website.',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: size.width * 0.4,
                          child: Column(
                            children: [
                              Text(
                                'Công nghệ:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Phát Triển phần mềm ứng dụng',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Cho thuê phòng máy',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Container(
                    height: size.height * 0.3,
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
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
