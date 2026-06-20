-- =====================================================
-- Orphanage & Child Adoption Management System
-- Student: Mukta Rani Baishnob | ID: 2207056
-- =====================================================

-- Drop tables if they already exist 
 DROP TABLE ADOPTION CASCADE CONSTRAINTS;
 DROP TABLE GUARDIAN CASCADE CONSTRAINTS;
 DROP TABLE MEAL_PLAN CASCADE CONSTRAINTS;
 DROP TABLE DONATION CASCADE CONSTRAINTS;
 DROP TABLE CHILD CASCADE CONSTRAINTS;
 DROP TABLE ADOPTIVE_FAMILY CASCADE CONSTRAINTS;
 DROP TABLE DONOR CASCADE CONSTRAINTS;
 DROP TABLE CLOTHING CASCADE CONSTRAINTS;
 DROP TABLE SUPPLY CASCADE CONSTRAINTS;
 DROP TABLE ADMIN CASCADE CONSTRAINTS;


-- 1. CHILD

CREATE TABLE CHILD (
  child_id        NUMBER PRIMARY KEY,
  name            VARCHAR2(100) NOT NULL,
  dob             DATE,
  gender          CHAR(1) CHECK (gender IN ('M','F','O')),
  health_status   VARCHAR2(50),
  background      VARCHAR2(500),
  admission_date  DATE DEFAULT SYSDATE,
  status          VARCHAR2(20) DEFAULT 'available'
                  CHECK (status IN ('available','adopted','pending'))
);


-- 2. GUARDIAN

CREATE TABLE GUARDIAN (
  guardian_id   NUMBER PRIMARY KEY,
  child_id      NUMBER REFERENCES CHILD(child_id),
  name          VARCHAR2(100),
  contact       VARCHAR2(50),
  relationship  VARCHAR2(50)
);


-- 3. ADOPTIVE_FAMILY

CREATE TABLE ADOPTIVE_FAMILY (
  family_id    NUMBER PRIMARY KEY,
  family_name  VARCHAR2(100),
  contact      VARCHAR2(50),
  address      VARCHAR2(200),
  verified     CHAR(1) DEFAULT 'N' CHECK (verified IN ('Y','N'))
);


-- 4. ADOPTION

CREATE TABLE ADOPTION (
  adoption_id    NUMBER PRIMARY KEY,
  child_id       NUMBER REFERENCES CHILD(child_id),
  family_id      NUMBER REFERENCES ADOPTIVE_FAMILY(family_id),
  request_date   DATE DEFAULT SYSDATE,
  approval_date  DATE,
  status         VARCHAR2(20) DEFAULT 'pending'
                 CHECK (status IN ('pending','approved','rejected'))
);


-- 5. DONOR

CREATE TABLE DONOR (
  donor_id  NUMBER PRIMARY KEY,
  name      VARCHAR2(100),
  contact   VARCHAR2(50),
  dtype     VARCHAR2(20) CHECK (dtype IN ('individual','organization'))
);


-- 6. DONATION

CREATE TABLE DONATION (
  donation_id  NUMBER PRIMARY KEY,
  donor_id     NUMBER REFERENCES DONOR(donor_id),
  dtype        VARCHAR2(20) CHECK (dtype IN ('money','food','clothes','other')),
  amount_qty   NUMBER,
  unit         VARCHAR2(20),
  donated_on   DATE DEFAULT SYSDATE
);


-- 7. MEAL_PLAN

CREATE TABLE MEAL_PLAN (
  plan_id        NUMBER PRIMARY KEY,
  child_id       NUMBER REFERENCES CHILD(child_id),
  plan_date      DATE,
  breakfast      VARCHAR2(200),
  lunch          VARCHAR2(200),
  dinner         VARCHAR2(200),
  nutrition_note VARCHAR2(300)
);


-- 8. CLOTHING

CREATE TABLE CLOTHING (
  item_id       NUMBER PRIMARY KEY,
  ctype         VARCHAR2(50),
  size_label    VARCHAR2(10),
  quantity      NUMBER DEFAULT 0,
  last_updated  DATE DEFAULT SYSDATE
);


-- 9. SUPPLY

CREATE TABLE SUPPLY (
  supply_id     NUMBER PRIMARY KEY,
  item_name     VARCHAR2(100),
  category      VARCHAR2(50),
  quantity      NUMBER,
  unit          VARCHAR2(20),
  last_updated  DATE DEFAULT SYSDATE
);


-- 10. ADMIN

CREATE TABLE ADMIN (
  admin_id  NUMBER PRIMARY KEY,
  name      VARCHAR2(100),
  username  VARCHAR2(50) UNIQUE,
  role      VARCHAR2(30)
);


