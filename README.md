#  Store App 🛍️

A Flutter application built with **Clean Architecture** and **Dio** for API integration.  
The app includes **Splash**, **Login**, **Home**, and **Update** screens.  
Users can view products fetched from an API and update product details easily.

---

##  Screens

- **Splash Screen** – Displays app logo before navigation.  
- **Login Screen** – Handles user login UI.  
- **Home Screen** – Shows a list of products using Dio API calls.  
- **Update Screen** – Allows users to edit product information.

---

##  Architecture

Built following **Clean Architecture** principles for scalability and clean code separation.  
Includes layers for:
- **Data** – API calls, and models (using Dio).  
- **Presentation** – UI screens and reusable widget .  
- **Core** – Reusable utilities, constants, and API helper.

---

##  Built With

- Flutter  
- Dart  
- Dio  
- Clean Architecture  

---

##  Demo Video

[▶️ Watch the video](https://drive.google.com/file/d/1eOotg0jbHFplrLWSYjhZJ7Z4DXuANnyO/view?usp=drive_link)

##  How to Run

```bash
git clone https://github.com/<your-username>/store_app.git
cd store_app
flutter pub get
flutter run
