*** Settings ***
Resource            base.robot

Test Setup          Inicio Sessão
Test Teardown       Encerra Sessão


*** Variables ***
#Commom Variables for all testes
${search_field}             id:h_search-input
${search_btn}               id:h_search-btn 
${prod_list}                xpath:.//div[contains(@spacing, 'object Object')]
${addToCar_btn}             id:btn-buy 
${continueToCar_btn}        id:btn-continue
${link_prod}                xpath:.//a[contains(@class, 'link-default clearfix')]


#Specific Variables for Test 'Selecionar produto em Mapa do Site'
${maps_site}                xpath:.//a[contains(@class, 'mmn-link')]
${maps_cell}                xpath:.//span[contains(text(), 'Celulares')]
${maps_ipad}                xpath:.//a[contains(@href, '/categoria/celulares-e-smartphones/smartphone/iphone?')]

#Specific Variables for Test 'Selecionar produto por sugestão'
${element_suggest}          xpath:.//li[contains(@class, 'as-lst-it sz sz-1')]

*** Test Cases ***
Buscar produto pela barra de pesquisa
    Input Text                          ${search_field}              Iphone 11
    Press Keys                          ${search_btn}                Enter
    Sleep                               3
    ${target}=                          Get WebElement               xpath:.//a[contains(@href,'/produto/360562525?')]
    Should Contain                      ${target.text}               $  iPhone 11
    Click Element                       ${target}
    Sleep                               3
    Scroll Element Into View            ${addToCar_btn}
    Wait Until Element Is Visible       ${addToCar_btn}             
    Click Element                       ${addToCar_btn}
    Wait Until Element Is Visible       ${continueTocar_btn}              
    Click Element                       ${continueToCar_btn}
    Sleep                               3 
    Page Should Contain Link            ${link_prod}



Selecionar produto em Mapa do Site
    Click Element                       ${maps_site}
    Set Focus To Element                ${maps_site}
    Wait Until Element Is Visible       ${maps_site}
    Mouse Over                          ${maps_cell}
    Sleep                               5
    Wait Until Element Is Visible       ${maps_ipad}
    Click Link                          ${maps_ipad}
    Wait Until Element Is Visible       ${prod_list}
    Scroll Element Into View            ${addToCar_btn}
    Wait Until Element Is Visible       ${addToCar_btn}
    Click Element                       ${addToCar_btn}  
    Wait Until Element Is Visible       ${continueTocar_btn}            
    Click Element                       ${continueToCar_btn}
    Sleep                               3 
    Page Should Contain Link            ${link_prod}



Selecionar produto por sugestão
    Click Element                       ${search_field}
    Input Text                          ${search_field}              Iphone 11
    Wait Until Element Is Visible       ${element_suggest} 
    Click Element                       ${element_suggest} 
    Scroll Element Into View            ${addToCar_btn}
    Wait Until Element Is Visible       ${addToCar_btn}
    Click Element                       ${addToCar_btn}
    Wait Until Element Is Visible       ${continueTocar_btn}              
    Click Element                       ${continueToCar_btn}
    Sleep                               3 
    Page Should Contain Link            ${link_prod}