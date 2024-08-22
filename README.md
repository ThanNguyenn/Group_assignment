# Group Assignment

## Group Details
- **Group Name**: SWP Incoming
- **Project Subject**: Cosmetics Store
- **Group Members**:
  - Nguyễn Trí Hoàng Thân - SE183895
  - Vũ Đức Mạnh - SE184935
  - Trần Trung Nguyên - SE184993

## 1. GUI

### UI Screenshots
![Login Page](/images/Login.png)  
![Create User Page](/images/CreateUser.png)
![Main Page 1](/images/Main_Page_1.png)  
![Main Page 2](/images/Main_Page_2.png)  
![Product Detail](/images/Product_Detail.png)  
![Checkout Page](/images/Checkout.png)
![User Manager Page](/images/UserManager.png)
![Product Manager Page](/images/ProductManager.png)
![Order Manager Page](/images/OrderManager.png)
![Add Order Page](/images/AddOrder.png)

### Sitemap
![Sitemap](/images/Sitemap.png)

## 2. Database Model
![Database](/images/DB_Model.png)

## 3. System Design

### MVC2 Architecture in a Cosmetic Sales System

#### a. Model
- **Product**: Represents cosmetic products, including attributes such as product name, price, description, ingredients, and product category.
- **User**: Represents customers and administrators, including attributes such as name, email address, password, and purchase history.
- **Order**: Represents sales transactions, including information about products, quantities, prices, and order status.
- **Inventory**: Manages the quantity of products available in stock.

#### b. View
The View is the user interface part of the system. It displays data from the Model to the user and sends user interactions back to the Controller. Views in a cosmetic sales system might include webpages or mobile app screens, such as:

- **Product Listing Page**: Displays all available products.
- **Product Detail Page**: Shows detailed information about a product when a user selects a specific item.
- **Shopping Cart**: Displays the products that the user has selected to purchase.
- **Checkout Page**: Handles payment and shipping information.

#### c. Controller
The Controller acts as an intermediary between the Model and the View. It receives requests from the user via the View, processes these requests by interacting with the Model, and finally returns the results to the View. Functions of the Controller in a cosmetic sales system may include:

- **User Management**: Handles user registration, login, and account information management.
- **Product Management**: Adds, edits, deletes products, and updates product information in the database.
- **Order Processing**: Manages order placement, payment processing, and updating order status.

### Application Deployment Process
To deploy a cosmetic sales system, the following steps are necessary:

#### a. Database Design
Design the database to align with the classes in the Model. Use a database management system such as MySQL or PostgreSQL to store information about products, users, orders, and inventory.

#### b. API and Backend Development
Develop APIs to facilitate communication between the frontend and backend using programming languages such as Java, Python, or Node.js. The backend will handle business logic, interact with the database, and return results to the frontend.

#### c. Frontend Development
Develop the user interface using technologies like HTML, CSS, JavaScript, and frameworks such as React or Angular. The frontend will display data from the backend and send user requests to the backend.

#### d. Testing and Security
Test the application to ensure all functions work as expected. Ensure the security of user data, particularly payment information and personal details.

## 4. Conclusion and Discussion

### 1. The Pros and Cons of Our Application

#### The Pros:
- The application provides an intuitive and user-friendly interface, making it easy for buyers to select products.
- Users can search for and filter products based on name or product type.
- The application offers a wide variety of cosmetic products tailored to the needs and preferences of consumers.

#### The Cons:
- The application is still somewhat basic.
- It currently does not support uploading product images by users.
- Features like login via Gmail or Facebook are not yet available.

### 2. What We’ve Learned During the Development of Our Application
- Understanding how to create a simple application.
- Teamwork.
- Solving issues that we encountered.

### 3. What We Would Improve in Our Application in the Future
- Expanding the product range to include more brands and categories will attract a wider customer base.
- Improving the interface and adding necessary functions.
