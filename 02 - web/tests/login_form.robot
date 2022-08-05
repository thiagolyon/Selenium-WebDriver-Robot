*** Settings ***
Resource               base.robot

Test Setup             Nova sessao
Test Teardown          Encerra sessao

*** Test Cases ***
Login com sucesso
    Go To             ${url}/login
    Login With        stark    jarvis!

    Should see logged user    Tony Stark

Senha invalida
    Go To             ${url}/login
    Login With        stark    SenhaIncorreta

    Should Contain Login Alert    Senha é invalida!  

Usuario nao existe
    Go To             ${url}/login
    Login With        UsuarioIncorreto    jarvis!

    Should Contain Login Alert    O usuário informado não está cadastrado!

*** Keywords ***
Login With
    [Arguments]       ${uname}    ${pass}

    Input Text        css:input[name=username]        ${uname}
    Input Text        css:input[name=password]        ${pass}
    Click Element     class:btn-login

Should Contain Login Alert
    [Arguments]       ${expect_message}

    ${message}=       Get WebElement    id:flash
    Should Contain    ${message.text}   ${expect_message}

Should see logged user
    [Arguments]        ${full_name}

    Page Should Contain     Olá, ${full_name}. Você acessou a área logada!    