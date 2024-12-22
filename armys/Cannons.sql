CREATE TABLE IF NOT EXISTS CANNONS(
    cannon_id INT AUTO_INCREMENT PRIMARY KEY,
    producer VARCHAR(255) NOT NULL
);

INSERT INTO CANNONS (producer)
VALUES
    ('CannonCorp'),
    ('BigGuns Inc.'),
    ('Firepower Ltd.'),
    ('ArtilleryWorks'),
    ('HeavyMetal Guns'),
    ('Precision Cannons')
;

