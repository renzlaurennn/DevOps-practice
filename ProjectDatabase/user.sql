-- Create a new table called '[user]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[user]', 'U') IS NOT NULL
DROP TABLE [dbo].[user]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[user]
(
    [guid] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT newid(),
    [first_name] NVARCHAR(100) NULL,
    [last_name] NVARCHAR(100) NULL,
    [_deleted] BIT NOT NULL DEFAULT 0,
    [date_created] DATETIME2 NOT NULL DEFAULT(getdate()),
    [created_by] UNIQUEIDENTIFIER NULL,
    [created_by_ip] VARCHAR(20),
    [date_modified] DATETIME2 NULL,
    [modified_by] UNIQUEIDENTIFIER,
    [modified_by_ip] VARCHAR(20)
);
GO

-- =============================

INSERT INTO [dbo].[user] (first_name, last_name)
VALUES ('Lorenz', 'Laurenciano')

INSERT INTO [dbo].[user] (first_name, last_name)
VALUES ('Juan', 'DelaCruz')
GO

SELECT * FROM [user]

DELETE FROM [user] WHERE [first_name]='Juan'
 