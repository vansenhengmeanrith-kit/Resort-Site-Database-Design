CREATE TABLE `Customer` 
(
	`ID` varchar(255) UNIQUE,
	`First_Name` varchar(255),
	`Last_Name` varchar(255),
	`Email` varchar(255) UNIQUE,
	`Phone` varchar(255),
	`Register_Date` timestamp
);

CREATE TABLE `Customer_Address` 
(
	`Customer_ID` varchar(255) UNIQUE,
	`Address` varchar(255),
	`Postal_Code` varchar(255),
	`City` varchar(255),
	`Country` varchar(255)
);

CREATE TABLE `Booking` 
(
	`ID` varchar(255) UNIQUE,
	`Customer_ID` varchar(255) UNIQUE,
	`Room_Number` int UNIQUE,
	`Book_Time` timestamp,
	`Night` int
);

CREATE TABLE `Room` 
(
	`Room_Number` int UNIQUE,
	`Room_Type` varchar(255) UNIQUE,
	`Price_Per_Night` decimal,
	`Max_Person` int
);

CREATE TABLE `Payments` 
(
	`Payment_ID` varchar(255) UNIQUE,
	`Customer_ID` varchar(255) UNIQUE,
	`Booking_ID` varchar(255) UNIQUE,
	`Amount` decimal,
	`Paid` varchar(255),
	`Paid_Time` timestamp,
	`Invoice` varchar(255),
	`Cancelled` varchar(255)
);

CREATE TABLE `Cancellation` 
(
	`Cancellation_ID` varchar(255) UNIQUE,
	`Customer_ID` varchar(255) UNIQUE,
	`Booking_ID` varchar(255) UNIQUE,
	`Cancel_Time` timestamp
);

ALTER TABLE `Customer_Address` ADD FOREIGN KEY (`Customer_ID`) REFERENCES `Customer` (`ID`);

ALTER TABLE `Booking` ADD FOREIGN KEY (`Customer_ID`) REFERENCES `Customer` (`ID`);

ALTER TABLE `Payments` ADD FOREIGN KEY (`Customer_ID`) REFERENCES `Customer` (`ID`);

ALTER TABLE `Cancellation` ADD FOREIGN KEY (`Customer_ID`) REFERENCES `Customer` (`ID`);

ALTER TABLE `Payments` ADD FOREIGN KEY (`Booking_ID`) REFERENCES `Booking` (`ID`);

ALTER TABLE `Cancellation` ADD FOREIGN KEY (`Booking_ID`) REFERENCES `Booking` (`ID`);

ALTER TABLE `Booking` ADD FOREIGN KEY (`Room_Number`) REFERENCES `Room` (`Room_Number`);
