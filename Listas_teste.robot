*** Settings ***
Library  BuiltIn 

*** Variables ***
@{ANO}  JAN  FEV  MAR  ABR  MAI  JUN  JUL  AGO  SET  OUT  NOV  DEZ   

&{ANO_MesesComDias}  
...  JAN=31  
...  FEV=28  
...  MAR=31  
...  ABR=30  
...  MAI=31  
...  JUN=30  
...  JUL=31  
...  AGO=31  
...  SET=30  
...  OUT=31  
...  NOV=30  
...  DEZ=31

*** Keywords ***
#CT01 - Imprimir lista
Imprimir lista no terminal
    Log To Console    message= Meses do ano @{ANO} 

#CT02 - Imprimir dicionário
Imprimir dicionario no terminar
    Log To Console    message= Janeiro tem ${ANO_MesesComDias["JAN"]} dias 
    Log To Console    message= Fevereiro tem ${ANO_MesesComDias["FEV"]} dias 
    Log To Console    message= Março tem ${ANO_MesesComDias["MAR"]} dias 
    Log To Console    message= Abril tem ${ANO_MesesComDias["ABR"]} dias 
    Log To Console    message= Maio tem ${ANO_MesesComDias["MAI"]} dias 
    Log To Console    message= Junho tem ${ANO_MesesComDias["JUN"]} dias 
    Log To Console    message= Julho tem ${ANO_MesesComDias["JUL"]} dias 
    Log To Console    message= Agosto tem ${ANO_MesesComDias["AGO"]} dias 
    Log To Console    message= Setembro tem ${ANO_MesesComDias["SET"]} dias 
    Log To Console    message= Outubro tem ${ANO_MesesComDias["OUT"]} dias 
    Log To Console    message= Novembro tem ${ANO_MesesComDias["NOV"]} dias 
    Log To Console    message= Dezembro tem ${ANO_MesesComDias["DEZ"]} dias 

*** Test Cases ***
CT01 - Imprimir lista
    [Tags]    Lista
    Imprimir lista no terminal
CT02 - Imprimir dicionário
    [Tags]    Dicionario
    Imprimir dicionario no terminar    