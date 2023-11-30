-- Find details of houses of a particular configuration, for example, 3BHKs
SELECT "house_number", "house_name" FROM "houses"
WHERE "configuration" = '3BHK';

-- Find all unoccupied houses that are available for sale/rent
SELECT "house_number", "house_name", "configuration" FROM "houses"
WHERE "occupancy_status" LIKE '%available%';

-- Find names and contact information of staff members who perform a certain role, for example, a cook
SELECT "first_name", "last_name", "contact_number", "email" FROM "people"
WHERE "id" IN (
    SELECT "people_id" FROM "staff"
    WHERE "employment_role" LIKE '%cook%'
);

-- Update a vehicle's number plate when a resident buys a new vehicles and sells their old vehicle
UPDATE "vehicles"
SET "number_plate" = 'NWWHLZ'
WHERE "people_id" = (
    SELECT "id" FROM "people"
    WHERE "first_name" = 'Kermit'
);

-- Find entry and exit gate logs of the community's staff members
SELECT "first_name", "last_name", "entry", "exit", "contact_number", "email", "number_plate" FROM "people"
JOIN "gate_logs" ON "people"."id" = "gate_logs"."people_id"
JOIN "vehicles" ON "vehicles"."people_id" = "people"."id"
WHERE "people"."id" IN (
    SELECT "staff"."people_id" FROM "staff"
);

-- Add a new person
INSERT INTO "people" ("first_name", "last_name", "contact_number", "email")
VALUES ('John', 'Smith', '9080706050', 'smithen@email.com');

-- Add a new house
INSERT INTO "houses" ("house_number", "house_name", "configuration", "occupancy_status")
VALUES ('Z-04', 'Smithsonian', '4BHK', 'Occupied');

-- Add a new vehicle
INSERT INTO "vehicles" ("number_plate", "people_id", "house_id")
VALUES ('MH33V2021', 21, 10);

-- Add a new resident as an owner
INSERT INTO "residents" ("people_id", "house_id", "vehicle_id", "resident_status")
VALUES (21, 10, 25, 'Owner');
