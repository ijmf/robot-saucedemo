*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          https://www.saucedemo.com
${BROWSER}      headlesschrome
${USUARIO}      standard_user
${SENHA}        secret_sauce

*** Keywords ***
Abrir Navegador SauceDemo
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Fechar Navegador
    Close Browser

Fazer Login
    [Arguments]    ${usuario}=${USUARIO}    ${senha}=${SENHA}
    Input Text    id=user-name    ${usuario}
    Input Password    id=password    ${senha}
    Click Button    id=login-button

Adicionar Produto Ao Carrinho
    Wait Until Element Is Visible    class=btn_inventory
    Click Button    class=btn_inventory

Acessar Carrinho
    Click Element    class=shopping_cart_link