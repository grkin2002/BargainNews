
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 05/03/2011 13:35:37
-- Generated from EDMX file: D:\My Documents\Visual Studio 2010\Projects\HaoPianYiMvc2\HaoPianYiMvc2\Models\HaoPianYiEntities.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [grkin20029947];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_CategoryFlyer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FlyerSet] DROP CONSTRAINT [FK_CategoryFlyer];
GO
IF OBJECT_ID(N'[dbo].[FK_FlyerReview]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ReviewSet] DROP CONSTRAINT [FK_FlyerReview];
GO
IF OBJECT_ID(N'[dbo].[FK_FlyerPromote]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FlyerSet] DROP CONSTRAINT [FK_FlyerPromote];
GO
IF OBJECT_ID(N'[dbo].[FK_FlyerMerchant]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FlyerSet] DROP CONSTRAINT [FK_FlyerMerchant];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[BookMarkSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BookMarkSet];
GO
IF OBJECT_ID(N'[dbo].[CategorySet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CategorySet];
GO
IF OBJECT_ID(N'[dbo].[ReviewSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ReviewSet];
GO
IF OBJECT_ID(N'[dbo].[FlyerSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FlyerSet];
GO
IF OBJECT_ID(N'[dbo].[PromoteSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PromoteSet];
GO
IF OBJECT_ID(N'[dbo].[MerchantSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MerchantSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'BookMarkSet'
CREATE TABLE [dbo].[BookMarkSet] (
    [UserId] uniqueidentifier  NOT NULL,
    [FlyerId] bigint  NOT NULL,
    [CreateDate] datetime  NOT NULL,
    [Id] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'CategorySet'
CREATE TABLE [dbo].[CategorySet] (
    [CategoryId] int IDENTITY(1,1) NOT NULL,
    [CategoryName] nvarchar(200)  NOT NULL,
    [Description] nvarchar(2000)  NULL
);
GO

-- Creating table 'ReviewSet'
CREATE TABLE [dbo].[ReviewSet] (
    [ReviewId] int IDENTITY(1,1) NOT NULL,
    [FlyerId] bigint  NOT NULL,
    [UserID] uniqueidentifier  NOT NULL,
    [ReviewDate] datetime  NOT NULL,
    [Content] nvarchar(4000)  NOT NULL,
    [Flyer_flyerId] bigint  NOT NULL
);
GO

-- Creating table 'FlyerSet'
CREATE TABLE [dbo].[FlyerSet] (
    [flyerId] bigint IDENTITY(1,1) NOT NULL,
    [Type] smallint  NOT NULL,
    [PromoteId] int  NOT NULL,
    [MerchantId] int  NOT NULL,
    [Title] nvarchar(400)  NOT NULL,
    [HistoryId] bigint  NULL,
    [CreateDate] datetime  NOT NULL,
    [PostedBy] uniqueidentifier  NOT NULL,
    [ExpireDate] datetime  NOT NULL,
    [Price] decimal(18,0)  NULL,
    [Discount] smallint  NULL,
    [Description] nvarchar(4000)  NOT NULL,
    [CategoryId] int  NOT NULL,
    [SendUrl] nvarchar(1000)  NOT NULL,
    [ClickCount] int  NULL,
    [ViewCount] int  NULL,
    [Status] smallint  NOT NULL,
    [ImgUrl] nvarchar(1000)  NULL,
    [Valid] bit  NOT NULL,
    [Categories_CategoryId] int  NULL,
    [Merchants_MerchantId] int  NOT NULL,
    [Promotes_PromoteId] int  NOT NULL
);
GO

-- Creating table 'PromoteSet'
CREATE TABLE [dbo].[PromoteSet] (
    [PromoteId] int IDENTITY(1,1) NOT NULL,
    [PromoteCode] nvarchar(200)  NOT NULL,
    [PromoteDescription] nvarchar(max)  NOT NULL,
    [URL] nvarchar(1000)  NOT NULL
);
GO

-- Creating table 'MerchantSet'
CREATE TABLE [dbo].[MerchantSet] (
    [MerchantId] int IDENTITY(1,1) NOT NULL,
    [MerchantName] nvarchar(200)  NOT NULL,
    [MerchantData] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'BookMarkSet'
ALTER TABLE [dbo].[BookMarkSet]
ADD CONSTRAINT [PK_BookMarkSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [CategoryId] in table 'CategorySet'
ALTER TABLE [dbo].[CategorySet]
ADD CONSTRAINT [PK_CategorySet]
    PRIMARY KEY CLUSTERED ([CategoryId] ASC);
GO

-- Creating primary key on [ReviewId] in table 'ReviewSet'
ALTER TABLE [dbo].[ReviewSet]
ADD CONSTRAINT [PK_ReviewSet]
    PRIMARY KEY CLUSTERED ([ReviewId] ASC);
GO

-- Creating primary key on [flyerId] in table 'FlyerSet'
ALTER TABLE [dbo].[FlyerSet]
ADD CONSTRAINT [PK_FlyerSet]
    PRIMARY KEY CLUSTERED ([flyerId] ASC);
GO

-- Creating primary key on [PromoteId] in table 'PromoteSet'
ALTER TABLE [dbo].[PromoteSet]
ADD CONSTRAINT [PK_PromoteSet]
    PRIMARY KEY CLUSTERED ([PromoteId] ASC);
GO

-- Creating primary key on [MerchantId] in table 'MerchantSet'
ALTER TABLE [dbo].[MerchantSet]
ADD CONSTRAINT [PK_MerchantSet]
    PRIMARY KEY CLUSTERED ([MerchantId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Categories_CategoryId] in table 'FlyerSet'
ALTER TABLE [dbo].[FlyerSet]
ADD CONSTRAINT [FK_CategoryFlyer]
    FOREIGN KEY ([Categories_CategoryId])
    REFERENCES [dbo].[CategorySet]
        ([CategoryId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoryFlyer'
CREATE INDEX [IX_FK_CategoryFlyer]
ON [dbo].[FlyerSet]
    ([Categories_CategoryId]);
GO

-- Creating foreign key on [Flyer_flyerId] in table 'ReviewSet'
ALTER TABLE [dbo].[ReviewSet]
ADD CONSTRAINT [FK_FlyerReview]
    FOREIGN KEY ([Flyer_flyerId])
    REFERENCES [dbo].[FlyerSet]
        ([flyerId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FlyerReview'
CREATE INDEX [IX_FK_FlyerReview]
ON [dbo].[ReviewSet]
    ([Flyer_flyerId]);
GO

-- Creating foreign key on [Merchants_MerchantId] in table 'FlyerSet'
ALTER TABLE [dbo].[FlyerSet]
ADD CONSTRAINT [FK_FlyerMerchant]
    FOREIGN KEY ([Merchants_MerchantId])
    REFERENCES [dbo].[MerchantSet]
        ([MerchantId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FlyerMerchant'
CREATE INDEX [IX_FK_FlyerMerchant]
ON [dbo].[FlyerSet]
    ([Merchants_MerchantId]);
GO

-- Creating foreign key on [Promotes_PromoteId] in table 'FlyerSet'
ALTER TABLE [dbo].[FlyerSet]
ADD CONSTRAINT [FK_PromoteFlyer]
    FOREIGN KEY ([Promotes_PromoteId])
    REFERENCES [dbo].[PromoteSet]
        ([PromoteId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PromoteFlyer'
CREATE INDEX [IX_FK_PromoteFlyer]
ON [dbo].[FlyerSet]
    ([Promotes_PromoteId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------