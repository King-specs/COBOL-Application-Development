# Inventory Management COBOL Program

## Description
This COBOL program, `inventory.cbl`, is designed to manage and track inventory items. It includes functionalities for adding, updating, and viewing inventory records.

## Features
- Add new inventory items
- Update existing inventory items
- View all inventory items

## Requirements
- GnuCOBOL
- Windows/Linux/MacOS
- Visual Studio Code (optional, for editing)

## Installation
1. **Install GnuCOBOL**:
   - Download and install GnuCOBOL from GnuCOBOL download page.
2. **Set up Environment Variables**:
   - Add the GnuCOBOL `bin` directory to your system's PATH.

## Usage
1. **Compile the Program**:
   ```sh
   cobc -x -o inventory.exe inventory.cbl

## Run the Program:
    ./inventory.exe

## Files
    inventory.cbl: The main COBOL
    source file.

    README.md: This documentation file.

## Author
    Oyewale Adeoye

# Skeleton Code

       IDENTIFICATION DIVISION.
       PROGRAM-ID. BUSINESS-APPLICATION.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT BUSINESS-FILE ASSIGN TO "business.dat"
               ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD BUSINESS-FILE.
       01 BUSINESS-RECORD.
           05 RECORD-ID       PIC 9(5).
           * TODO: Add more fields as needed for your business application

       WORKING-STORAGE SECTION.
       01 WS-EOF              PIC A(1).
       01 WS-MENU-CHOICE      PIC 9(1).
       * TODO: Add more working storage variables as needed

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM UNTIL WS-EOF = 'Y'
               DISPLAY "Business Application Menu"
               PERFORM DISPLAY-MENU
               ACCEPT WS-MENU-CHOICE
               EVALUATE WS-MENU-CHOICE
                   WHEN 1
                       PERFORM ADD-RECORD
                   WHEN 2
                       PERFORM UPDATE-RECORD
                   WHEN 3
                       PERFORM DELETE-RECORD
                   WHEN 4
                       PERFORM DISPLAY-RECORDS
                   WHEN 5
                       MOVE 'Y' TO WS-EOF
                   WHEN OTHER
                       DISPLAY "Invalid option, please try again"
               END-EVALUATE
           END-PERFORM
           STOP RUN.

       DISPLAY-MENU.
           DISPLAY "1. Add Record"
           DISPLAY "2. Update Record"
           DISPLAY "3. Delete Record"
           DISPLAY "4. Display Records"
           DISPLAY "5. Exit".

       ADD-RECORD.
           * TODO: Implement code to add a new record
           * 1. Accept input for each field in BUSINESS-RECORD
           * 2. Open BUSINESS-FILE in EXTEND mode
           * 3. WRITE BUSINESS-RECORD
           * 4. Close BUSINESS-FILE
           DISPLAY "Record added successfully".

       UPDATE-RECORD.
           * TODO: Implement code to update an existing record
           * 1. Accept RECORD-ID to update
           * 2. Open BUSINESS-FILE in I-O mode
           * 3. Read records until matching RECORD-ID is found
           * 4. Accept new values for fields to be updated
           * 5. REWRITE BUSINESS-RECORD
           * 6. Close BUSINESS-FILE
           DISPLAY "Record updated successfully".

       DELETE-RECORD.
           * TODO: Implement code to delete a record
           * 1. Accept RECORD-ID to delete
           * 2. Open BUSINESS-FILE in I-O mode
           * 3. Read records and write to a temporary file, excluding the record to delete
           * 4. Close both files
           * 5. Delete original file and rename temporary file
           DISPLAY "Record deleted successfully".

       DISPLAY-RECORDS.
           * TODO: Implement code to display all records
           * 1. Open BUSINESS-FILE in INPUT mode
           * 2. Read and display each record until end of file
           * 3. Close BUSINESS-FILE
           DISPLAY "End of records".





