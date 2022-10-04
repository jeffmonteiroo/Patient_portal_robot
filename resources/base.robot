
***Settings***
Library         BuiltIn
Library         AppiumLibrary
Resource        helpers.robot
Library         String
Library         FakerLibrary    locale=pt_BR


***Variables***

    
****Keywords***
Open Session
    Set Appium Timeout      10
    Open Application        http://localhost:4723/wd/hub
    ...                     automationName=UiAutomator2
    ...                     platformName=Android
    ...                     deviceName=Emulator
    ...                     browserName=Chrome
    Capture Screen Recording
    Go To URL               https://192.168.254.58:8101/login        
    Alerta de Risco

Close Session
    Sleep                   5
    #Capture Page Screenshot
    End Screen Recording
    Close Application

Alerta de Risco
    Click Element                       xpath=//*[@id="details-button"]
    Click Element                       xpath=//*[@id="proceed-link"]

Valida Sessão
    Set Appium Timeout                         30
    Wait Until Page Contains                   Favor fazer login para continuar.

Valida Login
    Wait Until Page Contains Element           xpath=//div[@class="c-application-bar__title"]      30

Capture Screen Recording
    Run Keyword And Ignore Error   Start Screen Recording

End Screen Recording
    ${OUTPUT_NAME}=                Get Substring                ${TEST_NAME}        0
    Run Keyword And Ignore Error   Stop Screen Recording        filename=${OUTPUT_NAME}      
      