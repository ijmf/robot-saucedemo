*** Settings ***
Resource    ../resources/keywords.robot
Test Setup      Abrir Navegador SauceDemo
Test Teardown   Fechar Navegador

*** Test Cases ***

Login Com Credenciais Validas
    Fazer Login
    Location Should Contain    inventory
    
Login Com Senha Invalida
    Fazer Login    senha=senha_errada
    Wait Until Element Is Visible    class=error-message-container
    Element Should Be Visible    class=error-message-container

Login Com Usuario Bloqueado
    Fazer Login    usuario=locked_out_user
    Wait Until Element Is Visible    class=error-message-container
    Element Should Be Visible    class=error-message-container

Adicionar Produto Ao Carrinho
    Fazer Login
    Adicionar Produto Ao Carrinho
    Wait Until Element Is Visible    class=shopping_cart_badge
    Element Text Should Be    class=shopping_cart_badge    1

Remover Produto Do Carrinho
    Fazer Login
    Adicionar Produto Ao Carrinho
    Acessar Carrinho
    Wait Until Element Is Visible    class=cart_button
    Click Button    class=cart_button
    Element Should Not Be Visible    class=shopping_cart_badge

Checkout Completo Com Sucesso
    Fazer Login
    Adicionar Produto Ao Carrinho
    Acessar Carrinho
    Wait Until Element Is Visible    id=checkout
    Click Element    id=checkout
    Wait Until Element Is Visible    id=first-name
    Input Text    id=first-name    Ivan
    Input Text    id=last-name    Ferreira
    Input Text    id=postal-code    70000000
    Wait Until Element Is Visible    id=continue
    Click Element    id=continue
    Capture Page Screenshot    checkout_overview.png
    Wait Until Element Is Visible    id=finish    timeout=15s
    Click Button    id=finish
    Wait Until Element Is Visible    class=complete-header
    Element Text Should Be    class=complete-header    Thank you for your order!

Checkout Sem Preencher Campos
    Fazer Login
    Adicionar Produto Ao Carrinho
    Acessar Carrinho
    Wait Until Element Is Visible    id=checkout
    Click Element    id=checkout
    Wait Until Element Is Visible    id=continue
    Click Button    id=continue
    Wait Until Element Is Visible    class=error-message-container
    Element Should Be Visible    class=error-message-container