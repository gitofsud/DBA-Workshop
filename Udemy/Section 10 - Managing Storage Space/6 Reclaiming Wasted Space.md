# Reclaiming Wasted Space

* **Fragmented Free Space** 
    - Over time, updates and deletes on objects within a tablespace can create pockets of empty space that individually are not large enough to be reused for new data. Empty space is referred to as Fragmented Free Space.
    - Objects with fragmented free space can result in much wasted space, and can impact database performance
    - The preferred way to defragment and reclaim this space is to perform an online segment shrink

* Usage
    - First - Will move data to before, but High Water Mark will remain same

            ALTER TABLE employees SHRINK SPACE COMPACT;

    - Second - Will move High Water Mark to last used space

            ALTER TABLE employees SHRINK SPACE;


## Segmented Advisor

* We use Segment Advisor to identify segments that would benefit from online segment shrink

* Only segments in locally managed tablespaces with automatic segment space management (ASSM) are eligible

* **Segment Advisor** can be automatic or manual

* Running the Segment Advisor Manually with PL/SQL using package DBMS_ADVISOR

** DBMS_ADVISOR package procedures relevant to the Segment Advisor
    - CREATE_TASK
    - CREATE_OBJECT
    - SET_TASK_PARAMETER
    - EXECUTE_TASK