import 'package:flutter/material.dart';
class VideoScreen extends StatefulWidget {
  const VideoScreen ({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size= MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // backgroundColor: Colors.green,
        backgroundColor: Color(0xffffff),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),

        child: Column(
          children: [
            Container(
              child: Text('Video ở đây', maxLines: 10),
              height: size.height/4,
              width: size.width/1,
              color: Colors.black12,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text('Bài tập hỗ trợ tay',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Riluzole (thuốc chính thức được FDA Hoa Kỳ chấp thuận sử dụng): liều 100mg chia 2 lần/ngày, nên sử dụng sớm khi đã có chẩn đoán xác định, điều trị trong 18 tháng, kéo dài thời gian sống '
                    'của bệnh nhân thêm vài tháng đặc biệt là với bệnh nhân đã có triệu chứng liệt hầu họng (ăn nghẹn, uống sặc)',
                style: TextStyle(
                fontSize: 15,
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
