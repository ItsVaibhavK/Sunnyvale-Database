INSERT INTO "people" ("first_name", "last_name", "contact_number", "email")
VALUES ('Dave', 'Grohl', '6066066060', 'daveg@email.com'),
('Florence', 'Machine', '0842938105', 'flo@email.com'),
('Kurt', 'Cobain', '9283019283', 'kurtyc@email.com'),
('Courtney', 'Love', '1037382940', 'hole@email.com'),
('Kermit', 'Frog', '7483920394', 'froglad@email.com'),
('Shazam', 'Al-Kazam', '8473920192', 'salk@email.com'),
('Steph', 'Curry', '7492039473', 'currys@email.com'),
('Seth', 'Curry', '7492039473', 'currys@email.com'),
('Mona', 'Lisa', '0100200030', 'trapped@email.com'),
('Nick', 'Jonas', '8402918441', 'jonas1@email.com'),
('Joe', 'Jonas', '3920763822', 'jonas2@email.com'),
('Kevin', 'Jonas', '9382654344', 'jonas3@email.com'),
('Visitor', 'Ronald', '8402836577', 'rmcd@email.com'),
('Visitor', 'Wendy', '7753820175', 'borger@email.com'),
('Visitor', 'Denny', '7300987776', 'dennyzen@email.com'),
('Visitor', 'Kerry', '7302917766', 'uradyne@email.com'),
('Staff', 'Macy', '9210749209', 'maced@email.com'),
('Staff', 'Billie', '2930291855', 'hillybilly@email.com'),
('Staff', 'Nyck', '8744002299', 'debris@email.com'),
('Staff', 'Charles', '8574002293', 'shaarl@email.com');

INSERT INTO "houses" ("house_number", "house_name", "configuration", "occupancy_status")
VALUES ('606', 'fooFIGHTERS', '3BHK', 'Occupied'),
('404', 'R3hab', '2BHK', 'Occupied'),
('01-A', 'Fantasy', '2BHK', 'Occupied'),
('9', 'Champs', '4BHK', 'Occupied'),
('800', 'Bawn-Zure', '2BHK', 'Occupied'),
('333', 'Jonesies', '3BHK', 'Occupied'),
('9JAG', 'Jaaaaaag', '3BHK', 'Available'),
('0', '0', '2BHK', 'Available'),
('1.12', 'Decime', '4BHK', 'Available');

INSERT INTO "vehicles" ("number_plate", "people_id", "house_id")
VALUES ('DAVE1', 1, 1),
('GROHL1', 1, 1),
('FF606', 1, 1),
('NRV0101', 3, 2),
('LVEC88', 4, 2),
('FRGMBLE5', 5, 3),
('SHZM', 6, 3),
('STEPH1', 7, 4),
('STEPH2', 7, 4),
('STHC00', 8, 4),
('JNS01', 10, 6),
('JNS02', 11, 6),
('JNS03', 12, 6);

INSERT INTO "vehicles" ("number_plate", "people_id")
VALUES ('MCD808', 13),
('CY2077', 16),
('STF02', 17),
('I4NI', 18),
('FRRI02', 20);

INSERT INTO "vehicles" ("people_id", "house_id")
VALUES (2, 1),
(9, 5),
(2, 1),
(14, NULL),
(15, NULL),
(19, NULL);

INSERT INTO "residents" ("people_id", "house_id", "vehicle_id", "resident_status")
VALUES (1, 1, 1, 'Owner'),
(1, 1, 2, 'Owner'),
(1, 1, 3, 'Owner'),
(2, 1, 19, 'Owner'),
(3, 2, 4, 'Ex-Resident'),
(4, 2, 5, 'Tenant'),
(1, 2, 1, 'Owner'),
(5, 3, 6, 'Tenant'),
(6, 3, 7, 'Tenant'),
(7, 4, 8, 'Owner'),
(7, 4, 9, 'Owner'),
(8, 4, 10, 'Tenant'),
(9, 5, 20, 'Tenant'),
(10, 6, 11, 'Owner'),
(11, 6, 12, 'Tenant'),
(12, 6, 13, 'Tenant');

INSERT INTO "visitors" ("people_id", "house_id", "vehicle_id", "purpose_of_visit")
VALUES (13, 1, 14, 'Delivery'),
(14, 6, 22, 'Tutoring'),
(14, 4, 22, 'Workout'),
(15, 2, 23, 'Casual'),
(16, 8, 15, 'Celebration'),
(13, 5, 14, 'Repairs');

INSERT INTO "staff" ("people_id", "house_id", "vehicle_id", "employment_role", "employment_type")
VALUES (17, 3, 15, 'Cook', 'Daily Visits'),
(17, 6, 15, 'Cook', 'Daily Visits'),
(17, 1, 15, 'Cook', 'Daily Visits'),
(18, 2, 17, 'Maid', 'Daily Visits'),
(18, 4, 17, 'Maid', 'Daily Visits'),
(19, 5, 24, 'Nurse', 'Staying'),
(20, 2, 18, 'Maid', 'Daily Visits'),
(20, 1, 18, 'Maid', 'Daily Visits');

INSERT INTO "gate_logs" ("people_id")
VALUES (1),
(16),
(21),
(2),
(3),
(8),
(10),
(1),
(9),
(18),
(17),
(13),
(13),
(19),
(5),
(7),
(20),
(20),
(20),
(7),
(9),
(12),
(14),
(14);