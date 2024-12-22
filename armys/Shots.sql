CREATE TABLE IF NOT EXISTS SHOTS
(
    t_id           INT           NOT NULL,
    b_id           INT           NOT NULL,
    shot_number_id INT AUTO_INCREMENT PRIMARY KEY,
    shot_x         DECIMAL(10, 2) NOT NULL,
    shot_y         DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (t_id) REFERENCES Training(training_id),
    FOREIGN KEY (b_id) REFERENCES Batches(batch_id)
);

INSERT INTO SHOTS (t_id, b_id, shot_x, shot_y)
VALUES
    (3, 2, 5.5, 2.7),
    (4, 3, 4.0, 3.1),
    (2, 1, 2.1, 4.3),
    (1, 5, 3.6, 5.6),
    (6, 6, 1.5, 1.0),
    (5, 4, 6.1, 1.2)
;

