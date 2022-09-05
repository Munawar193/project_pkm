import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rice_quality_scanning/model/proses_model.dart';
import 'package:rice_quality_scanning/services/image_proses_service.dart';
import 'package:rice_quality_scanning/services/base_url.dart';
import 'package:rice_quality_scanning/ui/screens/theme.dart';
import 'package:http/http.dart' as http;
import 'package:rice_quality_scanning/ui/widgets/card_indicator.dart';
import 'package:rice_quality_scanning/ui/widgets/delay.dart';
import 'package:rice_quality_scanning/ui/widgets/loading_delet.dart';
import 'package:rice_quality_scanning/ui/widgets/loading_lottifile.dart';
import 'package:rice_quality_scanning/ui/widgets/success_loading.dart';

class ScanningWithUpload extends StatefulWidget {
  const ScanningWithUpload({Key? key}) : super(key: key);

  @override
  State<ScanningWithUpload> createState() => ScanningWithUploadState();
}

class ScanningWithUploadState extends State<ScanningWithUpload> {
  late bool _isLoading;

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(milliseconds: 2100), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  ImageProsesApi prosesImage = ImageProsesApi();
  ProsesModel? data;

  Future<void> _getData() async {
    data = await prosesImage.getImageProses(baseUrl);
  }

  File? _selectedImage;

  Future<http.Response> getCoordinate(File file, String link) async {
    try {
      String filename = file.path.split('/').last;
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(link),
      );
      Map<String, String> headers = {"Content-type": "multipart/form-data"};
      request.files.add(
        http.MultipartFile(
          'image',
          file.readAsBytes().asStream(),
          file.lengthSync(),
          filename: filename,
        ),
      );
      request.headers.addAll(headers);
      var res = await request.send();
      var response = await http.Response.fromStream(res);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _addImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        _selectedImage = File(image.path);
      }
      setState(() {
        onUploadImage();
      });
    } catch (e) {
      rethrow;
    }
  }

  onUploadImage() async {
    try {
      if (_selectedImage != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SuccessLoading(),
          ),
        );
      }
      final res = await getCoordinate(
        File(_selectedImage!.path),
        "$baseUrl/upload",
      );
      debugPrint(res.body);
      setState(() {});
      Future.delayed(const Duration(milliseconds: 2700));
      Navigator.pop(context);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget backBottom() => InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  offset: const Offset(6, 6),
                  blurRadius: 15,
                  spreadRadius: 1.0,
                ),
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(-6, -6),
                  blurRadius: 15,
                  spreadRadius: 1.0,
                ),
              ],
            ),
            child: Image.asset('assets/images/arrow_back.png'),
          ),
        );

    Widget pickImageButtom() => InkWell(
          onTap: () async {
            if (_selectedImage == null) {
              _addImage();
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoadingDeletSuccess(),
                ),
              );
              await delay(500);
              setState(() {
                _selectedImage = null;
              });
              await delay(1300);
              Navigator.pop(context);
            }
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  offset: const Offset(6, 6),
                  blurRadius: 15,
                  spreadRadius: 1.0,
                ),
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(-6, -6),
                  blurRadius: 15,
                  spreadRadius: 1.0,
                ),
              ],
            ),
            child: _selectedImage != null
                ? Image.asset('assets/images/trash.png')
                : Image.asset('assets/images/upload1_icon.png'),
          ),
        );

    Widget content() => Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 475,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    backBottom(),
                    Text(
                      'Result\nScanning',
                      style: greenStyle.copyWith(
                        fontSize: 20,
                        fontWeight: bold,
                        color: kprimeColor.withOpacity(0.8),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    pickImageButtom(),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                FutureBuilder(
                  future: _getData(),
                  builder:
                      (BuildContext context, AsyncSnapshot<void> snapshot) {
                    final whiteRice = data?.whiteRice;
                    final yellowRice = data?.yellowRice;
                    final blackRice = data?.blackRice;
                    final brokenRice = data?.brokenRice;
                    if (snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Column(
                        children: [
                          Row(
                            children: [
                              CardIndicator(
                                title: 'Beras putih',
                                percent: _selectedImage != null ? 1 : 0,
                                textpercent: _selectedImage == null
                                    ? '0.0%'
                                    : "$whiteRice%",
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              CardIndicator(
                                title: 'Beras kuning',
                                percent: _selectedImage != null ? 1 : 0,
                                textpercent: _selectedImage != null
                                    ? "$yellowRice%"
                                    : '0.0%',
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              CardIndicator(
                                title: 'Beras hitam',
                                percent: _selectedImage != null ? 1 : 0,
                                textpercent: _selectedImage != null
                                    ? "$blackRice%"
                                    : '0.0%',
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              CardIndicator(
                                title: 'Beras patah',
                                percent: _selectedImage != null ? 1 : 0,
                                textpercent: _selectedImage != null
                                    ? "$brokenRice%"
                                    : '0.0%',
                              ),
                            ],
                          ),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );

    Widget imagePicker() => Container(
          color: backgroundColor,
          width: MediaQuery.of(context).size.width,
          child: _selectedImage != null
              ? Image.file(
                  _selectedImage!,
                  width: MediaQuery.of(context).size.width,
                  height: 350,
                  fit: BoxFit.cover,
                )
              : Container(
                  color: Colors.black.withOpacity(0.8),
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  padding: const EdgeInsets.only(top: 60),
                  child: Column(
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/skelton.png',
                          width: 120,
                          color: kGreyColor,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          'Belum Ada Gambar',
                          style: greyStyle.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: kGreyColor),
                        ),
                      )
                    ],
                  ),
                ),
        );

    return Scaffold(
      body: _isLoading
          ? const LottieFile()
          : Stack(
              children: [
                imagePicker(),
                content(),
              ],
            ),
    );
  }
}
