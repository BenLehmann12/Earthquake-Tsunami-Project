CREATE TABLE earthquake_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    magnitude DECIMAL(3,1) NOT NULL,
    cdi INT,
    mmi INT,
    sig INT,
    nst INT,
    dmin DECIMAL(10,6),
    gap DECIMAL(10,3),
    depth DECIMAL(10,3),
    latitude DECIMAL(10,6),
    longitude DECIMAL(10,6),
    year INT NOT NULL,
    month INT NOT NULL,
    tsunami TINYINT(1) NOT NULL,
    INDEX idx_magnitude (magnitude),
    INDEX idx_year (year),
    INDEX idx_tsunami (tsunami),
    INDEX idx_year_month (year, month)
);

-- Ran the Code, then removed my file path
LOAD DATA INFILE ""
INTO TABLE earthquake_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(magnitude, cdi, mmi, sig, nst, dmin, gap, depth, latitude, longitude, year, month, tsunami);
