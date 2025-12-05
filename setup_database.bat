@echo off
echo ============================================
echo Forest Management System - Database Setup
echo ============================================
echo.
echo This script will create the database and tables in MySQL
echo.
"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" -u root -p < "database_schema.sql"
echo.
echo ============================================
echo Setup Complete!
echo ============================================
pause
