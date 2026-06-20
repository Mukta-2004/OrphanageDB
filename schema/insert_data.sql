-- =====================================================
-- Orphanage & Child Adoption Management System
-- Student: Mukta Rani Baishnob | ID: 2207056
-- =====================================================

-- ADMIN
INSERT INTO ADMIN (admin_id, name, username, role) VALUES (1, 'Mukta Rani Baishnob', 'mukta_admin', 'Super Admin');
INSERT INTO ADMIN (admin_id, name, username, role) VALUES (2, 'Ritoban Roy', 'ritoban_r', 'Staff Admin');


-- CHILD
INSERT INTO CHILD (child_id, name, dob, gender, health_status, background, admission_date, status) VALUES (1, 'Anika Sultana', DATE '2015-03-12', 'F', 'Healthy', 'Lost parents in flood', DATE '2020-06-01', 'available');
INSERT INTO CHILD (child_id, name, dob, gender, health_status, background, admission_date, status) VALUES (2, 'Rakib Hasan', DATE '2013-11-05', 'M', 'Asthma - mild', 'Abandoned at birth', DATE '2018-09-15', 'adopted');
INSERT INTO CHILD (child_id, name, dob, gender, health_status, background, admission_date, status) VALUES (3, 'Tania Akter', DATE '2016-07-22', 'F', 'Healthy', 'Parents deceased', DATE '2021-01-10', 'pending');
INSERT INTO CHILD (child_id, name, dob, gender, health_status, background, admission_date, status) VALUES (4, 'Sajib Mia', DATE '2014-02-18', 'M', 'Healthy', 'Family unable to support', DATE '2019-05-20', 'available');


-- GUARDIAN
INSERT INTO GUARDIAN (guardian_id, child_id, name, contact, relationship) VALUES (1, 3, 'Karim Sheikh', '01711122233', 'Uncle');
INSERT INTO GUARDIAN (guardian_id, child_id, name, contact, relationship) VALUES (2, 4, 'Fatema Begum', '01822233344', 'Aunt');


-- ADOPTIVE_FAMILY
INSERT INTO ADOPTIVE_FAMILY (family_id, family_name, contact, address, verified) VALUES (1, 'Ahmed Family', '01911223344', 'Dhanmondi, Dhaka', 'Y');
INSERT INTO ADOPTIVE_FAMILY (family_id, family_name, contact, address, verified) VALUES (2, 'Chowdhury Family', '01622334455', 'Khulna Sadar, Khulna', 'Y');
INSERT INTO ADOPTIVE_FAMILY (family_id, family_name, contact, address, verified) VALUES (3, 'Islam Family', '01533445566', 'Gulshan, Dhaka', 'N');


-- ADOPTION
INSERT INTO ADOPTION (adoption_id, child_id, family_id, request_date, approval_date, status) VALUES (1, 2, 1, DATE '2023-04-01', DATE '2023-05-15', 'approved');
INSERT INTO ADOPTION (adoption_id, child_id, family_id, request_date, approval_date, status) VALUES (2, 3, 2, DATE '2024-01-10', NULL, 'pending');
INSERT INTO ADOPTION (adoption_id, child_id, family_id, request_date, approval_date, status) VALUES (3, 1, 3, DATE '2024-03-05', NULL, 'rejected');


-- DONOR
INSERT INTO DONOR (donor_id, name, contact, dtype) VALUES (1, 'Hasan Traders', '01711000111', 'organization');
INSERT INTO DONOR (donor_id, name, contact, dtype) VALUES (2, 'Mrs. Nasrin Akter', '01822000222', 'individual');
INSERT INTO DONOR (donor_id, name, contact, dtype) VALUES (3, 'Khulna Welfare Foundation', '01933000333', 'organization');


-- DONATION
INSERT INTO DONATION (donation_id, donor_id, dtype, amount_qty, unit, donated_on) VALUES (1, 1, 'money', 50000, 'BDT', DATE '2024-02-01');
INSERT INTO DONATION (donation_id, donor_id, dtype, amount_qty, unit, donated_on) VALUES (2, 2, 'clothes', 30, 'pieces', DATE '2024-02-10');
INSERT INTO DONATION (donation_id, donor_id, dtype, amount_qty, unit, donated_on) VALUES (3, 3, 'food', 100, 'kg (rice)', DATE '2024-02-15');


-- MEAL_PLAN
INSERT INTO MEAL_PLAN (plan_id, child_id, plan_date, breakfast, lunch, dinner, nutrition_note) VALUES (1, 1, DATE '2024-06-01', 'Bread, egg, milk', 'Rice, dal, vegetable curry', 'Khichuri', 'Balanced diet');
INSERT INTO MEAL_PLAN (plan_id, child_id, plan_date, breakfast, lunch, dinner, nutrition_note) VALUES (2, 4, DATE '2024-06-01', 'Paratha, egg', 'Rice, fish curry', 'Soup, bread', 'Needs more protein');


-- CLOTHING
INSERT INTO CLOTHING (item_id, ctype, size_label, quantity, last_updated) VALUES (1, 'T-shirt', 'M', 25, DATE '2024-02-10');
INSERT INTO CLOTHING (item_id, ctype, size_label, quantity, last_updated) VALUES (2, 'Trousers', 'S', 15, DATE '2024-02-10');
INSERT INTO CLOTHING (item_id, ctype, size_label, quantity, last_updated) VALUES (3, 'Sweater', 'L', 10, DATE '2024-02-12');


-- SUPPLY
INSERT INTO SUPPLY (supply_id, item_name, category, quantity, unit, last_updated) VALUES (1, 'Rice', 'Food', 100, 'kg', DATE '2024-02-15');
INSERT INTO SUPPLY (supply_id, item_name, category, quantity, unit, last_updated) VALUES (2, 'Soap', 'Hygiene', 50, 'pieces', DATE '2024-02-15');
INSERT INTO SUPPLY (supply_id, item_name, category, quantity, unit, last_updated) VALUES (3, 'Notebooks', 'Education', 40, 'pieces', DATE '2024-02-18');
