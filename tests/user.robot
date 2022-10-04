***Settings***

Resource        ../resources/base.robot

# Executa a kw antes de cada teste case
Test Setup      Open Session

# Executa a kw depois de cada teste case
Test Teardown   Close Session

***Variables***

${CAMPOCPF}                     xpath=//div[@uuid="6d59a006-9ba3-4a87-a35d-d79c1caf22d2"]/div/div/input 
${CAMPORG}                      xpath=//div[@uuid="aae84ce1-2626-4236-a4a6-a0207c31d3ab"]/div/div/input 
${CAMPOTELEFONE}                xpath=//div[@uuid="65d757aa-465e-45a1-a07c-2ca887767603"]/div/div[2]/div/input
${BOTAOPROXIMO}                 xpath=//button[contains(@class,"c-button c-button--primary c-button--icon-right c-wizard__header-next")]
${CAMPONOME}                    xpath=//div[@uuid="95d99f38-34aa-4023-9dd1-7dc4776bc9e0"]/div/div/input
${CAMPODATANASC}                xpath=//div[@uuid="719fa2d4-2acd-40ab-a9d2-cf288165fac6"]/div[1]/div/div/div/div/div/input
${CAMPOSEXO}                    xpath=//div[@uuid="b55288d5-8b45-464a-a6aa-89f8dfb27152"]
${SEXOFEMININO}                 xpath=//div[@uuid="f281b1c8-0406-4441-9bc5-a1fc4f8dc157"]/div[2] 
${PASSO3}                       xpath=//div[@uuid="71f829ea-43d0-487e-8b6f-96cfa899b4cb"]
${SELECIONAEMAIL}               xpath=//ul[@class="c-radio-group__items"]/li[2]
${CAMPOEMAIL}                   xpath=//div[@uuid="71f829ea-43d0-487e-8b6f-96cfa899b4cb"]/div/div/input
${CONFIRMAEMAIL}                xpath=//div[@uuid="c24b82c3-1c76-43f7-b08f-6d9318d4b787"]/div/div/input 
${CAMPOUSERNAME}                xpath=//div[@uuid="ef5755d8-4883-43f5-b55d-2cb70e21e56a"]/div/div/input 
${CAMPOSENHA}                   xpath=//div[@uuid="04b72622-783c-40bd-895f-b614bfab033a"]/div/div/input
${CAMPOCONFIRMASENHA}           xpath=//div[@uuid="0987f603-7b92-4102-948d-ab5aa2315ac7"]/div/div/input
${ACEITATERMO}                  xpath=//label[@for="check-f98d13aa-de60-4663-961d-5c87b37732b2"]
${VERIFICATERMOMARCADO}         xpath=//div[@class="c-checkbox is-checked"]
${FINALIZACADASTRO}             xpath=//div[@class="c-global-actions-stack-manager__actions"]/button[2]
${BOTAOOK}                      xpath=//button[@class="c-button c-button--lg c-button--primary c-button--icon-left"]

*** Test Cases***
Login com sucesso no portal do paciente
  
    Login do Paciente  
    Valida Login     

Cadastro de Paciente com CPF
    [TAGS]                  002
    ${CPFFAKE}              FakerLibrary.CPF
    ${RGFAKE}               FakerLibrary.rg
    ${RG}                   Fetch From Left                     ${RGFAKE}           X
    ${NOMEFAKE}             FakerLibrary.First Name Female      #language_name  #
    ${SOBRENOME}            FakerLibrary.last_name
    ${DATAFAKE}             FakerLibrary.Date                   pattern=%d/%m/2000
    ${USERNAME}             Set Variable                        ${NOMEFAKE}_${SOBRENOME}
    ${EMAIL}                Set Variable                        ${USERNAME}@mozej.com
    ${FONE2}                FakerLibrary.msisdn
    ${TELEFONEFAKE}          Get Substring                      ${FONE2}    2
                              
Acessar a tela de cadastro do paciente 
    Input Text                          ${CAMPOCPF}              ${CPFFAKE} 
    input Text                          ${CAMPORG}               ${RG}
    input Text                          ${CAMPOTELEFONE}         ${TELEFONEFAKE}
    Click Element                       ${BOTAOPROXIMO}

    Input Text                          ${CAMPONOME}             ${NOMEFAKE} ${SOBRENOME}
    Input Text                          ${CAMPODATANASC}         ${DATAFAKE}
    Click Element                       ${CAMPOSEXO}
    Sleep                               2
    Click Element                       ${SEXOFEMININO} 
    Click Element                       ${BOTAOPROXIMO}
    Wait Until Element Is Visible       ${PASSO3} 
    
    Wait Until Page Contains            E-mail      10
    Click Element                       ${SELECIONAEMAIL} 
    Input Text                          ${CAMPOEMAIL}            ${EMAIL}    
    Input Text                          ${CONFIRMAEMAIL}         ${EMAIL}  
    Input Text                          ${CAMPOUSERNAME}         ${USERNAME}  
    Sleep                               2
    Input Password                      ${CAMPOSENHA}            ${SENHA}  
    Input Password                      ${CAMPOCONFIRMASENHA}    ${SENHA} 
    Click Element                       ${ACEITATERMO}
    Wait Until Element Is Visible       ${VERIFICATERMOMARCADO}

    Sleep                               10  #TEMPO PARA RESOLVER O CAPTCHA
    Click Element                       ${FINALIZACADASTRO} 
    Wait Until Page Contains            Cadastrar novo usuário
    Wait Until Page Contains            Após a aprovação de sua solicitação, você receberá e-mail de ativação da sua conta de usuário.
    Sleep                               3
    Click Element                       ${BOTAOOK}   


Cadastro de Paciente sem CPF e RG
    Acessar a tela de cadastro do paciente 
    Click Element                       xpath=//input[@id="check-d683e4e6-d9b2-4d06-8cd8-2f275abe3f63"]
    Wait Until Element Is Visible       xpath=//div[@class="c-checkbox is-checked"]
 



