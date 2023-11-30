-- Table to represent the people who live in/visit/work at the gated community
CREATE TABLE "people" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "contact_number" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    PRIMARY KEY("id")
);

-- Table to represent the houses in the gated community
CREATE TABLE "houses" (
    "id" INTEGER,
    "house_number" TEXT NOT NULL UNIQUE,
    "house_name" TEXT,
    "configuration" TEXT NOT NULL CHECK("configuration" IN ('2BHK', '3BHK', '4BHK')),
    "occupancy_status" TEXT NOT NULL CHECK("occupancy_status" IN ('Available', 'Occupied')),
    PRIMARY KEY("id")
);

-- Table to represent the vehicles that have entered the gated community
CREATE TABLE "vehicles" (
    "id" INTEGER,
    "number_plate" TEXT DEFAULT 'N/A',
    "people_id" INTEGER,
    "house_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("people_id") REFERENCES "people"("id"),
    FOREIGN KEY("house_id") REFERENCES "houses"("id")
);

-- Table to represent the residents of the gated community
CREATE TABLE "residents" (
    "id" INTEGER,
    "people_id" INTEGER,
    "house_id" INTEGER,
    "vehicle_id" INTEGER,
    "resident_status" TEXT NOT NULL CHECK("resident_status" IN ('Owner', 'Tenant', 'Ex-Resident')),
    PRIMARY KEY("id"),
    FOREIGN KEY("people_id") REFERENCES "people"("id"),
    FOREIGN KEY("house_id") REFERENCES "houses"("id"),
    FOREIGN KEY("vehicle_id") REFERENCES "vehicles"("id")
);

-- Table to represent the visitors of the gated community
CREATE TABLE "visitors" (
    "id" INTEGER,
    "people_id" INTEGER,
    "house_id" INTEGER,
    "vehicle_id" INTEGER,
    "purpose_of_visit" TEXT NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("people_id") REFERENCES "people"("id"),
    FOREIGN KEY("house_id") REFERENCES "houses"("id"),
    FOREIGN KEY("vehicle_id") REFERENCES "vehicles"("id")
);

-- Table to represent the staff who work at the gated community
CREATE TABLE "staff" (
    "id" INTEGER,
    "people_id" INTEGER,
    "house_id" INTEGER,
    "vehicle_id" INTEGER,
    "employment_role" TEXT NOT NULL,
    "employment_type" TEXT NOT NULL CHECK("employment_type" IN ('Daily Visits', 'Staying')),
    PRIMARY KEY("id"),
    FOREIGN KEY("people_id") REFERENCES "people"("id"),
    FOREIGN KEY("house_id") REFERENCES "houses"("id"),
    FOREIGN KEY("vehicle_id") REFERENCES "vehicles"("id")
);

-- Table to represent all entry/exit timestamps from the gated community
CREATE TABLE "gate_logs" (
    "id" INTEGER,
    "people_id" INTEGER,
    "entry" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "exit" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("id"),
    FOREIGN KEY("people_id") REFERENCES "people"("id")
);

-- View to access all information relating to homeowners in the gated community
CREATE VIEW "owners" AS
SELECT DISTINCT "first_name", "last_name", "contact_number", "email", "house_number", "house_name", "number_plate" FROM "people"
JOIN "residents" ON "residents"."people_id" = "people"."id"
JOIN "houses" ON "houses"."id" = "residents"."house_id"
JOIN "vehicles" ON "vehicles"."people_id" = "people"."id"
WHERE "resident_status" = 'Owner'
ORDER BY "first_name", "last_name";

-- View to access all information relating to tenants/renters in the gated community
CREATE VIEW "tenants" AS
SELECT "first_name", "last_name", "contact_number", "email", "house_number", "house_name", "number_plate" FROM "people"
JOIN "residents" ON "residents"."people_id" = "people"."id"
JOIN "houses" ON "houses"."id" = "residents"."house_id"
JOIN "vehicles" ON "vehicles"."people_id" = "people"."id"
WHERE "resident_status" = 'Tenant'
ORDER BY "first_name", "last_name";

-- View to access all information relating to staff members at the gated community
CREATE VIEW "staff_info" AS
SELECT "first_name", "last_name", "contact_number", "email", "number_plate", "house_number", "house_name", "employment_role", "employment_type" FROM "people"
JOIN "houses" ON "houses"."id" = "staff"."house_id"
JOIN "staff" ON "staff"."people_id" = "people"."id"
JOIN "vehicles" ON "vehicles"."people_id" = "people"."id"
ORDER BY "first_name", "last_name";

-- View to access all information relating to visitors of the gated community
CREATE VIEW "visitor_info" AS
SELECT "first_name", "last_name", "contact_number", "email", "house_number", "house_name", "purpose_of_visit", "number_plate" FROM "people"
JOIN "visitors" ON "visitors"."people_id" = "people"."id"
JOIN "houses" ON "houses"."id" = "visitors"."house_id"
JOIN "vehicles" ON "vehicles"."people_id" = "people"."id"
ORDER BY "first_name", "last_name";

-- Indexes to speed up common searches
CREATE INDEX "house_configuration_search" ON "houses" ("configuration", "occupancy_status");
CREATE INDEX "staff_role_search" ON "staff" ("people_id", "employment_role");