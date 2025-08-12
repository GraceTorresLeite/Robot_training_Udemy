*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}    http://www.amazon.com.br
${MENU_ELETRONICOS}   //a[contains(text(),'Eletrônicos')]
${HEADER_ELETRONICOS}    //h2[contains(.,'Eletrônicos e Tecnologia')]
${BUTTON_COMPRANDO}  //button[contains(., "Continuar comprando")]
${QUANTIDADE_PRODUTO_ADD_CARD}  1
${CARRINHO_VAZIO}  0

*** Keywords ***
Abrir o navegador    
    Open Browser  browser=chrome  options=add_experimental_option("detach", True)       #esse options evita fechar a aba no final do teste nessa library
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser 

Botao comprar visivel
    Wait Until Element Is Visible  ${BUTTON_COMPRANDO}
Acessar a home page do site Amazon.com.br
    Go To   ${URL}
    ${botao_visivel}=    Run Keyword And Return Status    Botao comprar visivel
    
    IF    ${botao_visivel} 
    Clicar btn comprando
    ELSE  
    Sleep    25s
    Wait Until Element Is Visible    ${MENU_ELETRONICOS}
    END   

Entrar no menu "Eletrônicos"
    Sleep    10s
    Click Element    ${MENU_ELETRONICOS}

Verificar a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    ${HEADER_ELETRONICOS}
    
Verificar título "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//*[@id="s-refinements"]/div[1]/ul/li[6]/span/a/span[contains(.,'${NOME_CATEGORIA}')]
    
Pesquisar o produto "${PRODUTO}"
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}

Clicar btn Pesquisar
    Click Element    locator=nav-search-submit-button

Clicar btn comprando
    Click Button    locator=${BUTTON_COMPRANDO}
Verificar busca da lista de pesquisa "${PRODUTO}"
    Sleep    15s
    Wait Until Element Is Visible    locator=//h2[@aria-label='Xbox Series S']

Adicionar produto o carrinho
    Click Element    locator=add-to-cart-button   #id

Clicar botao sem garantia
    Wait Until Element Is Visible  locator=//*[@id="attachSiNoCoverage"]/span/input
    Click Element    locator=//*[@id="attachSiNoCoverage"]/span/input

Verificar produto add carrinho
    Wait Until Element Is Visible    locator=//*[@id="nav-cart-count"][contains(.,'${QUANTIDADE_PRODUTO_ADD_CARD}')]

Sair modal adicionado produto
    Click Element    locator=attach-close_sideSheet-link
Clicar carrinho
    Click Element    locator=nav-cart
Excluir produto carrinho
    Click Button    locator=//button[@data-a-selector='decrement']

Verificar carrinho vazio
    Wait Until Element Is Visible    locator=//*[@id="nav-cart-count"][contains(.,'${CARRINHO_VAZIO}')]


   
    