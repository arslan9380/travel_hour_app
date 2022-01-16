import 'package:travel_hour/models/result_model.dart';

class Constants {
  static final String fcmSubscriptionTopic = 'all';

  static final String busan = "Busan";
  static final String seoul = "Seoul";
  static final String luxury = "Luxury";
  static final String resturant = "Resturant";

  static final ResultModel busanLuxury = ResultModel(
      searchKey: busan + luxury,
      city: busan,
      intrest: luxury,
      title: "You chosed Busan Luxury Lovers !  we recommend :",
      refrence: "http://www.citytourbusan.com/en2/02course/01.php",
      descirption:
          "Tourism public transportation easily connecting Busan attractions by double-decker bus! City Tour Course is a single pass ticket(24-hour), you can travel each route, including Red Line (Busan Station – Haeundae), Blue Line (Haeundae - Yonggungsa Temple, Gijang Market), and Green Line (Busan Station - Taejongdae).",
      imagePath: "assets/images/Busan_Luxury.jpg");

  static final ResultModel busanResturant = ResultModel(
    searchKey: busan + resturant,
    city: busan,
    intrest: resturant,
    title: "You chosed Busan Restaurent !  we recommend :",
    imagePath: "assets/images/Busan_Restaurent.png",
    refrence:
        "https://boundforbusan.com/2019/12/what-to-eat-in-busan-10-must-eat-restaurants.html",
    descirption:
        "My recommendation would be to find a delicious hole-in-the-wall restaurant 맛집 like 전주횟집. I would order a small (小) Hagfish 꼼장어 for 2 people and ask for some Raw Octopus 산낙지. It should be about ₩30,000.",
  );

  static final ResultModel seoulLuxury = ResultModel(
      searchKey: seoul + luxury,
      city: seoul,
      intrest: luxury,
      title: "You chosed Seoul Luxury Lovers !  we recommend :",
      refrence: "https://www.fourseasons.com/seoul/spa",
      descirption:
          "Our modern take on Korea’s most enduringly popular treatment starts in our saunas and pools to boost circulation. A traditional Korean scrub with a loofah mitt exfoliates every inch of your body to reveal new skin and prepare you for a cocoon of nutritious seaweed that delivers marine goodness straight into your body. An herbal water pour washes the seaweed away before a restorative, deep-tissue body treatment and hair and facial mask banish the last vestiges of tension.",
      imagePath: "assets/images/Seoul_Luxury.jpg");

  static final ResultModel seoulResturant = ResultModel(
      searchKey: seoul + resturant,
      city: seoul,
      intrest: resturant,
      title: "You chosed Seoul Restaurent !  we recommend :",
      refrence: "https://www.fourseasons.com/seoul/dining/",
      descirption:
          "Reminiscent of a bustling European market hall, this show-stopping buffet is an international bazaar of foods, flavours and cuisines, all prepared à la minute at interactive, live cooking stations.modern take on Korea’s most enduringly popular treatment starts in our saunas and pools to boost circulation. A traditional Korean scrub with a loofah mitt exfoliates every inch of your body to reveal new skin and prepare you for a cocoon of nutritious seaweed that delivers marine goodness straight into your body. An herbal water pour washes the seaweed away before a restorative, deep-tissue body treatment and hair and facial mask banish the last vestiges of tension.",
      imagePath: "assets/images/Seoul_Restaurent.jpg");
}
