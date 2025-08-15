*** Settings ***
Library  BuiltIn 
Library    FakerLibrary    locale=pt_BR    seed=124

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

&{PESSOA}    name=Fulano Silva    email=fulano@teste.com    gender=Female    age=18

${DOMINIO}    teste.com
${LOCALE}    pt_BR

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

#CT03 - Teste usando subkeyword com argumentos
Teste 03 com subkeyword com argumento 
    Implementando subkeyword com argumento    Beltrano Costa    beltrano@teste.com
    Implementando subkeyword com argumento    ${PESSOA.name}    ${PESSOA.email}
    ${MENSAGEM_ALERTA}    Subkeyword com retorno    ${PESSOA.name}  ${PESSOA.age}
    Log    message=${MENSAGEM_ALERTA}

Implementando subkeyword com argumento
    [Arguments]    ${NOME_USUARIO}    ${EMAIL_USUARIO}
    Log    message=Nome usuário: ${NOME_USUARIO}
    Log    message=Email: ${EMAIL_USUARIO}

Subkeyword com retorno
    [Arguments]    ${NOME_USUARIO}    ${IDADE_USUARIO}
    ${MENSAGEM}    Set Variable If    ${IDADE_USUARIO}<18    Usuário ${NOME_USUARIO} é menor de idade.    OK! maior de idade, liberado
    RETURN   ${MENSAGEM}

Gerando email customizado
    [Arguments]    ${nome}    ${sobrenome}    
    ${LOCALE}=    FakerLibrary.Locale
    ${word}=    FakerLibrary.Word       
    ${email}    Set Variable    ${nome}${sobrenome}_${word}@${DOMINIO}
    RETURN    ${email}


*** Test Cases ***
CT01 - Imprimir lista
    [Tags]    Lista
    Imprimir lista no terminal
CT02 - Imprimir dicionário
    [Tags]    Dicionario
    Imprimir dicionario no terminar    

CT03 - Teste usando subkeyword com argumentos
    [Tags]    ComArgumento
    Teste 03 com subkeyword com argumento

CT04 - Gerar e-mail concatenando variaveis
    [Documentation]    Gerar email na liguagem português Brasil
    [Tags]    gerando_email
    ${email_gerado}=    Gerando email customizado    Fulano    Silva
    Log To Console    message=${\n}${email_gerado}
    Log To Console    message=${\n}Linguagem pais de origem: ${LOCALE}