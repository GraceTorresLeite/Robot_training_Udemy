*** Settings ***
Documentation    Exemplo didático para exemplificar o uso dos IFs nos testes
Test Setup    Log To Console    ${\n}
Test Teardown    Log To Console    ${\n}

*** Variables ***
${STATUS}    ${10}

*** Test Cases ***
CT01 - Exemplo bloco IF
    IF    ${STATUS} > 0
        Logar quando status maior que zero
        Log    message=OK! condição verdadeira.
    END

CT02 - Exemplo bloco IF e ELSE
    IF    ${STATUS} > 0
        Logar quando status maior que zero
        Log    message=OK! condição verdadeira.
    ELSE    
        Logar quando status menor que zero
        Log    message=OPS! condição falsa.
    END

CT03 - Exemplo bloco IF e ELSE
    ${STATUS}    Set Variable    ${-10}
    IF    ${STATUS} > 0
        Logar quando status maior que zero
        Log    message=OK! condição verdadeira.
    ELSE    
        Logar quando status menor que zero
        Log    message=OPS! condição falsa.
    END

CT04 - Exemplo bloco ifs alinhados IF e ELSE IF
    IF    ${STATUS} > 0
        Logar quando status maior que zero
        Log    message=OK! condição verdadeira.
    ELSE IF    ${STATUS} < 0
        Logar quando status menor que zero
        Log    message=OPS! condição falsa.
    ELSE IF    ${STATUS} == 0
        Logar quando status igual a zero
        Log    message=Zerouuu! condição igual a Zero.
    ELSE    
        IF   ${STATUS} == ${EMPTY}
            Fail    O Status está vazio!
        ELSE
            Fail    O Status está com valor desconhecido: ${STATUS}!
        END
    END

*** Keywords ***
Logar quando status maior que zero
    Log    O Status [${STATUS}] é maior que zero!
    Log To Console    O Status [${STATUS}] é maior que zero!
Logar quando status menor que zero
    Log    O Status [${STATUS}] é menor que zero!
    Log To Console    O Status [${STATUS}] é menor que zero!
Logar quando status menor ou igual a zero
    Log    O Status [${STATUS}] é menor ou igual a zero!
    Log To Console    O Status [${STATUS}] é menor ou igual a zero!
Logar quando status igual a zero
    Log    O Status [${STATUS}] é igual a zero!
    Log To Console    O Status [${STATUS}] é igual zero!
