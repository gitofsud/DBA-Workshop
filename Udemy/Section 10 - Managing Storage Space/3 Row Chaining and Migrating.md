# Row Chaining and Migrating

In two circumstances, the data for a row in a table may be too large to fit into a single data block:

* First case - the row is too large into one data block when it is first inserted. In this case, Oracle stores the data for the row in a chain of data blocks (one or more) reserved for that segment. Row changing most often occurs with large rows, such as rows that contain a column of datatype LONG or LONG RAW. Row changing in these cases is unavoidable.

* Second case - a row that originally fit into one data block is updated so that the overall row length increases, and the block's free space is already completely filled.

* Note - When a row is chainged or migrated, I/O performance associated with this row decreases because Oracle must scan more than one data block to retrieve the information for the row.