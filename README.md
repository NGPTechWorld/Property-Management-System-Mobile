<p align="center">
  <a href="https://flutter.dev/" target="blank">
    <img src="https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png" width="300" alt="Flutter Logo" />
  </a>
</p>

<p align="center">
  <b>Property Management System - Mobile App</b><br/>
  A modern, cross-platform mobile application for managing and exploring real estate properties, built with <a href="https://flutter.dev/" target="_blank">Flutter</a> and powered by the PMS Backend (NestJS).
</p>

<div align="center">

<!-- Project status -->

![GitHub License](https://img.shields.io/github/license/NGPTechWorld/Property-Management-System-Mobile?cacheSeconds=600)
![GitHub Stars](https://img.shields.io/github/stars/NGPTechWorld/Property-Management-System-Mobile?cacheSeconds=600)
![GitHub Forks](https://img.shields.io/github/forks/NGPTechWorld/Property-Management-System-Mobile)
![GitHub Contributors](https://img.shields.io/github/contributors/NGPTechWorld/Property-Management-System-Mobile)
![GitHub Last Commit](https://img.shields.io/github/last-commit/NGPTechWorld/Property-Management-System-Mobile)

---

<!-- Repo details -->

![Repo Size](https://img.shields.io/github/repo-size/NGPTechWorld/Property-Management-System-Mobile)
![Code Size](https://img.shields.io/github/languages/code-size/NGPTechWorld/Property-Management-System-Mobile)
![Languages](https://img.shields.io/github/languages/count/NGPTechWorld/Property-Management-System-Mobile)
![Open Issues](https://img.shields.io/github/issues/NGPTechWorld/Property-Management-System-Mobile)
![Closed Issues](https://img.shields.io/github/issues-closed/NGPTechWorld/Property-Management-System-Mobile)

---

<!-- Tech stack -->
![Flutter](https://img.shields.io/badge/Flutter-v3.32.2-blue.svg?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-v3.8.1-blue.svg?logo=dart)
![Firebase](https://img.shields.io/badge/Firebase-Notifications-orange.svg?logo=firebase)
![Stripe](https://img.shields.io/badge/Stripe-Payments-purple.svg?logo=stripe)

</div>


## 📌 About the Project

The **Property Management System (PMS)** is a complete solution for **real estate and property management** that includes:

- **3 Web Dashboards**:
  - **Admin & Supervisors Dashboard** for managing system operations, approvals, financials, complaints, and monitoring statistics
  - **Brokers / Office Managers Dashboard** for managing offices, properties, bookings, payments, and advertisements
  - **Service Providers Dashboard** for managing and offering property-related services (maintenance, furnishing, cleaning, etc.)
- **Mobile Application** for end-users to explore, book, and manage properties and tourist places
- **Role-based permissions** with secure authentication
- **Payment and invoicing system** supporting online and manual payments
- **Real-time notifications, support requests, and reporting system**
- **Service providers management** for additional services related to properties

### 🏠 Entry Point (Landing Single Page)

When accessing the platform for the first time, users are welcomed with a **landing single page** that showcases:

- **Top 5 Brokers/Offices**
- **Top 5 Service Providers**
- **Contributors/Developers** who worked on the project

From this entry page, the user can decide to either:

- **Visit the Mobile Application** to explore properties and tourist places as an end-user
- **Join as a Broker (Office Manager) or Service Provider** by submitting office/service details along with a verification document.
  - The request is then sent to the **Admin Dashboard** for review and can be **approved or rejected**.

The system is built using **Domain-Driven Design (DDD)** and **Clean Architecture** for scalability and maintainability.

---

## 🔺 Features

### Users (Mobile App)

- Browse **brokers/offices**
- Browse **tourist places**
- Browse **residential and tourist properties**
- **Filter and search**
- **Compare two properties or tourist places**
- **Book a property or tourist place**
- **Notifications**
- **My Bookings**
- **Profile management**
- **Explore and Trending properties**
- **Ads display**
- Browse **service providers** and **book services**
- **Request support**
- **Rate**
- **Submit complaints**
- **Favorites**
- **Post custom property requests**
- **View related properties**
- **360° property view**

### Office Managers

- Add and edit **office details**
- Add, update, and manage **properties**
- View **office statistics**
- Filter and view **my properties** and **tourist places**
- Manage **bookings, rents, and fees**
- Configure **payment methods** (online or manual)
- Manage **ads** and respond to requests
- Request **services** and **support**

### Service Providers

- Add and edit **service details** (e.g., cleaning, maintenance, landscaping)
- **Activate or deactivate** services
- Manage **service availability**
- Handle **support requests** from users and offices
- View **service-related bookings and requests**

### Supervisors

- Review requests and approvals
- Register in the system
- Review office requests
- View all offices and services
- Manage properties, posts, and ads
- Monitor financial records
- Handle complaints and support
- Generate **statistics and reports**

### Supervisor Permissions

- **Manage offices and service providers**
  - Global (all regions)
  - Specific region
- **Manage finances and ads**
- **Manage user requests and posts**
- **Handle complaints and support**
- **Monitor system statistics**

### Admin / Manager

- Manage **supervisors**
- Oversee **financial operations**

---

## 🏗 Dashboards

The system provides **3 main web dashboards**:

1. **Admin & Supervisors Dashboard**

   - Manage supervisors and permissions
   - Handle financial operations and advertisements
   - Review and approve office and property requests
   - Manage complaints, notifications, and system statistics

2. **Broker / Office Manager Dashboard**

   - Add, update, and manage **properties** (for sale, rent, tourist places)
   - Track bookings, payments, and office statistics
   - Manage advertisements and respond to user requests
   - Request support or services and update office details

3. **Service Providers Dashboard**
   - Add and manage **service details** (e.g., maintenance, furnishing, cleaning)
   - Activate or deactivate services
   - Access **support center** for handling requests and issues

---

## 🔄 Mobile App Flow

### 1. User Registration & Authentication

- Users can **create a new account** with email and password.
- A **verification code** is sent to the email for confirmation.
- Users can **login** after verifying their email or continue as **guest users**.

### 2. Browsing & Interaction

- Browse **properties and tourist places**
- Compare **two properties or places** in terms of details
- Add **residential or tourist properties** to favorites
- Browse **service providers** if they offer services related to the property
- Create a **custom property request** by posting:
  - Desired **budget**
  - Preferred **location**
  - Additional **description/details**

### 3. Booking / Purchasing Residential Property

- User selects a property and makes a **reservation with a deposit**
- Payment can be **online** or **manual**, depending on the office configuration
- If **installments** are allowed, invoices are generated for each installment
- If paying **full amount**, a **single invoice** is created
- Property status updates after **last installment or full payment**

### 4. Notifications & Updates

- Users receive **real-time notifications** for bookings, payments, and property updates
- Users can mark notifications as **read/unread**

---

### 🏡 Booking & Rental Scenarios

#### 1. Buying a Residential Property

- User selects a **property for sale**.
- User can pay a **deposit** (online or manual, depending on office settings).
- If **installments** are supported:
  - System generates multiple invoices (based on installment count).
- If **full payment** is chosen:
  - A single purchase invoice is generated.
- Property status is updated after the **final payment** is completed.
- All invoices are available in the **Owned Properties** section.
- For online payments, the system generates a **PDF invoice** for the user.

#### 2. Renting a Residential Property

- User selects a **property for rent** (configured as **monthly** or **yearly** by the office).
- User specifies the **rental period** (number of months or years).
- A **deposit invoice** is generated.
- Additional invoices are created for each **rental month/year**.
- User can pay invoices **online or manually**, depending on the office settings.
- Invoices are displayed under the **Rented Properties** section.
- For online payments, a **PDF invoice** is automatically generated.

#### 3. Booking a Tourist Place

- User selects a **tourist place** and chooses a range of **consecutive days**.
- System generates two invoices:
  - **Deposit invoice**
  - **Rental invoice** for the selected days
- Payments can be processed online or manually.

---

### 🏢 Office Manager Dashboard

The **Office Manager Dashboard** provides real estate brokers with a complete control panel to manage their offices, properties, and bookings:

#### 📊 Dashboard Overview

- View **office information** and details.
- Track **number of properties** categorized by **rent, sale, or tourist places**.
- Monitor **warnings/violations** assigned to the office.
- View **financial earnings and statistics**.

#### 🏘️ Property & Tourist Place Management

- Add a **new property** with detailed information and upload property images.
  - The property is sent for **Admin review and approval** before being published.
- Add **new tourist places** with the same approval process.
- Filter and manage properties by:
  - **Status** (available, booked, sold, etc.)
  - **Province**
  - **Region**

#### 📅 Bookings & Invoices

- Track **property bookings** made by users.
- Upload **manual payment documents** if payment was not electronic.
- Manage **rental bookings** and upload supporting invoices for manual payments.
- For **tourist place bookings**:
  - View details per month.
  - Track booked vs. available days.
  - Access related **financial records**.

#### 📌 Requests & Ads

- Review **user requests** and suggest suitable properties based on their needs.
- Submit requests for **advertising campaigns** (image or promotional ads).
  - Ads require **Admin approval** before publishing.
  - Payments for ads can be processed electronically.

#### ⚙️ Office Settings & Notifications

- Update and manage **office profile details**.
- Access and manage **office notifications**.

---

## 🛠️ Admin & Supervisors Dashboard

### 🔹 Overview Dashboard

- Accessible only by the **Director (Admin)** or a **Supervisor** with **system monitoring permissions**
- Displays system-wide statistics:
  - Total **users**, **supervisors**, **brokers/offices**, and **service providers**
  - Total number of **properties** (for sale, for rent, tourist places)
  - Total number of **ads**
  - **Top-rated offices** and **top-rated service providers**

---

### 🔹 User Management (Director Only)

- Add new **supervisors**
- Assign or edit **permissions** for supervisors
- Delete supervisors if necessary

---

### 🔹 Financial Management

- Accessible by **Director** or **Supervisors** with **financial permissions**
- Manage and review:
  - **Advertisement requests** (image-based or promotional)
  - **Invoices** related to advertisements
- Approve or reject **ad requests** submitted by offices

---

### 🔹 Office & Service Providers Management

- Accessible by **Director** or **Supervisors** with **broker management permissions**
- Manage **offices** and their submitted content:
  - Review and approve/reject **new property posts** submitted by offices
  - View all **offices** with their related properties
- Manage **service providers**:
  - View all service providers and their active/inactive services
- Review **user property requests** (posts created by users requesting properties with budget, location, and details)

---

### 🔹 Notification Center

- Accessible by **Director** or **Supervisors** with **system monitoring permissions**
- View all system notifications
- Send new notifications to users, offices, or service providers

---

### 🔹 Complaints Management

- Accessible by **Director** or **Supervisors** with **complaints management permissions**
- Review complaints submitted by users against offices
  - View complaint details (office, user, reason)
  - Approve or reject the complaint
  - If approved, the office receives a **warning** (appears in the office dashboard)

---

### 🔹 Support Center

- Platform-wide **Q&A management**
- Add or edit **questions and answers** related to platform usage
- Provide support resources for users, offices, and service providers

---
## Video 📽️

Check out the project promo here: [https://www.facebook.com/share/v/1EnyAFU64N/](https://www.facebook.com/share/v/1EnyAFU64N/).

---
## UI Design 🎨

You can see the UI on Figma also: [https://www.figma.com/design/i8O1XfwFww6YLYuiNFRrVy/Project-1---Property-MS?node-id=0-1&t=P0NlvhvVdN1xohY4-1](https://www.figma.com/design/i8O1XfwFww6YLYuiNFRrVy/Project-1---Property-MS?node-id=0-1&t=P0NlvhvVdN1xohY4-1).

## 🛠 Tech Stack

- **Framework**: [Flutter](https://flutter.dev/)
- **Language**: [Dart](https://dart.dev/)
- **State Management**: GetX
- **Backend API**: NestJS PMS Backend (REST API)
- **Database (Local)**: PostgreSQL / Secure Storage / Shared Preferences
- **Authentication**: JWT
- **Payments**: Stripe SDK + manual uploads
- **Notifications**: Firebase Cloud Messaging (FCM)
- **Maps & Location**: openstreetmap.com

---

## 📋 Requirements

Make sure you are using the same versions to avoid compatibility issues:

- **Flutter SDK**: 3.32.2
- **Dart SDK**: 3.8.1
- **Android Studio / Xcode**: latest stable
- **Android**: minSdk 21, targetSdk 34, compileSdk 34
- **Android SDK**: 34
- **Java**: 17 
- **Kotlin**: 2.0.21 
- **Gradle**: 8.12

---

## ⚙ Installation & Setup

```bash
# Clone the repository
git clone https://github.com/NGPTechWorld/Property-Management-System-Mobile.git

# Navigate into the project
cd Property-Management-System-Mobile

# Install dependencies
flutter pub get

# Run the application
flutter run
```
## Contributors 👥
Thanks to all the amazing people who contributed to this project:

[![Mohamad Ali Alnuaimi](https://img.shields.io/badge/Mohamad_Ali_Alnuaimi-Flutter_&_UI-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://github.com/NGPTechWorld)

[![Osama Zerkawi](https://img.shields.io/badge/Osama_Zerkawi-Flutter_&_UI-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://github.com/OsamaZerkawi)

[![Kareem Bizreh](https://img.shields.io/badge/Kareem_Bizreh-React-61DAFB?style=for-the-badge&logo=react&logoColor=white)](https://github.com/Kareem-Bizreh)

[![Hasan Zaeter](https://img.shields.io/badge/Hasan_Zaeter-NestJS-E0234E?style=for-the-badge&logo=nestjs&logoColor=white)](https://github.com/HasanZaeter)

[![OnlyAbdullh](https://img.shields.io/badge/Only_Abdullh-NestJS-E0234E?style=for-the-badge&logo=nestjs&logoColor=white)](https://github.com/OnlyAbdullh)

## License 📜

This project is licensed under the **MIT License**.
