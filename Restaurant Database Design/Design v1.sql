CREATE TABLE "Customer" (
  "ID" varchar,
  "First_Name" varchar,
  "Last_Name" varchar,
  "Phone" varchar,
  "Email" varchar,
  "Register_Date" datetime
);

CREATE TABLE "Menu" (
  "ID" varchar,
  "Name" varchar,
  "Description" varchar,
  "Price" decimal
);

CREATE TABLE "Order" (
  "ID" varchar,
  "Menu_ID" varchar,
  "Quantity" int,
  "Menu_Price" decimal,
  "Order_Date" datetime
);

CREATE TABLE "Payment" (
  "ID" varchar,
  "Customer_ID" varchar,
  "Order_ID" varchar,
  "Amount" decimal,
  "Payment_Date" datetime
);

ALTER TABLE "Payment" ADD FOREIGN KEY ("Customer_ID") REFERENCES "Customer" ("ID");

ALTER TABLE "Payment" ADD FOREIGN KEY ("Order_ID") REFERENCES "Order" ("ID");

ALTER TABLE "Order" ADD FOREIGN KEY ("Menu_ID") REFERENCES "Menu" ("ID");

ALTER TABLE "Order" ADD FOREIGN KEY ("Menu_Price") REFERENCES "Menu" ("Price");