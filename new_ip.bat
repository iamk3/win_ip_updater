@echo off
cls
::Display list of interfaces on Machine
netsh interface show interface
pause
:: Set the IP info
set /p interface_name="Interface Name: "
set /p ip_address="IP Address: "
set /p subnet_mask="Subnet Mask: "
set /p default_gateway="Default Gateway: "
set /p dns_ip_1="DNS Address: "
:: Set IP Address
netsh interface ipv4 set address name="%interface_name%" static %ip_address% %subnet_mask% %default_gateway%
:: Set DNS info
netsh interface ipv4 set dns name="%interface_name%" static %dns_ip_1%
:: Display new information
netsh interface ipv4 show addresses %interface_name%
netsh interface ipv4 show config %interface_name%
echo NEW IP COMPLETE
pause
echo If the above info is incorrect, type ctrl+c to break the program.
echo otherwise Press any Key to continue
pause
cls
echo Press "s" to shutdown
echo Press "r" to reboot
echo Press "c" to complete the program
set /p end="Enter Selection: "
if /i "%end%"=="s" (
	goto SHUTDOWN
) else if /i "%end%"=="r" (
	goto REBOOT
) else (
    goto END
)
:: This command shuts down the Windows machine after a 20 second delay
:SHUTDOWN
echo SHUTTING DOWN NOW
pause
shutdown /s /t 20
goto END

:: This command reboots the Windows machine after a 20 second delay
:REBOOT
echo REBOOTING NOW
pause
shutdown /r /t 20
goto END

:: End the program
:END
echo Program completed. Exiting.
pause
exit /b