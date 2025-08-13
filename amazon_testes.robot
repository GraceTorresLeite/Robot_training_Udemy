*** Settings ***
Documentation  Essa suite testa o site da Amazon.com.br
Resource  amazon_resources.robot
Test Setup  Abrir o navegador
Test Teardown  Fechar o navegador

*** Test Cases ***
CT01 - Acesso ao menu "Eletrônicos"
    [Documentation]  Esse teste verifica o menu eletronico
    ...              e verifica categoria Computador
    [Tags]           menus  categoria
    Acessar a home page do site Amazon.com.br
    Entrar no menu "Eletrônicos"
    Verificar a frase "Eletrônicos e Tecnologia"
    Verificar título "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar a categoria "Computadores e Informática"

CT02 - Pesquisa de produto
    [Documentation]  Esse teste verifica a busca de produto
    [Tags]           busca_produtos  lista_busca
    Acessar a home page do site Amazon.com.br
    Pesquisar o produto "Xbox Series S"
    Clicar btn Pesquisar
    Verificar busca da lista de pesquisa "Xbox Series S"

CT03 - Adicionar produto no carrinho
    [Documentation]  Valida produto add no carrinho
    [tags]           card 
    Acessar a home page do site Amazon.com.br
    Pesquisar o produto "Xbox Series S"
    Clicar btn Pesquisar
    Verificar busca da lista de pesquisa "Xbox Series S"
    Click Element    locator=//h2[@aria-label='Xbox Series S']
    Adicionar produto o carrinho
    Clicar botao sem garantia
    Verificar produto add carrinho

CT04 - Remover produto carrinho
    [Documentation]  Valida produto removido do carrinho
    [Tags]           remove 
    Acessar a home page do site Amazon.com.br
    Pesquisar o produto "Xbox Series S"
    Clicar btn Pesquisar
    Verificar busca da lista de pesquisa "Xbox Series S"
    Click Element    locator=//h2[@aria-label='Xbox Series S']
    Adicionar produto o carrinho
    Clicar botao sem garantia
    Sleep    10s 
    Clicar carrinho
    Excluir produto carrinho
    Verificar carrinho vazio


