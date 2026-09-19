-- ============================================================
-- COLLEGE EVENT ANALYTICS SYSTEM
-- Database Schema
-- ============================================================

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    department VARCHAR(50),
    year INT,
    section VARCHAR(10),
    city VARCHAR(100)
);

CREATE TABLE events (
    event_id INT PRIMARY KEY,
    event_name VARCHAR(150),
    event_type VARCHAR(50),
    department VARCHAR(50),
    event_date DATE,
    venue VARCHAR(100),
    capacity INT,
    registration_fee DECIMAL(10,2),
    status VARCHAR(30)
);

CREATE TABLE registrations (
    registration_id INT PRIMARY KEY,
    event_id INT,
    student_id INT,
    registration_date DATE,
    registration_status VARCHAR(30),

    FOREIGN KEY (event_id)
        REFERENCES events(event_id),

    FOREIGN KEY (student_id)
        REFERENCES students(student_id)
);

CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY,
    event_id INT,
    student_id INT,
    check_in_time DATETIME,
    attendance_status VARCHAR(30),

    FOREIGN KEY (event_id)
        REFERENCES events(event_id),

    FOREIGN KEY (student_id)
        REFERENCES students(student_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    registration_id INT,
    amount DECIMAL(10,2),
    payment_date DATE,
    payment_method VARCHAR(30),
    payment_status VARCHAR(30),

    FOREIGN KEY (registration_id)
        REFERENCES registrations(registration_id)
);

CREATE TABLE feedback (
    feedback_id INT PRIMARY KEY,
    event_id INT,
    student_id INT,
    overall_rating INT,
    content_rating INT,
    organization_rating INT,
    feedback_comment VARCHAR(500),
    feedback_date DATE,

    FOREIGN KEY (event_id)
        REFERENCES events(event_id),

    FOREIGN KEY (student_id)
        REFERENCES students(student_id)
);

CREATE TABLE certificates (
    certificate_id INT PRIMARY KEY,
    event_id INT,
    student_id INT,
    certificate_type VARCHAR(50),
    issue_date DATE,

    FOREIGN KEY (event_id)
        REFERENCES events(event_id),

    FOREIGN KEY (student_id)
        REFERENCES students(student_id)
);
