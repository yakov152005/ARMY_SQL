CREATE TABLE IF NOT EXISTS BATCHES
(
    t_id     INT            NOT NULL,
    batch_id    INT AUTO_INCREMENT PRIMARY KEY,
    c_id     INT            NOT NULL,
    target_x DECIMAL(10, 2) NOT NULL,
    target_y DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (t_id) REFERENCES Training(training_id),
    FOREIGN KEY (c_id) REFERENCES Cannons(cannon_id)
);

INSERT INTO BATCHES (t_id, c_id, target_x, target_y)
VALUES
    (1, 1, 5.4, 2.6),
    (2, 2, 4.1, 3.2),
    (3, 3, 2.2, 4.4),
    (4, 4, 3.5, 5.5),
    (5, 5, 1.4, 0.9),
    (6, 6, 6.0, 1.1)
;


