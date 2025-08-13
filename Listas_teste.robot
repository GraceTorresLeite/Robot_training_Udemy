*** Settings ***
Library  BuiltIn 

*** Variables ***
@{ANO}  JAN  FEV  MAR  ABR  MAI  JUN  JUL  AGO  SET  OUT  NOV  DEZ   

*** Keywords ***
#CT01 - Imprimir lista
Imprimir lista no terminal
    Log To Console    message= Meses do ano @{ANO} 

*** Test Cases ***
CT01 - Imprimir lista
    Imprimir lista no terminal
    