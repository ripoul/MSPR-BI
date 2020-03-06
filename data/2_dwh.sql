CREATE SCHEMA IF NOT EXISTS dwh;

CREATE TABLE IF NOT EXISTS dwh."day" (
  "id" SERIAL PRIMARY KEY,
  "num_day" int,
  "day_name" varchar
);

CREATE TABLE IF NOT EXISTS dwh."month" (
  "id" SERIAL PRIMARY KEY,
  "day_id" int,
  "num_month" int,
  "month_name" varchar
);

CREATE TABLE IF NOT EXISTS dwh."year" (
  "id" SERIAL PRIMARY KEY,
  "num_year" int,
  "month_id" int
);

CREATE TABLE IF NOT EXISTS dwh."client" (
  "id" SERIAL PRIMARY KEY,
  "city_id" int,
  "full_name" varchar
);

CREATE TABLE IF NOT EXISTS dwh."supplier" (
  "id" SERIAL PRIMARY KEY,
  "full_name" varchar
);

CREATE TABLE IF NOT EXISTS dwh."product_category" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "material_id" int
);

CREATE TABLE IF NOT EXISTS dwh."product" (
  "id" SERIAL PRIMARY KEY,
  "label" varchar,
  "category_id" int
);

CREATE TABLE IF NOT EXISTS dwh."site" (
  "id" SERIAL PRIMARY KEY,
  "libelle" varchar
);

CREATE TABLE IF NOT EXISTS dwh."sale" (
  "id" SERIAL PRIMARY KEY,
  "client_id" int,
  "site_id" int,
  "year_id" int,
  "product_id" int,
  "quantity" int,
  "revenue" float
);

CREATE TABLE IF NOT EXISTS dwh."purchase" (
  "id" SERIAL PRIMARY KEY,
  "supplier_id" int,
  "site_id" int,
  "year_id" int,
  "product_id" int,
  "quantity" int,
  "revenue" float
);

CREATE TABLE IF NOT EXISTS dwh."stock" (
  "id" SERIAL PRIMARY KEY,
  "quantity" int,
  "value" float,
  "year_id" int,
  "product_id" int,
  "site_id" int
);

ALTER TABLE dwh."year" ADD FOREIGN KEY ("month_id") REFERENCES dwh."month" ("id");

ALTER TABLE dwh."month" ADD FOREIGN KEY ("day_id") REFERENCES dwh."day" ("id");

ALTER TABLE dwh."product" ADD FOREIGN KEY ("category_id") REFERENCES dwh."product_category" ("id");

ALTER TABLE dwh."sale" ADD FOREIGN KEY ("client_id") REFERENCES dwh."client" ("id");

ALTER TABLE dwh."sale" ADD FOREIGN KEY ("site_id") REFERENCES dwh."site" ("id");

ALTER TABLE dwh."sale" ADD FOREIGN KEY ("product_id") REFERENCES dwh."product" ("id");

ALTER TABLE dwh."sale" ADD FOREIGN KEY ("year_id") REFERENCES dwh."year" ("id");

ALTER TABLE dwh."purchase" ADD FOREIGN KEY ("supplier_id") REFERENCES dwh."supplier" ("id");

ALTER TABLE dwh."purchase" ADD FOREIGN KEY ("site_id") REFERENCES dwh."site" ("id");

ALTER TABLE dwh."purchase" ADD FOREIGN KEY ("year_id") REFERENCES dwh."year" ("id");

ALTER TABLE dwh."purchase" ADD FOREIGN KEY ("product_id") REFERENCES dwh."product" ("id");

ALTER TABLE dwh."stock" ADD FOREIGN KEY ("year_id") REFERENCES dwh."year" ("id");

ALTER TABLE dwh."stock" ADD FOREIGN KEY ("product_id") REFERENCES dwh."product" ("id");

ALTER TABLE dwh."stock" ADD FOREIGN KEY ("site_id") REFERENCES dwh."site" ("id");
