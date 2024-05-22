# CareConnect Health System - README

## Project Overview
CareConnect Health System is an advanced database management system designed to improve the efficiency and functionality of hospital systems. This project was developed as part of the CEIT390 Database Management Systems course at Middle East Technical University by Buse Birinci, Eralp Çolak, Eyyüpcan İşler, and Mustafa Furkan Özateş under the supervision of Lecturer İhsan Tolga Medeni PhD.

## Key Features
- **User-Friendly Interface:** The system is designed to be intuitive and easy to navigate, ensuring that users can access the features they need without hassle.
- **Data Security:** Although not fully implemented, the system aims to minimize data loss and enhance data security.
- **Comprehensive Patient Management:** Patients can adjust personal information, schedule appointments, view medical history, and access test results.
- **Symptom-Based Guidance:** Patients receive suggestions on which department to visit based on their symptoms through a guided questionnaire.

## Technologies Used
- **Frontend Development:** HTML, CSS, JavaScript
- **Backend Development:** PHP, phpMyAdmin, MySQL

## Database Schema
### Tables and Relationships
- **Register_info:** Stores user credentials (TC number and password) and registration dates.
- **Kisisel_bilgiler:** Contains personal information such as name, gender, blood type, and address.
- **Randevular:** Manages appointment details including patient TC, doctor ID, and appointment dates.
- **Doktorlar:** Contains doctor details including department and hospital affiliations.
- **Departmanlar:** Stores department names.
- **Hastane:** Stores hospital names and locations.
- **Sorular & Soru_cevapları:** Manages symptom-related questions and patient responses.
- **Various Medical Test Tables:** These include BOSAnalizi, Dahiliye_testi, D_vitamini, Genelcerrahitesti, Görüntüleme, Hemogram, Hıvtest, Kadındogum, Kangazı, KardiyolojiTestleri, and Uroloji_testi, storing detailed medical test results.

### Key Relationships
- The **Randevular** table is connected to **Register_info** (patient TC) and **Doktorlar** (doctor ID).
- **Doktorlar** is linked to **Departmanlar** (department names) and **Hastane** (hospital names and cities).
- The **Sorular** and **Soru_cevapları** tables help in determining the appropriate department for patient symptoms.
- Various medical test tables store detailed health metrics associated with each patient.

## User Interface
The user interface consists of several key screens:
- **Log-In Screen:** Allows users to log in using their TC and password or register as a new user.
- **Patient Dashboard:** Provides access to personal information, appointment scheduling, medical history, and test results.
- **Symptom Checker:** Guides patients through a series of questions to suggest the appropriate medical department.

## Installation and Setup
1. **Clone the Repository:** `git clone https://github.com/your-username/CareConnect-Health-System.git`
2. **Install Dependencies:** Ensure you have phpMyAdmin and Visual Studio 2022 installed.
3. **Database Configuration:** Import the provided SQL scripts into your phpMyAdmin to set up the database schema and initial data.
4. **Run the Application:** Open the project in Visual Studio 2022 and start the application.

## Usage
- **Logging In:** Use your TC and password to log in. New users can register from the log-in screen.
- **Scheduling Appointments:** Navigate to the appointments section, choose your city, hospital, department, and doctor, then select a date to schedule.
- **Viewing Medical Records:** Access your medical history and test results from the dashboard.

## Contributors
- **Buse Birinci**
- **Eralp Çolak**
- **Eyyüpcan İşler**
- **Mustafa Furkan Özateş**

## License
This project is licensed under the MIT License. See the LICENSE file for details.

## Acknowledgments
Special thanks to our lecturer, İhsan Tolga Medeni PhD, for his guidance and support throughout this project.
