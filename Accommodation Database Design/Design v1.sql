CREATE TABLE "Customer" (
  "ID" varchar,
  "First_Name" varchar,
  "Last_Name" varchar,
  "Email" varchar,
  "Phone" varchar,
  "Register_Date" datetime
);

CREATE TABLE "Customer_Address" (
  "Customer_ID" varchar,
  "Address" varchar,
  "Postal_Code" varchar,
  "City" varchar,
  "Country" varchar
);

CREATE TABLE "Booking" (
  "ID" varchar,
  "Customer_ID" varchar,
  "Room_Number" int,
  "Book_Time" datetime,
  "Night" int
);

CREATE TABLE "Room" (
  "Room_Number" int,
  "Room_Type" varchar,
  "Price_Per_Night" decimal,
  "Max_Person" int
);

CREATE TABLE "Payments" (
  "Payment_ID" varchar,
  "Customer_ID" varchar,
  "Booking_ID" varchar,
  "Amount" datetime,
  "Paid" varchar,
  "Paid_Time" datetime,
  "Invoice" varchar,
  "Cancelled" varchar
);

CREATE TABLE "Cancellation" (
  "Cancellation_ID" varchar,
  "Customer_ID" varchar,
  "Booking_ID" varchar,
  "Cancel_Time" datetime
);

ALTER TABLE "Customer_Address" ADD FOREIGN KEY ("Customer_ID") REFERENCES "Customer" ("ID");

ALTER TABLE "Booking" ADD FOREIGN KEY ("Customer_ID") REFERENCES "Customer" ("ID");

ALTER TABLE "Payments" ADD FOREIGN KEY ("Customer_ID") REFERENCES "Customer" ("ID");

ALTER TABLE "Cancellation" ADD FOREIGN KEY ("Customer_ID") REFERENCES "Customer" ("ID");

ALTER TABLE "Payments" ADD FOREIGN KEY ("Booking_ID") REFERENCES "Booking" ("ID");

ALTER TABLE "Cancellation" ADD FOREIGN KEY ("Booking_ID") REFERENCES "Booking" ("ID");

ALTER TABLE "Booking" ADD FOREIGN KEY ("Room_Number") REFERENCES "Room" ("Room_Number");