-- ============================================
-- DESCRIPTIVE STATISTICS
-- ============================================

-- 2.1 Magnitude Statistics
SELECT 
    ROUND(AVG(magnitude), 2) as avg_magnitude,
    ROUND(STDDEV(magnitude), 2) as stddev_magnitude,
    ROUND(VARIANCE(magnitude), 2) as variance_magnitude,
    MIN(magnitude) as min_magnitude,
    MAX(magnitude) as max_magnitude,
    COUNT(*) as total_count
FROM earthquake_data;

-- 2.2 Depth Statistics
SELECT 
    ROUND(AVG(depth), 2) as avg_depth,
    ROUND(STDDEV(depth), 2) as stddev_depth,
    MIN(depth) as min_depth,
    MAX(depth) as max_depth,
    SUM(CASE WHEN depth < 70 THEN 1 ELSE 0 END) as shallow_earthquakes,
    SUM(CASE WHEN depth BETWEEN 70 AND 300 THEN 1 ELSE 0 END) as intermediate_earthquakes,
    SUM(CASE WHEN depth > 300 THEN 1 ELSE 0 END) as deep_earthquakes
FROM earthquake_data;

-- 2.3 Tsunami Statistics
SELECT 
    tsunami,
    COUNT(*) as count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM earthquake_data), 2) as percentage,
    ROUND(AVG(magnitude), 2) as avg_magnitude,
    ROUND(AVG(depth), 2) as avg_depth
FROM earthquake_data
GROUP BY tsunami;