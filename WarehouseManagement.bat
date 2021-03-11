@@ECHO OFF
@ ASSOC .mdb=Access.Application.11
MKDIR C:\Temp

IF EXIST "C:\Temp\WarehouseManagement.mdb" DEL "C:\Temp\WarehouseManagement.mdb"

copy "\\jd-002\access$\Programs\WarehouseManagement.mdb" "C:\Temp"

IF EXIST "C:\WINDOWS" GOTO ADDXPCOMPONENTS
IF EXIST "C:\WINNT" GOTO ADDCOMPONENTS

:ADDXPCOMPONENTS
IF EXIST "C:\WINDOWS\system32\mscomct2.ocx" GOTO RUNPROGRAMS
COPY "\\jd-002\access$\Deployment\Components\MSCOMCT2.DEP" "C:\WINDOWS\system32"
COPY "\\jd-002\access$\Deployment\Components\MSCOMCT2.oca" "C:\WINDOWS\system32"
COPY "\\jd-002\access$\Deployment\Components\mscomct2.ocx" "C:\WINDOWS\system32"
GOTO RUNPROGRAMS

:ADDCOMPONENTS
IF EXIST "C:\WINNT\system32\mscomct2.ocx" GOTO RUNPROGRAMS
COPY "\\jd-002\access$\Deployment\Components\MSCOMCT2.DEP" "C:\WINNT\system32"
COPY "\\jd-002\access$\Deployment\Components\MSCOMCT2.oca" "C:\WINNT\system32"
COPY "\\jd-002\access$\Deployment\Components\mscomct2.ocx" "C:\WINNT\system32"
GOTO RUNPROGRAMS

:RUNPROGRAMS
START C:\Temp\WarehouseManagement.mdb
EXIT