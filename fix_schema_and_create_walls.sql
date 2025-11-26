-- 1. Ensure locations uses InnoDB and correct charset (Global Table Settings)
ALTER TABLE locations ENGINE=InnoDB;
ALTER TABLE locations CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 2. Ensure the ID column matches exactly (Column Specific Settings)
-- This is critical: Foreign Keys require EXACT match in Type, Charset, and Collation
ALTER TABLE locations MODIFY id VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;

-- 3. Create the table WITHOUT the foreign key first
-- This ensures the table can be created even if the constraint fails
CREATE TABLE IF NOT EXISTS destructible_walls (
    id INT AUTO_INCREMENT PRIMARY KEY,
    location_id VARCHAR(50) NOT NULL,
    wall_id VARCHAR(50) NOT NULL,
    x DECIMAL(5,2) NOT NULL DEFAULT 0,
    y DECIMAL(5,2) NOT NULL DEFAULT 0,
    width DECIMAL(5,2) NOT NULL DEFAULT 10,
    height DECIMAL(5,2) NOT NULL DEFAULT 20,
    image VARCHAR(255),
    required_item VARCHAR(50) DEFAULT 'gun',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_location (location_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 4. Add the foreign key constraint separately
-- If this fails, you will get a specific error, but the table will exist
ALTER TABLE destructible_walls
ADD CONSTRAINT fk_destructible_walls_location
FOREIGN KEY (location_id) REFERENCES locations(id) ON DELETE CASCADE;
