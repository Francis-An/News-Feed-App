import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({required this.name, required this.imageUrl});

  @override
  // Add the images and name here to show it on the page
  List<Object?> get props => [name, imageUrl];

  static List<Category> categories = [
    // const Category(
    //   name: 'Soft Drink',
    //   imageUrl:
    //       'https://www.thomas-henry.com/wp-content/webp-express/webp-images/uploads/2021/06/thomas-henry-americano-recipe-1024x1024.jpg.webp',
    // ),
    // const Category(
    //   name: 'Coca cola',
    //   imageUrl:
    //       'https://images.pexels.com/photos/50593/coca-cola-cold-drink-soft-drink-coke-50593.jpeg?cs=srgb&dl=pexels-pixabay-50593.jpg&fm=jpg',
    // ),
    // const Category(
    //   name: 'Ful Drink',
    //   imageUrl:
    //       'https://fulcompany.com/cdn/shop/articles/Lemon_Ginger_Still_25e2add7-617b-4b3b-86a2-6e056f6849bd_1200x1200.jpg?v=1656940757',
    // ),
    const Category(
      name:
          'Big Chef Tertiary: KoTU first to exit competition as ATU wins star school of the day in EP 7',
      imageUrl:
          'https://www.backend.myjoyonline.com/wp-content/uploads/2023/08/WhatsApp-Image-2023-08-15-at-03.40.09.jpeg',
    ),
    const Category(
      name: 'ATU begins 2023-24 academic year Wednesday',
      imageUrl:
          'https://bloximages.newyork1.vip.townnews.com/couriernews.com/content/tncms/assets/v3/editorial/9/9a/99a71870-5ece-59f1-b529-d55a12ca892a/64e38519acf44.image.jpg?resize=990%2C660',
    ),
    const Category(
        name:
            'Nana Krobea Asante I, Adontenhene of Mpraeso, and Kwahu, who was a guest judge on the show',
        imageUrl:
            'https://www.backend.myjoyonline.com/wp-content/uploads/2023/08/WhatsApp-Image-2023-08-14-at-05.51.33.jpeg'
            ),
    // const Category(
    //     name:
    //         'ATU Grants Scholarship to 137 Students, Empowers Academic Excellence ',
    //     imageUrl:
    //         'https://atu.edu.gh/wp-content/uploads/2023/08/WhatsApp-Image-2023-08-18-at-17.09.23-1024x768.jpeg',
      // ),
  ];
}
