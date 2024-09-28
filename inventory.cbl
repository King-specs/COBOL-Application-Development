       IDENTIFICATION DIVISION.
       PROGRAM-ID. INVENTORY-MANAGEMENT.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INVENTORY-FILE ASSIGN TO "inventory.dat"
               ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD INVENTORY-FILE.
       01 INVENTORY-RECORD.
           05 ITEM-ID        PIC 9(5).
           05 ITEM-NAME      PIC X(20).
           05 ITEM-QUANTITY  PIC 9(5).
           05 ITEM-PRICE     PIC 9(5)V99.
       
       WORKING-STORAGE SECTION.
       01 WS-EOF             PIC A(1).
       01 WS-ITEM-ID         PIC 9(5).
       01 WS-QUANTITY        PIC 9(5).
       01 WS-FOUND           PIC A(1).
       
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM UNTIL WS-EOF = 'Y'
               DISPLAY "Inventory Management System"
               PERFORM DISPLAY-MENU
               ACCEPT WS-EOF
               EVALUATE WS-EOF
                   WHEN '1'
                       PERFORM ADD-ITEM
                   WHEN '2'
                       PERFORM UPDATE-QUANTITY
                   WHEN '3'
                       PERFORM DISPLAY-INVENTORY
                   WHEN '4'
                       MOVE 'Y' TO WS-EOF
                   WHEN OTHER
                       DISPLAY "Invalid option, please try again"
               END-EVALUATE
           END-PERFORM
           STOP RUN.

       DISPLAY-MENU.
           DISPLAY "1. Add Item"
           DISPLAY "2. Update Quantity"
           DISPLAY "3. Display Inventory"
           DISPLAY "4. Exit".

       ADD-ITEM.
           DISPLAY "Enter Item ID:"
           ACCEPT ITEM-ID
           DISPLAY "Enter Item Name:"
           ACCEPT ITEM-NAME
           DISPLAY "Enter Quantity:"
           ACCEPT ITEM-QUANTITY
           DISPLAY "Enter Price:"
           ACCEPT ITEM-PRICE
           
           OPEN EXTEND INVENTORY-FILE
           WRITE INVENTORY-RECORD
           CLOSE INVENTORY-FILE
           DISPLAY "Item added successfully".

       UPDATE-QUANTITY.
           DISPLAY "Enter Item ID to update:"
           ACCEPT WS-ITEM-ID
           DISPLAY "Enter new quantity:"
           ACCEPT WS-QUANTITY
           
           MOVE 'N' TO WS-FOUND
           OPEN I-O INVENTORY-FILE
           PERFORM UNTIL WS-EOF = 'Y' OR WS-FOUND = 'Y'
               READ INVENTORY-FILE
                   AT END
                       MOVE 'Y' TO WS-EOF
                   NOT AT END
                       IF ITEM-ID = WS-ITEM-ID
                           MOVE WS-QUANTITY TO ITEM-QUANTITY
                           REWRITE INVENTORY-RECORD
                           MOVE 'Y' TO WS-FOUND
                       END-IF
               END-READ
           END-PERFORM
           CLOSE INVENTORY-FILE
           
           IF WS-FOUND = 'Y'
               DISPLAY "Quantity updated successfully"
           ELSE
               DISPLAY "Item not found"
           END-IF
           MOVE 'N' TO WS-EOF.

       DISPLAY-INVENTORY.
           OPEN INPUT INVENTORY-FILE
           MOVE 'N' TO WS-EOF
           PERFORM UNTIL WS-EOF = 'Y'
               READ INVENTORY-FILE
                   AT END
                       MOVE 'Y' TO WS-EOF
                   NOT AT END
                       DISPLAY "ID: " ITEM-ID 
                               " Name: " ITEM-NAME 
                               " Quantity: " ITEM-QUANTITY 
                               " Price: " ITEM-PRICE
               END-READ
           END-PERFORM
           CLOSE INVENTORY-FILE.
           
