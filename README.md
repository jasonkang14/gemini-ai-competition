# Blood Sugar Tracker

This application is built with **Flutter Gemini** and is designed to help users monitor and analyze their blood sugar levels in relation to their meals.

## Features

- **Track Blood Sugar History**: The app keeps a detailed history of your blood sugar levels, with all data securely stored in **Firebase Realtime Database**.

- **Meal Impact Analysis**: Users can view a chart of their blood sugar levels and identify which meals they had at specific data points. The impact of each meal on blood sugar levels is analyzed by **Gemini** and displayed for easy understanding.

- **Meal Image Upload and Analysis**: Users can upload a picture of their meal to see its predicted impact on their blood sugar levels. The image is uploaded to **Firebase Storage**, and the analysis results are saved in **Firebase Firestore**.

- **Interactive Meal Impact Chat**: Users can also chat with the app by uploading an image of their meal and asking about its potential impact on their blood sugar levels. The app will analyze the meal and provide feedback.

## Technology Stack

- **Flutter Gemini**: For building the UI and handling the complex analysis of meal impacts on blood sugar.
- **Firebase Realtime Database**: For storing the history of blood sugar levels.
- **Firebase Storage**: For storing meal images uploaded by users.
- **Firebase Firestore**: For saving the analysis results of meal impacts.

## Getting Started

To run this app, you will need to set up a Flutter environment and configure Firebase for your project. Once set up, you can track and analyze your blood sugar levels based on your meal history.

