-- Create a new table called '[user]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[order]', 'U') IS NOT NULL
DROP TABLE [dbo].[order]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[order]
(
    [guid] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT newid(),
    [user_guid] UNIQUEIDENTIFIER NOT NULL DEFAULT newid(),
    [product_guid] UNIQUEIDENTIFIER NOT NULL DEFAULT newid(),
    [quantity] INT NULL,
    [_deleted] BIT NOT NULL DEFAULT 0,
    [date_created] DATETIME2 NOT NULL DEFAULT(getdate()),
    [created_by] UNIQUEIDENTIFIER NULL,
    [created_by_ip] VARCHAR(20),
    [date_modified] DATETIME2 NULL,
    [modified_by] UNIQUEIDENTIFIER,
    [modified_by_ip] VARCHAR(20)
);
GO

-- FOREIGN KEY RELATIONSHIP TABLE of user and order
ALTER TABLE [dbo].[order]
  -- NAME OF THE FK RELATIONSHIP & ORDER user_guid as local field
   ADD CONSTRAINT FK_order_user FOREIGN KEY ([user_guid])
   -- REFERENCE TABLE user and guid
      REFERENCES [dbo].[user] ([guid])
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
      
;

-- FOREIGN KEY RELATIONSHIP TABLE product and order
ALTER TABLE [dbo].[order]
  -- NAME OF THE FK RELATIONSHIP & ORDER user_guid as local field
   ADD CONSTRAINT FK_order_product FOREIGN KEY ([product_guid])
   -- REFERENCE TABLE user and guid
      REFERENCES [dbo].[product] ([guid])
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;


-- INSERT EXISTING DATA FROM user table
INSERT INTO [dbo].[order] (user_guid, product_guid, quantity)
VALUES('8885129a-76d7-4a44-936b-5b6f42942da5', 'b49050a6-c0e7-40fb-bda2-869687ef1bac', 100)
GO

-- CALL DATA TABLE
SELECT * FROM [order]
SELECT * FROM [user]
SELECT * FROM [product]

-- dropping foreign key
USE DatabaseProjectTesting
GO
ALTER TABLE [dbo].[order]
DROP CONSTRAINT FK_1
GO

-- DETAILED DATA OF TABLE
USE [DatabaseProjectTesting]
GO
EXEC sp_help 'dbo.user';
GO