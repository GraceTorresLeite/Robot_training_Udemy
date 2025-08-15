*** Settings ***
Documentation    Exemplo didático para exemplificar o uso de LOGs nos testes 
Library    SeleniumLibrary
*** Variables ***
@{FRUTAS}    maça    banana    uva    abacaxi  

*** Test Cases ***
CT01 - Exemplo 01
    Usando LOG para mensagens
    Usando LOG console
    Usando screenshots

*** Keywords ***
Usando LOG para mensagens
    Log       Minha mensagem de LOG 
    ${VAR}    Set Variable    variável qualquer
    Log       Posso logar uma ${VAR} no meio de um log
Usando LOG console
    Log To Console    Posso logar na saída do console
    Log Many          Posso logar minha lista completa @{FRUTAS}
    Log               Posso logar somente itens da minha lista ${FRUTAS[0]} - ${FRUTAS[3]}

Usando screenshots
    Log    Em testes web, podemos logar Screenshot com a SeleniumLibrary
    Open Browser    http://www.robotizandotestes.blogspot.com.br     chrome 
    Capture Page Screenshot    nome_da_minha_captura.png
    Close Browser 
   