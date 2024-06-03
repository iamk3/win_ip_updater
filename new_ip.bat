@echo off
:: Set the IP info. Usage
:: netsh interface ipv4 set addres name="<interface_name>" static <IP_address> <Subnet_mask> <Default_gateway>
netsh interface ipv4 set address name="DO NOT MODIFY" static 10.251.100.202 255.255.255.0 10.251.100.220
:: Set DNS info. Usage
:: netsh interface ipv4 set dns name="<interface_name>" static <dns_ip_address>
netsh interface ipv4 set dns name="DO NOT MODIFY" static 10.251.100.220
:: These next commands display the new information as configured,
:: print "NEW IP COMPLETE" to the terminal, and pause the script
netsh interface ipv4 show addresses "DO NOT MODIFY"
netsh interface ipv4 show config "DO NOT MODIFY"
echo NEW IP COMPLETE
pause
:: If the configured information is incorrect, break the
echo If the above info is incorrect, type <ctrl> c to break the program.
echo otherwise Press any Key to continue
pause
echo SHUTTING DOWN NOW - Press any Key
pause
:: This command shuts down the Windows machine with a 5 second delay
shutdown /s /t 5