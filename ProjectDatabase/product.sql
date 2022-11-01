-- Create a new table called '[user]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[product]', 'U') IS NOT NULL
DROP TABLE [dbo].[product]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[product]
(
    [guid] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT newid(),
    [name] NVARCHAR(400) NULL,
    [description] NVARCHAR(max) NULL,
    [price] FLOAT NULL,
    [date_created] DATETIME2 NOT NULL DEFAULT(getdate()),
    [created_by] UNIQUEIDENTIFIER NULL,
    [created_by_ip] VARCHAR(20),
    [date_modified] DATETIME2 NULL,
    [modified_by] UNIQUEIDENTIFIER,
    [modified_by_ip] VARCHAR(20),
    [_deleted] BIT NOT NULL DEFAULT 0
);
GO


INSERT INTO [dbo].[product] ([name], [description], price)
VALUES ('Cheesecake', 'masarap daw na cheesecake', '150.00')
GO

SELECT * FROM product
