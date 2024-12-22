CREATE TABLE IF NOT EXISTS TRAINING(
    training_id INT AUTO_INCREMENT PRIMARY KEY,
    training_date DATETIME NOT NULL,
    base VARCHAR(255) NOT NULL
);

INSERT INTO TRAINING (training_date, base)
VALUES
    ('2023-12-20 10:00:00', 'Alpha'),
    ('2023-12-21 11:30:00', 'Bravo'),
    ('2023-12-23 08:45:00', 'Delta'),
    ('2023-12-24 13:15:00', 'Echo'),
    ('2023-12-22 14:00:00', 'Charlie'),
    ('2023-12-25 09:00:00', 'Foxtrot')
;
