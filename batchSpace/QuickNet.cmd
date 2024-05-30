@echo off

@REM [Set IP Address, Subnet Mask, Default Gateway, DNS Server]
set "ip_to_static=192.168.0.0"
set "subnet_mask=255.255.255.0"
set "default_gateway=192.168.0.11"
set "dns_server=8.8.8.8"
set "alt_dns_server=8.8.4.4"

@REM [Set Interface Name]
set "interface_name=Ethernet0"

@REM [Developer variables]
set "developer=KARTHIK LAL"
set "email=dev@karthiklal.in"
set "author-website=https://karthiklal.in"
set "project=QuickNet"
set "version=2.0.0"
set "created-date=2022-08-15"
set "copy-right=(C) 2022-2023 %developer%"

@REM  .d88888b.           d8b          888      888b    888          888    
@REM d88P" "Y88b          Y8P          888      8888b   888          888    
@REM 888     888                       888      88888b  888          888    
@REM 888     888 888  888 888  .d8888b 888  888 888Y88b 888  .d88b.  888888 
@REM 888     888 888  888 888 d88P"    888 .88P 888 Y88b888 d8P  Y8b 888    
@REM 888 Y8b 888 888  888 888 888      888888K  888  Y88888 88888888 888    
@REM Y88b.Y8b88P Y88b 888 888 Y88b.    888 "88b 888   Y8888 Y8b.     Y88b.  
@REM  "Y888888"   "Y88888 888  "Y8888P 888  888 888    Y888  "Y8888   "Y888 
@REM        Y8b                                                             

@REM Set Title is needed cuz of the way the console is displayed
title %project% - %version% - %developer%

@REM Check permission to continue the script
goto CHECK_PERMISSIONS

:CHECK_PERMISSIONS
echo Checking for administrator permissions..

@REM Administrator permission is required to run this script
net session >nul 2>&1
if %errorLevel% == 0 (
    color 0A
	echo Success, You are running this script as administrator 
    cls
) else ( 
    color 0C
	echo Error, You are not running this script as administrator
    echo.
    echo Please run this script as administrator
    echo.
    echo Press any key to exit...
    pause >nul 2>&1
    exit /b 1
)

@REM Developer information
:DEVELOPER_INFO
color 1F
echo ====================================
echo   %project% by %developer%
echo ====================================
echo.
echo Developer      :  %developer%
echo Version        :  %version%
echo Created Date   :  %created-date%
echo Purpose        :  %project% - To quickly change IP address to static or dynamic (Office/Home)
echo.

@REM Ask user to select the type of IP address to use (static or dynamic)
:START_SCRIPT
echo Select (1) for Using Internet on Home and (2) for Using Internet on Office
echo.
set /p ip_type=Type: 1/2:

@REM If user selects 1, run this command to change ip_to_static
if %ip_type%==1 (
	netsh interface ipv4 set address name="%interface_name%" source=dhcp
	echo Done setting IP address to dynamic...
	timeout /t 1
	cls
	echo Now you can use internet on Home Network!
	goto END_SCRIPT
) else (
@REM If user selects 2, run this command to change ip_to_dynamic
	netsh interface ipv4 set address name="%interface_name%" static %ip_to_static% %subnet_mask% %default_gateway%
	echo Done setting IP address to static...
@REM netsh interface ip set dns name="%interface_name%" static "%dns_server%" primary
@REM netsh interface ip add dns name="%interface_name%" "%alt_dns_server%" index=2
@REM echo Done setting DNS server to %dns_server% and %alt_dns_server%
	timeout /t 1
	cls
	echo Now you can use internet on Office Network!
	goto END_SCRIPT
)

:END_SCRIPT
echo =================================
echo   %project% TOOL by %developer%
echo =================================
echo.
echo - DEVELOPER : %developer%
echo - EMAIL		 : %email%
echo - WEBSITE 	 : %author-website%
echo - VERSION 	 : %version%
echo - CREATED DATE : %created-date%
echo.
echo - Opensource Software License agreement for windows distribution system (https://www.gnu.org/licenses/gpl-3.0.en.html)
echo - Copying and distribution of this file, with or without modification, are permitted in any medium without royalty provided the copyright notice and this notice are preserved.
echo - Copyright %copy-right%
echo.
pause