# Dynamic Performance Views (v$views)

* Are a set of underlying views maintained by server and accessible to DBA user SYS

* They are continuously updated while DB is in use

* Contents relate primarily to performance

* Identified by prefix V$

* Used by Enterprise Manager and Oracle Trace, primary interface for accessing information about system performance

* Once instance is started, 
    - V$ views that read from memory are accessible
    - Views that read data from disk require DB be mounted

