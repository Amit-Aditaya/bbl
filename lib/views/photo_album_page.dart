import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';

class PhotoAlbumPage extends StatelessWidget {
  const PhotoAlbumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Photo Album',
        backgroundColor: AppColors.primaryColor,
      ),
      //backgroundColor: Color(0xffFFF0C7),
      backgroundColor: const Color(0xffFFF6DD),

      body: Container(
        color: Colors.transparent,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Container(
                height: 180,
                width: 280,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 6,
                    color: AppColors.primaryColor,
                  ),
                ),
                child: Center(
                  child: Container(
                    height: 150,
                    width: 215,
                    color: Colors.transparent,
                    child: const Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          'https://media.istockphoto.com/photos/portrait-of-black-family-with-kids-relax-on-couch-picture-id1166112327?k=20&m=1166112327&s=612x612&w=0&h=pAOKCAE1RSFgniYIazveoNmpG0k7-IEQQ5XMRjxE0RM='),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Text('My Family at Babuland'),
              const SizedBox(height: 35),
              Container(
                height: 180,
                width: 280,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 6,
                    color: AppColors.primaryColor,
                  ),
                ),
                child: Center(
                  child: Container(
                    height: 150,
                    width: 215,
                    color: Colors.transparent,
                    child: const Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          'https://media-exp1.licdn.com/dms/image/C561BAQEYIoiUJ84Mbg/company-background_10000/0/1560764646195?e=2159024400&v=beta&t=wsBNVLMBOfY5jZdjv5H8cPiDpAsbsxQj63xlgKZpeA8'),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Text('Playtime at Babuland'),
              const SizedBox(height: 35),
              Container(
                height: 180,
                width: 280,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 6,
                    color: AppColors.primaryColor,
                  ),
                ),
                child: Center(
                  child: Container(
                    height: 150,
                    width: 215,
                    color: Colors.transparent,
                    child: const Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          'https://media.istockphoto.com/vectors/children-dancing-in-the-city-vector-id947805302?b=1&k=20&m=947805302&s=612x612&w=0&h=q0bdQmU8RGoePAV1GV98CYme0cZNza8qesqBd58ZUZk='),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Text('Dancing at Babuland'),
              const SizedBox(height: 35),
              Container(
                height: 180,
                width: 280,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 6,
                    color: AppColors.primaryColor,
                  ),
                ),
                child: Center(
                  child: Container(
                    height: 150,
                    width: 215,
                    color: Colors.transparent,
                    child: const Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          'https://media.istockphoto.com/vectors/children-dancing-in-the-city-vector-id947805302?b=1&k=20&m=947805302&s=612x612&w=0&h=q0bdQmU8RGoePAV1GV98CYme0cZNza8qesqBd58ZUZk='),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Text('Mom and Me'),
              const SizedBox(height: 35),
              Container(
                height: 180,
                width: 280,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 6,
                    color: AppColors.primaryColor,
                  ),
                ),
                child: Center(
                  child: Container(
                    height: 150,
                    width: 215,
                    color: Colors.transparent,
                    child: const Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          'https://media.istockphoto.com/vectors/children-dancing-in-the-city-vector-id947805302?b=1&k=20&m=947805302&s=612x612&w=0&h=q0bdQmU8RGoePAV1GV98CYme0cZNza8qesqBd58ZUZk='),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Text('Dad and Me'),
              const SizedBox(height: 35),
              Container(
                height: 180,
                width: 280,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 6,
                    color: AppColors.primaryColor,
                  ),
                ),
                child: Center(
                  child: Container(
                    height: 150,
                    width: 215,
                    color: Colors.transparent,
                    child: const Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          'https://media.istockphoto.com/vectors/children-dancing-in-the-city-vector-id947805302?b=1&k=20&m=947805302&s=612x612&w=0&h=q0bdQmU8RGoePAV1GV98CYme0cZNza8qesqBd58ZUZk='),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Text('Birthday at Babuland'),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
