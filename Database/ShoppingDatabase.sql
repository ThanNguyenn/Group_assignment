create database PRJ301_3W_AS
go

use PRJ301_3W_AS
go

CREATE TABLE [dbo].[tblCategories] (
    [categoryID] [nvarchar](50) NOT NULL,
	[categoryName] [nvarchar](50) NOT NULL,
CONSTRAINT [PK_tblCategories] PRIMARY KEY CLUSTERED 
(	[categoryID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[roleID] [nvarchar](50) NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblProducts] (
    [productID] [nvarchar](50) NOT NULL,
	[categoryID] [nvarchar](50)  NOT NULL,
	[productName] [nvarchar](50) NOT NULL,
	[productDescription] [nvarchar](200) NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[status] [bit] NOT NULL,
CONSTRAINT [PK_tblProducts] PRIMARY KEY CLUSTERED 
(
    [productID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [FK_tblProducts_tblCategories] FOREIGN KEY ([categoryID]) REFERENCES [dbo].[tblCategories]([categoryID])
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblOrders] (
    [orderID] [nvarchar](50) NOT NULL,
	[userID] [nvarchar](50) NOT NULL,
    [date] [datetime] NOT NULL,
    [total] [Money] NOT NULL,
    [status] [bit] NOT NULL,
CONSTRAINT [PK_tblOrders] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
    CONSTRAINT [FK_tblOrders_tblUsers] FOREIGN KEY ([userID]) REFERENCES [dbo].[tblUsers]([userID])
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblOrderDetails] (
    [orderID] [nvarchar](50) NOT NULL,
	[productID] [nvarchar](50) NOT NULL,
    [price] [Money] NOT NULL,
    [quantity] [int] NOT NULL,
    [status] [bit] NOT NULL,
CONSTRAINT [PK_tblOrderDetails] PRIMARY KEY CLUSTERED 
(
        [orderID] ASC,
        [productID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
    CONSTRAINT [FK_tblOrderDetails_tblOrders] FOREIGN KEY ([orderID]) REFERENCES [dbo].[tblOrders]([orderID]),
    CONSTRAINT [FK_tblOrderDetails_tblProducts] FOREIGN KEY ([productID]) REFERENCES [dbo].[tblProducts]([productID])
) ON [PRIMARY]
GO

INSERT INTO [dbo].[tblCategories] ([categoryID], [categoryName])
VALUES
    ('C001', 'Skin Care'),
    ('C002', 'Make Up'),
    ('C003', 'Hair Care'),
    ('C004', 'Fragrance'),
    ('C005', 'Bath & Body');
GO

INSERT INTO [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status])
VALUES
    ('admin', 'Admin User', '1', 'AD', 1),
    ('user', 'Regular User', '1', 'US', 1),
    ('globetrotter007', 'Liam Hart', 'securePass123!', 'US', 1),
    ('techWhiz42', 'Maya Kim', 'Tech@2024', 'US', 1),
    ('charmMaster', 'Sophia Lee', 'Charm!567', 'US', 1),
    ('daringExplorer', 'Ethan Cole', 'Explore!890', 'US', 1),
    ('urbanSavant', 'Olivia Smith', 'Urban@2024', 'US', 1),
    ('codeCraftsman', 'Jack Turner', 'Code@1234', 'US', 1),
    ('bookWorm32', 'Emily Davis', 'Read&Relax', 'US', 1),
    ('styleGuru21', 'Ava Johnson', 'Style@2024', 'US', 1);
GO

INSERT INTO [dbo].[tblProducts] ([productID], [categoryID], [productName], [productDescription], [price], [quantity], [status])
VALUES
    -- Skin Care
    ('P001', 'C001', 'Hydrating Facial Cream', 'A rich, nourishing cream designed to deeply hydrate and rejuvenate your skin. Enriched with natural extracts and vitamins to promote a healthy, glowing complexion.', 35, 500, 1),
    ('P002', 'C001', 'Anti-Aging Serum', 'An advanced serum formulated to reduce the appearance of fine lines and wrinkles. Features a blend of powerful antioxidants and peptides for youthful, radiant skin.', 45, 500, 1),
    ('P003', 'C001', 'Moisturizing Face Mask', 'A soothing face mask that provides intense hydration and revitalization. Infused with hyaluronic acid and botanical extracts to leave your skin feeling refreshed and supple.', 25, 500, 1),
    
    -- Make Up
    ('P004', 'C002', 'Long-lasting Foundation', 'A full-coverage foundation with a lightweight texture that provides a flawless finish. Offers long-lasting wear and is perfect for achieving a natural, radiant look.', 30, 500, 1),
    ('P005', 'C002', 'Bold Lipstick', 'A vibrant lipstick that delivers intense color and hydration. Formulated with nourishing ingredients to keep your lips soft and smooth all day long.', 20, 500, 1),
    ('P006', 'C002', 'Waterproof Mascara', 'A high-performance mascara that adds volume and length to your lashes while being resistant to water and smudging. Ideal for a long-lasting, dramatic look.', 28, 500, 1),

    -- Hair Care
    ('P007', 'C003', 'Nourishing Shampoo', 'A gentle shampoo enriched with natural oils and vitamins to cleanse and nourish your hair. Helps to maintain healthy, shiny hair with every wash.', 22, 500, 1),
    ('P008', 'C003', 'Revitalizing Conditioner', 'A conditioning treatment that revitalizes and strengthens hair. Infused with nourishing ingredients to enhance softness and manageability.', 24, 500, 1),
    ('P009', 'C003', 'Hair Repair Mask', 'A deep-conditioning mask designed to repair and restore damaged hair. Contains a blend of proteins and vitamins to rebuild strength and shine.', 30, 500, 1),

    -- Fragrance
    ('P010', 'C004', 'Elegant Eau de Parfum', 'A sophisticated fragrance with a blend of floral and woody notes. Perfect for any occasion, offering a long-lasting and captivating scent.', 75, 500, 1),
    ('P011', 'C004', 'Fresh Floral Mist', 'A light and refreshing mist with a bouquet of delicate floral notes. Ideal for a subtle and invigorating scent that brightens your day.', 60, 500, 1),
    ('P012', 'C004', 'Citrus Breeze Cologne', 'A zesty and energizing cologne with hints of citrus and herbs. Provides a refreshing fragrance that is perfect for everyday wear.', 50, 500, 1),

    -- Bath & Body
    ('P013', 'C005', 'Energizing Body Wash', 'A revitalizing body wash that gently cleanses and invigorates. Formulated with invigorating scents and natural ingredients to refresh your skin.', 15, 500, 1),
    ('P014', 'C005', 'Luxurious Body Scrub', 'A luxurious body scrub that exfoliates and smooths your skin. Contains exfoliating particles and moisturizing agents to reveal softer, glowing skin.', 20, 500, 1),
    ('P015', 'C005', 'Soothing Body Lotion', 'A rich body lotion that provides deep hydration and comfort. Infused with soothing ingredients to keep your skin soft, smooth, and nourished.', 18, 500, 1);
	GO
	-- Orders
INSERT INTO [dbo].[tblOrders] ([orderID], [userID], [date], [total], [status])
VALUES
    ('O001', 'user', '2024-08-21 10:00:00', 85, 1),
    ('O002', 'user', '2024-08-22 14:30:00', 100, 1),
    ('O003', 'globetrotter007', '2024-08-21 11:00:00', 76, 1),
    ('O004', 'globetrotter007', '2024-08-22 15:00:00', 185, 1),
    ('O005', 'techWhiz42', '2024-08-21 12:00:00', 105, 1),
    ('O006', 'techWhiz42', '2024-08-22 16:00:00', 125, 1),
    ('O007', 'charmMaster', '2024-08-21 13:00:00', 62, 1),
    ('O008', 'charmMaster', '2024-08-22 17:00:00', 124, 1),
    ('O009', 'daringExplorer', '2024-08-21 09:00:00', 50, 1),
    ('O010', 'daringExplorer', '2024-08-22 18:00:00', 76, 1);

-- Order Details
INSERT INTO [dbo].[tblOrderDetails] ([orderID], [productID], [price], [quantity], [status])
VALUES
    -- Order O001
    ('O001', 'P001', 35, 1, 1),
    ('O001', 'P003', 50, 2, 1),

    -- Order O002
    ('O002', 'P004', 30, 1, 1),
    ('O002', 'P005', 20, 2, 1),
    ('O002', 'P006', 28, 1, 1),

    -- Order O003
    ('O003', 'P007', 22, 2, 1),
    ('O003', 'P008', 24, 1, 1),
    ('O003', 'P009', 30, 1, 1),

    -- Order O004
    ('O004', 'P010', 75, 1, 1),
    ('O004', 'P011', 60, 1, 1),
    ('O004', 'P012', 50, 1, 1),

    -- Order O005
    ('O005', 'P013', 15, 3, 1),
    ('O005', 'P014', 20, 2, 1),
    ('O005', 'P015', 18, 2, 1),

    -- Order O006
    ('O006', 'P001', 35, 2, 1),
    ('O006', 'P002', 45, 1, 1),
    ('O006', 'P003', 50, 2, 1),

    -- Order O007
    ('O007', 'P007', 22, 2, 1),
    ('O007', 'P014', 20, 1, 1),

    -- Order O008
    ('O008', 'P008', 24, 1, 1),
    ('O008', 'P009', 30, 1, 1),
    ('O008', 'P012', 50, 1, 1),

    -- Order O009
    ('O009', 'P013', 15, 2, 1),
    ('O009', 'P015', 18, 2, 1),

    -- Order O010
    ('O010', 'P014', 20, 3, 1),
    ('O010', 'P015', 18, 2, 1);