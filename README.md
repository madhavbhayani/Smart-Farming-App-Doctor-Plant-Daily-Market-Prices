THIS VERSION OF DOCTOR PLANT IS DEPRECATED AND NO LONGER IN SUPPORT
VERSION 2 OF DOCTOR PLANT IS RELEASING SOON

**This repository is just for the reference and history trace



![Logo](https://firebasestorage.googleapis.com/v0/b/doctorplant-smartfarming.appspot.com/o/logo.png?alt=media&token=ec48b0e2-8fa5-4b55-a463-4688eaf84e09)


# Doctor Plant | Smart Farming Application | Daily Market Prices

**Introducing Doctor Plant**, the AI-powered application revolutionizing plant care. Swiftly diagnose and cure plant diseases with cutting-edge AI algorithms. Receive tailored cultivation tips, smart techniques, and real-time weather information. Access a comprehensive database on pests and diseases. Doctor Plant is your intelligent, user-friendly companion for cultivating thriving green spaces. Download now and embark on a journey.

**What exact problem our innovation is trying to solve?**
The leading diseases in plants/crops highlight a critical need for an efficient solution that empowers precision farming by identifying, diagnosing, and treating plant diseases effectively. Farmers need a comprehensive and precise application that not only tackles leaf diseases effectively but also provides tailored cultivation tips, empowering them to nurture their crops with precision and elevate their agricultural practices for sustained success.




## Download the APK(Beta)

To Download this project follow:

- [Download dotorplant.apk](https://drive.google.com/file/d/1MivKO1YI-oyIZy9KkOem47eNw4g90SYU/view?usp=sharing)

## Features

- Image Processing
- Pests & Diseases
- Real Time Weather
- Daily Market Prices


## Tech Stack

**Frontend:** Flutter(Dart) & Swift

**Backend:** Dart, Javascript

**Image Processing:** Google TensorFlow & Google Teachable Machine

**Datasets:** Kaggle

**Video Animations & Tutorials:** VideoScribe

**Database:** Firebase



## Acknowledgements

 - [Open Weather API](https://openweathermap.org/api)
 - [Daily Market Prices API](https://data.gov.in/resource/current-daily-price-various-commodities-various-markets-mandi)
 - [Doctor Plant Problem Statement Video](https://youtu.be/okfWWCgSt5I?feature=shared)
 - [Doctor Plant Branding Video](https://youtu.be/C8kKpSdBT4k?feature=shared)


## API Reference

#### Get weather

```http
   https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=api_key&units=metric;
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `api_key` | `string` | **Required**. Your API key |

#### Get forecast

```http
  https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=api_key&units=metric;
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `api_key`      | `string` | **Required**. api_key |



## Screenshots

![App Screenshot](https://firebasestorage.googleapis.com/v0/b/doctorplant-smartfarming.appspot.com/o/snap3.jpg?alt=media&token=b81b1a5a-b12f-42c7-8e6f-a662406c675c)

![App Screenshot](https://firebasestorage.googleapis.com/v0/b/doctorplant-smartfarming.appspot.com/o/snap2.jpg?alt=media&token=d9157186-1005-42e0-9def-8f89067f5536)

![App Screenshot](https://firebasestorage.googleapis.com/v0/b/doctorplant-smartfarming.appspot.com/o/snap1.jpg?alt=media&token=d9815944-37dc-4ed5-a7bc-a2176f278f65)

![App Screenshot](https://firebasestorage.googleapis.com/v0/b/doctorplant-smartfarming.appspot.com/o/1709132204170.jpg?alt=media&token=2ab329ff-7112-4656-b548-2c13c8333979)

![App Screenshot](https://firebasestorage.googleapis.com/v0/b/doctorplant-smartfarming.appspot.com/o/ss.jpg?alt=media&token=ef1f46ae-d482-4372-b68d-4681eb912ece)

![App Screenshot](https://firebasestorage.googleapis.com/v0/b/doctorplant-smartfarming.appspot.com/o/daily-market-prices.jpg?alt=media&token=751717ff-886c-4934-9d37-e54900975c6c)

![App Screenshot](https://firebasestorage.googleapis.com/v0/b/doctorplant-smartfarming.appspot.com/o/filter_market.jpg?alt=media&token=baf5970f-5118-4ea0-a68f-ea2c534a3eb3)
## Run Source Code 
Replace the API KEY & Necessary assets


```bash
  flutter pub get
  flutter run
```
    
## Feedback

If you have any feedback, please reach out to us at info.doctorplant@gmail.com

