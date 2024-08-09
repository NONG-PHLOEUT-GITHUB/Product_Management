-- Create Users Table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    role ENUM('admin', 'customer', 'employee') NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create Categories Table
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create Products Table
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    category_id INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Create Orders Table
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    total_amount DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'shipped', 'delivered', 'cancelled') NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Create Order_Items Table
CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Create Inventory Movements Table
CREATE TABLE inventory_movements (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    movement_type ENUM('in', 'out') NOT NULL,
    quantity INT NOT NULL,
    description TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Create Product Images Table
CREATE TABLE product_images (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    image_path VARCHAR(255) NOT NULL,
    alt_text VARCHAR(255),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Create Suppliers Table
CREATE TABLE suppliers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    contact_info TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create Customer Reviews Table
CREATE TABLE customer_reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    user_id INT,
    rating INT NOT NULL,
    review TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Create Audit Logs Table
CREATE TABLE audit_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    action VARCHAR(255) NOT NULL,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Sample Data Insertion

-- Insert into Users
INSERT INTO users (username, password, email, role)
VALUES 
('admin_user', 'hashed_password', 'admin@example.com', 'admin'),
('customer_user', 'hashed_password', 'customer@example.com', 'customer'),
('employee_user', 'hashed_password', 'employee@example.com', 'employee');

-- Insert into Categories
INSERT INTO categories (name, description)
VALUES 
('Electronics', 'Devices and gadgets'),
('Books', 'Printed and digital books'),
('Clothing', 'Men, Women, and Kids clothing');

-- Insert into Products
INSERT INTO products (name, description, price, stock_quantity, category_id)
VALUES 
('Smartphone', 'Latest model with high-end features', 599.99, 50, 1),
('Laptop', 'Powerful laptop for professionals', 899.99, 30, 1),
('Novel', 'Bestselling novel', 19.99, 100, 2),
('T-shirt', 'Cotton T-shirt in various sizes', 9.99, 200, 3);

-- Insert into Orders
INSERT INTO orders (user_id, total_amount, status)
VALUES 
(2, 629.98, 'pending'),
(2, 19.99, 'delivered');

-- Insert into Order_Items
INSERT INTO order_items (order_id, product_id, quantity, unit_price, total_price)
VALUES 
(1, 1, 1, 599.99, 599.99),
(1, 4, 3, 9.99, 29.97),
(2, 3, 1, 19.99, 19.99);

-- Insert into Inventory Movements
INSERT INTO inventory_movements (product_id, movement_type, quantity, description)
VALUES 
(1, 'in', 100, 'Initial stock'),
(1, 'out', 1, 'Order #1'),
(3, 'in', 200, 'Initial stock'),
(3, 'out', 1, 'Order #2');

-- Insert into Product Images
INSERT INTO product_images (product_id, image_path, alt_text)
VALUES 
(1, 'images/smartphone.jpg', 'Smartphone image'),
(2, 'images/laptop.jpg', 'Laptop image'),
(3, 'images/novel.jpg', 'Novel image');

-- Insert into Suppliers
INSERT INTO suppliers (name, contact_info)
VALUES 
('Tech Supplies Inc.', '1234 Tech Lane, Silicon Valley, CA'),
('Book Distributors Ltd.', '5678 Book St., New York, NY'),
('Fashion Co.', '910 Fashion Ave, Los Angeles, CA');

-- Insert into Customer Reviews
INSERT INTO customer_reviews (product_id, user_id, rating, review)
VALUES 
(1, 2, 5, 'Amazing smartphone!'),
(3, 2, 4, 'Great read, but a bit slow in the middle.');

-- Insert into Audit Logs
INSERT INTO audit_logs (user_id, action)
VALUES 
(1, 'Created product Smartphone'),
(2, 'Placed order #1'),
(2, 'Placed order #2');
