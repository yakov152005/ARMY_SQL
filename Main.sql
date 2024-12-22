-- סעיף 1
SELECT *
FROM TRAINING;
SELECT *
FROM CANNONS;
SELECT *
FROM BATCHES;
SELECT *
FROM SHOTS;

-- --------------------------------------------------------------------------------------------------
-- סעיף 2
ALTER TABLE TRAINING
    ADD open_training ENUM ('yes', 'no') NOT NULL DEFAULT 'no';

-- --------------------------------------------------------------------------------------------------
-- סעיף 3
INSERT INTO TRAINING(training_date, base)
VALUES ('2021-12-25 01:00:00', 'Shvita');

UPDATE TRAINING
SET training.open_training = 'yes'
WHERE base = 'Shvita';

-- --------------------------------------------------------------------------------------------------
-- סעיף 4
INSERT INTO SHOTS(t_id, b_id, shot_x, shot_y)
VALUES (1, 2, 1.1, 1.1),
       (5, 1, 2.8, 4.4),
       (2, 4, 3.1, 3.1);

SELECT shots.t_id, shots.b_id, shots.shot_number_id
FROM shots
WHERE shot_x = shot_y;

-- --------------------------------------------------------------------------------------------------

-- סעיף 5
SELECT shots.t_id, COUNT(shots.shot_number_id) AS total_shots
FROM shots
GROUP BY shots.t_id
ORDER BY total_shots DESC;

-- --------------------------------------------------------------------------------------------------

-- סעיף 6
INSERT INTO BATCHES(t_id, c_id, target_x, target_y)
VALUES (3, 3, 2.2, 3.3),
       (2, 1, 1.2, 1.3);

INSERT INTO SHOTS(t_id, b_id, shot_x, shot_y)
VALUES (3, 1, 2.2, 3.3),
       (2, 8, 1.2, 1.3);


SELECT shots.shot_number_id AS on_the_target
FROM shots
         JOIN batches
              ON shots.t_id = batches.t_id
                  AND shots.b_id = batch_id
                  AND shot_x = batches.target_x
                  AND shot_y = batches.target_y;

-- --------------------------------------------------------------------------------------------------
-- סעיף 7

INSERT INTO BATCHES(t_id, c_id, target_x, target_y)
VALUES (5, 1, 7.7, 1.3);

INSERT INTO SHOTS(t_id, b_id, shot_x, shot_y)
VALUES (5, 9, 7.7, 1.3);

-- דרך ראשונה
SELECT training.base, shots.shot_number_id AS on_the_target
FROM shots,
     batches,
     training
WHERE shots.t_id = batches.t_id
  AND shots.b_id = batch_id
  AND shots.t_id = training_id
  AND shot_x = batches.target_x
  AND shot_y = batches.target_y;

-- דרך שניה
SELECT training.base, shots.shot_number_id AS on_the_target
FROM shots
         JOIN batches
              ON shots.t_id = batches.t_id
                  AND shots.b_id = batch_id
         JOIN training
WHERE shots.t_id = training_id
  AND shot_x = batches.target_x
  AND shot_y = batches.target_y;

-- --------------------------------------------------------------------------------------------------
-- סעיף 8
INSERT INTO BATCHES(t_id, c_id, target_x, target_y)
VALUES (5, 3, 1.3, 1.4);
INSERT INTO SHOTS(t_id, b_id, shot_x, shot_y)
VALUES (5, 10, 1.1, 4.2);


SELECT training.training_id,
       training.base,
       COUNT(IF(
               shots.shot_x = batches.target_x
                   AND shots.shot_y = batches.target_y
                   AND shots.b_id = batches.batch_id
                   AND shots.t_id = batches.t_id, 1, NULL)) * 100.0 / COUNT(*) AS success_rate
FROM shots
         JOIN
     batches ON shots.b_id = batches.batch_id
         AND shots.t_id = batches.t_id
         JOIN
     training ON shots.t_id = training.training_id
GROUP BY training.training_id, training.base;

-- --------------------------------------------------------------------------------------------------
-- סעיף 9

DELIMITER $$

CREATE PROCEDURE GetCannonUsage(IN cannonId INT, OUT trainingCount INT, OUT cannonName VARCHAR(255))
BEGIN
    SELECT COUNT(DISTINCT t_id) INTO trainingCount
    FROM batches
    WHERE c_id = cannonId;

    SELECT producer
    INTO cannonName
    FROM cannons
    WHERE cannon_id = cannonId;
END $$

DELIMITER ;

CALL GetCannonUsage(1, @trainingCount,@cannonName);
SELECT @cannonName,@trainingCount AS TrainingCount;




