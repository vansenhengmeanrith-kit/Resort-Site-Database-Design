CREATE TABLE "Customer" (
  "ID" varchar UNIQUE,
  "First_Name" varchar,
  "Last_Name" varchar,
  "Email" varchar UNIQUE,
  "Phone" varchar,
  "Register_Date" timestamp
);

CREATE TABLE "Customer_Address" (
  "Customer_ID" varchar UNIQUE,
  "Address" varchar,
  "Postal_Code" varchar,
  "City" varchar,
  "Country" varchar
);

CREATE TABLE "Booking" (
  "ID" varchar UNIQUE,
  "Customer_ID" varchar UNIQUE,
  "Room_Number" int UNIQUE,
  "Book_Time" timestamp,
  "Night" int
);

CREATE TABLE "Room" (
  "Room_Number" int UNIQUE,
  "Room_Type" varchar UNIQUE,
  "Price_Per_Night" decimal,
  "Max_Person" int
);

CREATE TABLE "Payments" (
  "Payment_ID" varchar UNIQUE,
  "Customer_ID" varchar UNIQUE,
  "Booking_ID" varchar UNIQUE,
  "Amount" decimal,
  "Paid" varchar,
  "Paid_Time" timestamp,
  "Invoice" varchar,
  "Cancelled" varchar
);

CREATE TABLE "Cancellation" (
  "Cancellation_ID" varchar UNIQUE,
  "Customer_ID" varchar UNIQUE,
  "Booking_ID" varchar UNIQUE,
  "Cancel_Time" timestamp
);

ALTER TABLE "Customer_Address" ADD FOREIGN KEY ("Customer_ID") REFERENCES "Customer" ("ID");

ALTER TABLE "Booking" ADD FOREIGN KEY ("Customer_ID") REFERENCES "Customer" ("ID");

ALTER TABLE "Payments" ADD FOREIGN KEY ("Customer_ID") REFERENCES "Customer" ("ID");

ALTER TABLE "Cancellation" ADD FOREIGN KEY ("Customer_ID") REFERENCES "Customer" ("ID");

ALTER TABLE "Payments" ADD FOREIGN KEY ("Booking_ID") REFERENCES "Booking" ("ID");

ALTER TABLE "Cancellation" ADD FOREIGN KEY ("Booking_ID") REFERENCES "Booking" ("ID");

ALTER TABLE "Booking" ADD FOREIGN KEY ("Room_Number") REFERENCES "Room" ("Room_Number");