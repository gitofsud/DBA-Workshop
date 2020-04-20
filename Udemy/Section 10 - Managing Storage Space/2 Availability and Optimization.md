# Availability and Optimization of Free Space in Data Block

* Two types of statements can increase the free space of one or more data blocks:
    1. DELETE statements
    2. UPDATE statements hat

* The released space from these types of statements is available for subsequent INSERT statements under the following conditions:

    - If INSERT statement is in same transaction and subsequent to statement that frees space, then the INSERT statement can use space made available

    - If INSERT statement is in a seperate transaction from the statement that frees space (perhaps being run by another user), then the INSERT statement can use the space made available only after the other transaction commits and only if the space is needed.

* Oracle Database automatically and transparently coalesces the free space of a data block only when the following conditions are true:

    - An INSERT or UPDATE statement attempts to use a block that contains sufficient free space to contain a new row piece.

    - The free space is fragmented so that the row piece cannot be inserted in a contiguous section of the block.