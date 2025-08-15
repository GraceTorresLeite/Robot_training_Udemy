*** Settings ***
Documentation    Exemplo didático para exemplificar o uso de LOGs nos testes 
*** Variables ***
@{FRUTAS}    maça    banana    uva    abacaxi    morango    laranja

*** Test Cases ***
CT01 - REPEAT KEYWORD
    [Documentation]    Chama a mesma keyword várias vezes
    Usando Repeat Keyword

CT02 - FOR do tipo IN RANGE 
    [Documentation]    Faz um loop dentro de um intervalo
    Usando FOR IN RANGE

CT03 - FOR do tipo IN 
    [Documentation]    Faz um loop percorrendo a lista informada
    Usando FOR IN

CT04 - FOR do tipo IN ENUMERATE
    [Documentation]    Faz um loop percorrendo os índices da lista informada
    Usando FOR IN ENUMERATE

CT05 - Saindo do FOR
    [Documentation]    Controla o momento em que a condição é verdadeira e encerra o loop
    Usando EXIT FOR LOOP IF

*** Keywords ***
Usando Repeat Keyword
    Log To Console    ${\n}
    Repeat Keyword    6x    Log    message=Repetições!!!!
    Repeat Keyword    6x    Log To Console  message=Repetições!!!!
Usando FOR IN RANGE
    Log To Console    message=${\n}
    FOR    ${counter}    IN RANGE    0    5    2       # o 2 diz que vai rodar de 2 em 2  
        Log To Console    message=Minha posição é: ${counter}
        Log   message=Minha posição é: ${counter}
    END
Usando FOR IN
    Log To Console    ${\n}
    FOR    ${element_fruta}    IN    @{FRUTAS}
        Log To Console    A fruta é: ${element_fruta}
        No Operation
    END
Usando FOR IN ENUMERATE
    Log To Console    ${\n}
    FOR    ${index}    ${element_FRUTA}    IN ENUMERATE    @{FRUTAS}
        Log    Minha fruta está no índice: ${index} e seu nome é : ${element_FRUTA}
        Log To Console    Minha fruta está no índice: ${index} e seu nome é : ${element_FRUTA}
        No Operation
    END
Usando EXIT FOR LOOP IF
    Log To Console    ${\n}
    Log To Console    ${\n}
    FOR    ${index}    ${element_FRUTA}    IN ENUMERATE    @{FRUTAS}
        Log    Minha fruta está no índice: ${index} e seu nome é : ${element_FRUTA}
        Log To Console    Minha fruta está no índice: ${index} e seu nome é : ${element_FRUTA}
        Exit For Loop If    '${element_FRUTA}' == 'uva'
    END
