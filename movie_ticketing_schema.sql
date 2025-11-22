
-- Movie Ticketing System SQL Schema (Based on Provided ERD)
-- ===========================
-- Table: Account
-- ===========================
CREATE TABLE Account (
    AccountID NUMBER PRIMARY KEY,
    FirstName VARCHAR2(100),
    LastName VARCHAR2(100),
    RememberMe CHAR(1),
    Username VARCHAR2(100),
    Password VARCHAR2(100)
);

-- ===========================
-- Table: Type
-- ===========================
CREATE TABLE Type (
    TypeID NUMBER PRIMARY KEY,
    TypeName VARCHAR2(100)
);

-- ===========================
-- Table: Movie
-- ===========================
CREATE TABLE Movie (
    MovieID NUMBER PRIMARY KEY,
    Name VARCHAR2(255),
    Description VARCHAR2(500),
    PublicationYear NUMBER,
    Director VARCHAR2(50),
    Actor VARCHAR2(50),
    Genre VARCHAR2(30),
    CoverPhoto VARCHAR2(500),
    Type_TypeID NUMBER,
    TransactionHistory_TransactionID NUMBER,
    Account_AccountID NUMBER,
    CONSTRAINT Movie_FK_Type FOREIGN KEY (Type_TypeID) REFERENCES Type(TypeID),
    CONSTRAINT Movie_FK_Account FOREIGN KEY (Account_AccountID) REFERENCES Account(AccountID)
);

-- ===========================
-- Table: TransactionHistory
-- ===========================
CREATE TABLE TransactionHistory (
    TransactionID NUMBER PRIMARY KEY,
    TotalAmount NUMBER,
    TransactionDate TIMESTAMP,
    Status VARCHAR2(30),
    Movie_MovieID NUMBER,
    CONSTRAINT TransactionHistory_FK_Movie FOREIGN KEY (Movie_MovieID) REFERENCES Movie(MovieID)
);

-- Add missing FK in Movie referencing TransactionHistory
ALTER TABLE Movie ADD CONSTRAINT Movie_FK_TransactionHistory 
    FOREIGN KEY (TransactionHistory_TransactionID) REFERENCES TransactionHistory(TransactionID);

-- ===========================
-- Table: CartItem
-- ===========================
CREATE TABLE CartItem (
    CartID NUMBER PRIMARY KEY,
    Quantity NUMBER,
    Purchased NUMBER,
    PurchaseDate TIMESTAMP,
    Movie_MovieID NUMBER,
    Account_AccountID NUMBER,
    CONSTRAINT CartItem_FK_Movie FOREIGN KEY (Movie_MovieID) REFERENCES Movie(MovieID),
    CONSTRAINT CartItem_FK_Account FOREIGN KEY (Account_AccountID) REFERENCES Account(AccountID)
);

-- ===========================
-- Table: Rating
-- ===========================
CREATE TABLE Rating (
    RatingID NUMBER PRIMARY KEY,
    RatingDate TIMESTAMP,
    Rating NUMBER,
    Comment VARCHAR2(200),
    Movie_MovieID NUMBER,
    CONSTRAINT Rating_FK_Movie FOREIGN KEY (Movie_MovieID) REFERENCES Movie(MovieID)
);
