password        [success=1 default=ignore]      pam_unix.so obscure yescrypt minlen=15 minclass=4 remember=3 onerr=fail deny=5 unlock_time=900 
password        requisite                       pam_deny.so
password        required                        pam_permit.so


