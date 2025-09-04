-- Drop the table if needed (optional)
DROP TABLE IF EXISTS users;

-- Create the table with IDENTITY
CREATE TABLE users (
    id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(50) NOT NULL
);

-- Now you can insert without specifying id
INSERT INTO users(username)
VALUES
('monahan93'),
('pferrer'),
('si93omis'),
('99stroman');
