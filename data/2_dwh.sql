CREATE SCHEMA IF NOT EXISTS dwh;

CREATE TABLE IF NOT EXISTS dwh."day" (
  "id" SERIAL PRIMARY KEY,
  "num_day" int,
  "day_name" varchar
);

CREATE TABLE IF NOT EXISTS dwh."month" (
  "id" SERIAL PRIMARY KEY,
  "num_month" int,
  "month_name" varchar
);

CREATE TABLE IF NOT EXISTS dwh."year" (
  "id" SERIAL PRIMARY KEY,
  "num_year" int
);

CREATE TABLE IF NOT EXISTS dwh."time" (
  "id" SERIAL PRIMARY KEY,
  "year_id" int,
  "month_id" int,
  "day_id" int
);

CREATE TABLE IF NOT EXISTS dwh."city" (
  "id" int PRIMARY KEY,
  "name" varchar
);

CREATE TABLE IF NOT EXISTS dwh."client" (
  "id" SERIAL PRIMARY KEY,
  "city_id" int,
  "full_name" varchar
);

CREATE TABLE IF NOT EXISTS dwh."supplier" (
  "id" SERIAL PRIMARY KEY,
  "city_id" int,
  "full_name" varchar
);

CREATE TABLE IF NOT EXISTS dwh."product_category" (
  "id" int PRIMARY KEY,
  "name" varchar
);

CREATE TABLE IF NOT EXISTS dwh."material" (
  "id" int PRIMARY KEY,
  "name" varchar
);

CREATE TABLE IF NOT EXISTS dwh."product" (
  "id" SERIAL PRIMARY KEY,
  "label" varchar,
  "category_id" int,
  "material_id" int
);

CREATE TABLE IF NOT EXISTS dwh."site" (
  "id" SERIAL PRIMARY KEY,
  "libelle" varchar
);

CREATE TABLE IF NOT EXISTS dwh."sale" (
  "id" int PRIMARY KEY,
  "client_id" int,
  "site_id" int,
  "time_id" int,
  "product_id" int,
  "quantity" int,
  "revenue" float
);

CREATE TABLE IF NOT EXISTS dwh."purchase" (
  "id" int PRIMARY KEY,
  "supplier_id" int,
  "site_id" int,
  "time_id" int,
  "product_id" int,
  "quantity" int,
  "revenue" float
);

ALTER TABLE dwh."time" ADD FOREIGN KEY ("year_id") REFERENCES dwh."year" ("id");

ALTER TABLE dwh."time" ADD FOREIGN KEY ("month_id") REFERENCES dwh."month" ("id");

ALTER TABLE dwh."time" ADD FOREIGN KEY ("day_id") REFERENCES dwh."day" ("id");

ALTER TABLE dwh."client" ADD FOREIGN KEY ("city_id") REFERENCES dwh."city" ("id");

ALTER TABLE dwh."supplier" ADD FOREIGN KEY ("city_id") REFERENCES dwh."city" ("id");

ALTER TABLE dwh."product" ADD FOREIGN KEY ("category_id") REFERENCES dwh."product_category" ("id");

ALTER TABLE dwh."product" ADD FOREIGN KEY ("material_id") REFERENCES dwh."material" ("id");

ALTER TABLE dwh."sale" ADD FOREIGN KEY ("client_id") REFERENCES dwh."client" ("id");

ALTER TABLE dwh."sale" ADD FOREIGN KEY ("site_id") REFERENCES dwh."site" ("id");

ALTER TABLE dwh."sale" ADD FOREIGN KEY ("time_id") REFERENCES dwh."time" ("id");

ALTER TABLE dwh."sale" ADD FOREIGN KEY ("product_id") REFERENCES dwh."product" ("id");

ALTER TABLE dwh."purchase" ADD FOREIGN KEY ("supplier_id") REFERENCES dwh."supplier" ("id");

ALTER TABLE dwh."purchase" ADD FOREIGN KEY ("site_id") REFERENCES dwh."site" ("id");

ALTER TABLE dwh."purchase" ADD FOREIGN KEY ("time_id") REFERENCES dwh."time" ("id");

ALTER TABLE dwh."purchase" ADD FOREIGN KEY ("product_id") REFERENCES dwh."product" ("id");
