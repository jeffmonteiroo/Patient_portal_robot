
***Settings***
Documentation       Aqui teremos as Keyword's helpers

Resource        ../resources/base.robot
***Variables***

${USER}                 xpath=//input[@autocomplete="username"]           
${PASS}                 xpath=//input[@type="password"]
${LOGIN}                xpath=//button[@type="submit"]
${USER_PACIENTE}        jeff@mozij.com
${SENHA}                T@sy1234

****Keywords***
Login do Paciente
    Valida Sessão
    Input Text                          ${USER}                 ${USER_PACIENTE} 
    Input Password                      ${PASS}                 ${SENHA} 
    Click Element                       ${LOGIN}
            
Acessar a tela de cadastro do paciente 
    Set Appium Timeout                 60
    Wait Until Element Is Visible      xpath=//button[@class="c-button c-button--lg c-button--secondary c-button--icon-left"]      30
    Click Element                      xpath=//button[@class="c-button c-button--lg c-button--secondary c-button--icon-left"]  
    Set Appium Timeout                 60
    Wait Until Element Is Visible      xpath=//div[@class="c-contextual-bar__header-top"] 
    Sleep                               2
              
