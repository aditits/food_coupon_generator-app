import 'package:flutter/material.dart';


class SliderModel{

  String imageAssetPath;
  String title;
  String desc;
  String appIcon;

  SliderModel({this.imageAssetPath,this.title,this.desc,this.appIcon});

  void setImageAssetPath(String getImageAssetPath){
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle){
    title = getTitle;
  }

  void setDesc(String getDesc){
    desc = getDesc;
  }
  void setAppIcon(String getAppIcon){
    appIcon = getAppIcon;
  }

  String getImageAssetPath(){
    return imageAssetPath;
  }

  String getTitle(){
    return title;
  }

  String getDesc(){
    return desc;
  }
  String getAppIcon(){
    return appIcon;
  }


}


List<SliderModel> getSlides(){

  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc(" We make it simple to find the food you crave.\nEnter your address and let us do the rest");
  sliderModel.setTitle("Discover");
  sliderModel.setImageAssetPath("assets/illustration.png");
  sliderModel.setAppIcon("assets/ic_launcher.jpeg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc("When you order on FUDI, we'll hooke you up with\nexculsive coupons, discounts and other rewards");
  sliderModel.setTitle("Order");
  sliderModel.setImageAssetPath("assets/illustration2.png");
  sliderModel.setAppIcon("assets/ic_launcher.jpeg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc("We make food ordering fast, simple and reliable.");
  sliderModel.setTitle("Express Delivery");
  sliderModel.setImageAssetPath("assets/illustration3.jpg");
  sliderModel.setAppIcon("assets/ic_launcher.jpeg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();


  //4
  sliderModel.setDesc("Enjoy your favourite food at the comfort of your home");
  sliderModel.setTitle("Dig in!");
  sliderModel.setImageAssetPath("assets/illustration4.jpg");
  sliderModel.setAppIcon("assets/ic_launcher.jpeg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();
  return slides;
}