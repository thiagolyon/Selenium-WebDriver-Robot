*** Settings ***
Library        app.py


*** Test Cases ***
Deve retornar mensagem de boas vindas
    ${result}=             Welcome            Thiago Lyon    
    Should Be Equal        ${result}          Olá Thiago Lyon, bem vindo ao Curso básico de Robot Framwork!