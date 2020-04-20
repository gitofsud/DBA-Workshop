# System Global Area

It is a group of shared memory structures that contain data and control information for one database instance

## Shared Pool

- Cache non user data like Data dictionary
- Store cache information about each SQL statement that is executed, like execution plan

## Database buffer cache

- Responsible for caching user data
- Buffer cache caches frequently accessed DB data to memory
- All users who are concurrently connected to DB share a single DB buffer cache

## Redo Log Buffer

- Circular buffer that holds information about changes made to DB
- Designed to store redo entries
- Redo Log entries in Redo Log buffer, written in periodic basis to a set of files in our Oracle DB known as Redo logs files

## Large Pool

- Contains memory used by special oracle features
    * Shared server processes
    - Parallel queries
    - DB backup and recovery operations
    - I/O server processes

## Extras

- Java Pool
- Streams Pool
- Fixed SGA - General info about DB and Instance

## Sizing PGA & SGA

There are two ways

1. Automatic
2. Manual