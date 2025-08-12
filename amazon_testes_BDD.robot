*** Settings ***
Documentation  Essa suite testa o site da Amazon.com.br
Resource  amazon_resources.robot
Resource  amazon_resources_BDD.robot
Test Setup  Abrir o navegador
Test Teardown  Fechar o navegador

*** Test Cases ***
CT01 - Acesso ao menu "Eletrônicos"
    [Documentation]  Esse teste verifica o menu eletronico
    ...              e verifica categoria Computador
    [Tags]           menus  categoria
    Dado que estou na home page do site Amazon.com.br
    Quando acessar o menu "Eletrônicos"
    E conter a frase "Eletrônicos e Tecnologia"
    E o título "Eletrônicos e Tecnologia | Amazon.com.br"
    Então a categoria "Computadores e Informática" estará visível

CT02 - Pesquisa de produto
    [Documentation]  Esse teste verifica a busca de produto
    [Tags]           busca_produtos  lista_busca
    Dado que estou na home page do site Amazon.com.br
    Quando Pesquisar o produto "Xbox Series S"
    E clicar btn Pesquisar
    Então busca da lista de pesquisa "Xbox Series S" estará visível

CT03 - Adicionar produto no carrinho
    [Documentation]  Valida produto add no carrinho
    [tags]           card 
    Dado que estou na home page do site Amazon.com.br
    Quando Pesquisar pelo produto "Xbox Series S"
    E adicionar o produto no carrinho
    Então o produto estará disponível para compra

CT04 - Remover produto carrinho
    [Documentation]  Valida produto removido do carrinho
    [Tags]           remove 
    Dado que estou na home page do site Amazon.com.br
    Quando desistir de comprar um produto
    Então poderei excluir do carrinho



