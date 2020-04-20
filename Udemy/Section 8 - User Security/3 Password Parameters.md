# Password Parameters

1. **Account Locking**
    * Enables automatic locking of accounts for a set duration when users fail to log in to the system in specified number of attempts or when accounts sit inactive for a pre-defined number of days
    * Parameters
        - FAILED_LOGIN_ATTEMPTS
        - PASSWORD_LOCK_TIME
        - INACTIVE_ACCOUNT_TIME

2. **Password aging and expiration**
    * Enables user passwords to have a lifetime, after which the passwords expire and must be changed
    * Parameters
        - PASSWORD_LIFE_TIME
        - PASSWORD_GRACE_TIME

3. **Password History**
    * Checks new password to ensure that the password is not reused for a specified amount of time or a specified number of password changes
    * Parameters
        - PASSWORD_REUSE_TIME
        - PASSWORD_REUSE_MAX

4. **PASSWORD_VERIFY_FUNCTION**
    - Checks complexity of password