-- Create the table
CREATE TABLE ExportColumnDemo (
    ProductID INT NULL,
    ProductName NVARCHAR(50) NULL,
    Description NVARCHAR(50) NULL,
    FilePath NVARCHAR(255) NULL
);

-- Insert values
INSERT INTO ExportColumnDemo (ProductID, ProductName, Description, FilePath)
VALUES
    (1, 'Printer', 'Complete Printer Description', NULL),
    (2, 'Router', 'Complete Router Description', NULL),
    (3, 'Switch', 'Complete Switch Description', NULL),
    (4, 'Notebook Fan', 'Complete Notebook Fan Description', NULL);
	-- Update FilePath for existing rows
UPDATE ExportColumnDemo
SET FilePath = 'C:\sc_KaraboTsaoane_2025\DatabaseAdministration\SSIS-Packages\Outputs\ProductDescriptions\' + ProductName + '.txt';
