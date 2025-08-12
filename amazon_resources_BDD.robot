*** Settings ***
Library  SeleniumLibrary
Resource  amazon_resources.robot

*** Variables ***
${URL}    http://www.amazon.com.br
${MENU_ELETRONICOS}   //a[contains(text(),'Eletrônicos')]
${HEADER_ELETRONICOS}    //h2[contains(.,'Eletrônicos e Tecnologia')]
${BUTTON_COMPRANDO}  //button[contains(., "Continuar comprando")]
# ${QUANTIDADE_PRODUTO_ADD_CARD}  1
# ${CARRINHO_VAZIO}  0

*** Keywords ***  
# CT01 - Acesso ao menu "Eletrônicos"
Dado que estou na home page do site Amazon.com.br
    Acessar a home page do site Amazon.com.br
Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"
E conter a frase "${FRASE}"
    Verificar a frase "${FRASE}"
E o título "${TITULO}"
    Verificar título "${TITULO}"
Então a categoria "${NOME_CATEGORIA}" estará visível
    Verificar a categoria "${NOME_CATEGORIA}"

# CT02 - Pesquisa de produto
# Dado que estou na home page do site Amazon.com.br -- comentei pois acusou erro de duplicidade de método
#     Acessar a home page do site Amazon.com.br
Quando Pesquisar o produto "Xbox Series S"
    Pesquisar o produto "Xbox Series S" 
E clicar btn Pesquisar
    Clicar btn Pesquisar
Então busca da lista de pesquisa "Xbox Series S" estará visível  
    Verificar busca da lista de pesquisa "Xbox Series S" 

# CT03 - Adicionar produto no carrinho
# Dado que estou na home page do site Amazon.com.br
Quando Pesquisar pelo produto "Xbox Series S"
    Pesquisar o produto "Xbox Series S" 
    Clicar btn Pesquisar
E adicionar o produto no carrinho
    Verificar busca da lista de pesquisa "Xbox Series S"
    Click Element    locator=//h2[@aria-label='Xbox Series S']
    Adicionar produto o carrinho
    Clicar botao sem garantia
Então o produto estará disponível para compra
    Verificar produto add carrinho


# CT04 - Remover produto carrinho
# Dado que estou na home page do site Amazon.com.br
Quando desistir de comprar um produto
    Pesquisar o produto "Xbox Series S" 
    Clicar btn Pesquisar
    Verificar busca da lista de pesquisa "Xbox Series S"
    Click Element    locator=//h2[@aria-label='Xbox Series S']
    Adicionar produto o carrinho
    Clicar botao sem garantia
Então poderei excluir do carrinho
    Clicar carrinho
    Excluir produto carrinho
    Verificar carrinho vazio