# Database Link

## Introduction

* It is a schema object in one DB that enables you to access objects on another DB

* To access non Oracle systems, use Oracle Heterogeneous Services

* After creating link, you can use SQL statements by appending **@dblinkname** to table, view

* To create private DB link, you must have **CREATE DATABASE LINK** system privilege

* To create public DB link, you must have **CREATE PUBLIC DATABASE LINK**


## Usage

* Statement

    CREATE DATABASE LINK {database_link_name} CONNECT TO {user} IDENTIFIED by {pwd} USING '{connect_string_for_remote_db}';

    SELECT * FROM employees@{dblinkname}