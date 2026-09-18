-- ============================================================
-- E-Commerce Business Analytics System
-- Database Schema
-- ============================================================

-- =========================
-- 1. CUSTOMERS
-- =========================

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(150),
    city VARCHAR(100),
    state VARCHAR(100),
    region VARCHAR(50),
    signup_date DATE,
    customer_segment VARCHAR(50)
);


-- =========================
-- 2. PRODUCTS
-- =========================

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(150),
    category VARCHAR(100),
    subcategory VARCHAR(100),
    cost_price DECIMAL(10,2),
    selling_price DECIMAL(10,2)
);


-- =========================
-- 3. ORDERS
-- =========================

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    payment_method VARCHAR(50),
    order_status VARCHAR(50),

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);


-- =========================
-- 4. ORDER ITEMS
-- =========================

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    discount_percent DECIMAL(5,2),

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);


-- =========================
-- 5. PAYMENTS
-- =========================

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    amount DECIMAL(12,2),
    payment_status VARCHAR(50),

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);
