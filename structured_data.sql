-- Create the structured_data table
CREATE TABLE structured_data (
    user_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    date DATE NOT NULL,
    score REAL NOT NULL
);

-- Insert data into the structured_data table
INSERT INTO structured_data (user_id, name, email, date, score) VALUES
(1, 'User_1', 'user1@example.com', '2025-01-01', 52.5),
(2, 'User_2', 'user2@example.com', '2025-01-02', 55.0),
(3, 'User_3', 'user3@example.com', '2025-01-03', 57.5),
(4, 'User_4', 'user4@example.com', '2025-01-04', 60.0),
(5, 'User_5', 'user5@example.com', '2025-01-05', 62.5),
(6, 'User_6', 'user6@example.com', '2025-01-06', 65.0),
(7, 'User_7', 'user7@example.com', '2025-01-07', 67.5),
(8, 'User_8', 'user8@example.com', '2025-01-08', 70.0),
(9, 'User_9', 'user9@example.com', '2025-01-09', 72.5),
(10, 'User_10', 'user10@example.com', '2025-01-10', 75.0),
(11, 'User_11', 'user11@example.com', '2025-01-11', 77.5),
(12, 'User_12', 'user12@example.com', '2025-01-12', 80.0),
(13, 'User_13', 'user13@example.com', '2025-01-13', 82.5),
(14, 'User_14', 'user14@example.com', '2025-01-14', 85.0),
(15, 'User_15', 'user15@example.com', '2025-01-15', 87.5),
(16, 'User_16', 'user16@example.com', '2025-01-16', 90.0),
(17, 'User_17', 'user17@example.com', '2025-01-17', 92.5),
(18, 'User_18', 'user18@example.com', '2025-01-18', 95.0),
(19, 'User_19', 'user19@example.com', '2025-01-19', 97.5),
(20, 'User_20', 'user20@example.com', '2025-01-20', 100.0);
