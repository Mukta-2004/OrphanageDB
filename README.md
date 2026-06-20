# Orphanage & Child Adoption Management System

A database project for **CSE 3109 / 3110 — Database Systems Lab**, KUET.

**Student:** Mukta Rani Baishnob
**ID:** 2207056 | **Section A** | **Session 2024–2025**

## About

This system digitizes core operations of an orphanage, including child profile
management, the adoption workflow, donor and donation tracking, food/nutrition
planning, clothing and supply inventory, and admin reporting.

## Features

1. Child Profile Management
2. Adoption Management System
3. Donor & Donation Management
4. Food & Nutrition Tracking
5. Clothing & Supply Inventory System
6. Search & Filter System
7. Admin Dashboard & Reports

## Tech Stack

- **Database:** Oracle SQL (SQL*Plus)
- **Query Language:** SQL — DDL, DML, Joins, Subqueries, Views, Triggers

## Project Structure

```
OrphanageDB/
├── proposal/      # Project proposal document
├── schema/        # CREATE TABLE statements
├── data/          # Sample INSERT data
├── queries/       # SELECT / search / report queries
└── reports/       # Lab progress reports
```

## Setup

1. Run `schema/create_tables.sql` in SQL*Plus / SQL Developer to create all 10 tables.
2. Run `data/insert_data.sql` to populate sample data.
3. Explore queries in `queries/`.

## Entities

CHILD, GUARDIAN, ADOPTIVE_FAMILY, ADOPTION, DONOR, DONATION, MEAL_PLAN,
CLOTHING, SUPPLY, ADMIN

## Progress

See `reports/` for lab-by-lab progress updates.
