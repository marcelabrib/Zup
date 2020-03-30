*** Settings ***
Library             SeleniumLibrary


*** Variables ***
${url}                  https://www.submarino.com.br


*** Keywords ***
Inicio Sessão
    OpenBrowser                         ${url}          chrome
    Set Window Size                     1366            768          
    Maximize Browser Window

    
Encerra Sessão
    CloseBrowser
