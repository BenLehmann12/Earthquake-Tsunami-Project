-- ============================================
-- DATA QUALITY & EXPLORATION
-- ============================================
SELECT 
    COUNT(*) as total_earthquakes,
    MIN(year) as earliest_year,
    MAX(year) as latest_year,
    COUNT(DISTINCT year) as years_covered
FROM earthquake_data;

SELECT 
    COUNT(*) - COUNT(cdi) as missing_cdi,
    COUNT(*) - COUNT(mmi) as missing_mmi,
    COUNT(*) - COUNT(nst) as missing_nst,
    COUNT(*) - COUNT(dmin) as missing_dmin,
    COUNT(*) - COUNT(gap) as missing_gap
FROM earthquake_data;

SELECT 
    MIN(magnitude) as min_magnitude,
    MAX(magnitude) as max_magnitude,
    MIN(depth) as min_depth,
    MAX(depth) as max_depth,
    MIN(latitude) as southernmost,
    MAX(latitude) as northernmost,
    MIN(longitude) as westernmost,
    MAX(longitude) as easternmost
FROM earthquake_data;