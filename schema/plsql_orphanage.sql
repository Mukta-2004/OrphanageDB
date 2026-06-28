-- =====================================================
-- Orphanage & Child Adoption Management System
-- PL/SQL Implementation: Views, Procedures, Functions
-- Student: Mukta Rani Baishnob | ID: 2207056
-- =====================================================
 
SET SERVEROUTPUT ON;
SET LINESIZE 200
SET PAGESIZE 50

-- SECTION 1: VIEWS
 
-- View 1: All available children
CREATE OR REPLACE VIEW vw_available_children AS
SELECT child_id, name, dob, gender, health_status
FROM CHILD
WHERE status = 'available';
/
 
-- View 2: Adoption details (child name + family name)
CREATE OR REPLACE VIEW vw_adoption_details AS
SELECT
    a.adoption_id,
    c.name       AS child_name,
    f.family_name,
    a.request_date,
    a.status     AS adoption_status
FROM ADOPTION a
JOIN CHILD           c ON a.child_id  = c.child_id
JOIN ADOPTIVE_FAMILY f ON a.family_id = f.family_id;
/
 
-- View 3: Donation list with donor name
CREATE OR REPLACE VIEW vw_donation_list AS
SELECT
    d.name      AS donor_name,
    dn.dtype    AS donation_type,
    dn.amount_qty,
    dn.unit,
    dn.donated_on
FROM DONATION dn
JOIN DONOR d ON dn.donor_id = d.donor_id;
/
 
-- View 4: Child meal plan with child name
CREATE OR REPLACE VIEW vw_child_meal AS
SELECT
    c.name         AS child_name,
    m.plan_date,
    m.breakfast,
    m.lunch,
    m.dinner,
    m.nutrition_note
FROM MEAL_PLAN m
JOIN CHILD c ON m.child_id = c.child_id;
/
 
-- View 5: Supply items that are low (quantity < 20)
CREATE OR REPLACE VIEW vw_low_supply AS
SELECT item_name, category, quantity, unit
FROM SUPPLY
WHERE quantity < 20;
/
 
 

-- SECTION 2: PROCEDURES

 
--  Add a new child
CREATE OR REPLACE PROCEDURE sp_add_child (
    p_id            IN NUMBER,
    p_name          IN VARCHAR2,
    p_dob           IN DATE,
    p_gender        IN CHAR,
    p_health_status IN VARCHAR2,
    p_background    IN VARCHAR2
) AS
BEGIN
    INSERT INTO CHILD (child_id, name, dob, gender, health_status, background, admission_date, status)
    VALUES (p_id, p_name, p_dob, p_gender, p_health_status, p_background, SYSDATE, 'available');
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Child added: ' || p_name);
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
 


--  Show all children using DBMS_OUTPUT
CREATE OR REPLACE PROCEDURE sp_show_all_children AS
    v_child_id  CHILD.child_id%TYPE;
    v_name      CHILD.name%TYPE;
    v_gender    CHILD.gender%TYPE;
    v_status    CHILD.status%TYPE;
    CURSOR cur_child IS
        SELECT child_id, name, gender, status FROM CHILD;
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== All Children ===');
    OPEN cur_child;
    LOOP
        FETCH cur_child INTO v_child_id, v_name, v_gender, v_status;
        EXIT WHEN cur_child%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(
            'ID: ' || v_child_id ||
            ' | Name: ' || v_name ||
            ' | Gender: ' || v_gender ||
            ' | Status: ' || v_status
        );
    END LOOP;
    CLOSE cur_child;
END;
/
 

-- SECTION 4: TEST CALLS

 
-- Test: Views
SELECT * FROM vw_available_children;
SELECT * FROM vw_adoption_details;
SELECT * FROM vw_donation_list;
SELECT * FROM vw_child_meal;
SELECT * FROM vw_low_supply;
 
-- Test: Procedures
BEGIN
    sp_add_child(5, 'Nila Parvin', DATE '2017-08-10', 'F', 'Healthy', 'Mother deceased');
   
    sp_show_all_children;
END;
/
 