# Managing Storage Space

* The DB server tracks space utilization while performing regular space management activities.
* This information is aggregated by **MMON** process.
* An alert is triggered when the threshold for a tablespace has been reached or cleared.

### DBMS_SERVER_ALERT

* This package enables you to config the Oracle DB server to issue an alert when a threshold for a specified server metric has been violated.
* You can configure both warning and critical thresholds for a large number of predefined metrics, - **tablespace_pct_full** metric
* If a warning thresold is reached, the server generates a security level 5 alert. If a critical threshold is reached, the server generates a severity level 1 alert.

### Monitoring

* Read only and offline tablespaces - Do not set up alerts
* Temporary tablespace - Threshold corresponds to space currently used by sessions
* Undo tablespace - Threshold corresponds to space used by active and unexpired extents
* Auto-extensible files - Threshold is based on maximum file size

### Resolving

* Resolve space usage issues by:
    - Adding or resizing datafiles
    - Setting AUTOEXTEND to ON
    - Shrinking objects
    - Reducing UNDO_RETENTION
* Check for long-running queries in temporary tablespaces