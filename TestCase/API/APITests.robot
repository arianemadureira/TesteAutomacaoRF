
*** Settings ***
Documentation   Testes de API : http://5d9cc58566d00400145c9ed4.mockapi.io/shopping_cart

Library     RequestsLibrary
Library     Collections


*** Test Cases ***
Cenario Validar os dados que retorna.
    Given Esteja conectado no webservice
    When o usuário consultar o item id 1
    Then Validar os dados retornados

Cenario Validar erro retornado
    Given Esteja conectado no webservice
    When o usuário consultar o item id 0
    Then Validar a validação de erro retornado

Cenario validar Status Code sucesso
    Given Esteja conectado no webservice
    When o usuário consultar o item id 1
    Then Validar sucesso de retorno

*** Keywords ***

Validar a validação de erro retornado
     Should Be Equal As Strings	    ${RESPOSTA.status_code}	    404
     Log  Resposta.status_code: ${RESPOSTA.status_code}

Esteja conectado no webservice
    Create Session      Api 	http://5d9cc58566d00400145c9ed4.mockapi.io/shopping_cart

o usuário consultar o item id ${id}
    ${headers}=    Create Dictionary
    Set To Dictionary    ${headers}    Content-Type    application/json
    #Set To Dictionary    ${headers}     Accept         application/json
    #Set To Dictionary    ${headers}    Authorization   Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6ImtldTVmQV9iM2RUdXU2TU5HNURlTHZxVllOOCIsImtpZCI6ImtldTVmQV9iM2RUdXU2TU5HNURlTHZxVllOOCJ9.eyJpc3MiOiJodHRwczovL3ZxYWFwcDAyLnRjcC5jb20uYnI6NDQzMzAvaWRlbnRpdHkvYWQiLCJhdWQiOiJodHRwczovL3ZxYWFwcDAyLnRjcC5jb20uYnI6NDQzMzAvaWRlbnRpdHkvYWQvcmVzb3VyY2VzIiwiZXhwIjoxNTQ5NTAxMTc1LCJuYmYiOjE1NDk0NzYxNzUsImNsaWVudF9pZCI6IjkyQUREQkE3RjdBMDQ4QzdCQTE2MThFNDczNzVERjBEIiwic2NvcGUiOiJpbnRlZ3JhIiwic3ViIjoiMjAxNDgiLCJhdXRoX3RpbWUiOjE1NDk0NzYxNzUsImlkcCI6Imlkc3J2IiwibmFtZSI6ImV3YXZlLmFtYWR1cmVpcmEiLCJhbXIiOlsicGFzc3dvcmQiXX0.Kc35I-e4mHLZpT5tMUVUqFeEDJBcE2WXfFRprWHqVdcmvnvrwb3iYALOCDjE4SgwxLzg8XmUPWPnwm1G0kW81mfhhDPKtDolJlxSeatphKCpeGIw56hrgX1tHH-vuUa6-c4vcXGV4qmjEwatTVbQoOQ-167CkCtm0yIfjEmvANBqMXfffiPrrK9vr1nIVrHtKlQi1KReYY1JXoLqNMn0QUn_RuE6qX874T0YGil_RYQt3O5_UdMV81yCbW5JNep7DGJN9hTvblG85qSy5QtbLV6RqefkibNvaI3OAURfmXkkO7fYwEFcI44V3aDkc6e8egsvWxDGyhwKeN97PoAxOA
    ${RESPOSTA}=        Get Request  Api  /${id}   headers=${headers}
    log to console       Resposta: ${RESPOSTA.content}
     Log                 Valor retornado: ${RESPOSTA.text}
     Set Global Variable     ${RESPOSTA}

Validar sucesso de retorno
         Should Be Equal As Strings	${RESPOSTA.status_code}	200
         Log  Resposta.status_code: ${RESPOSTA.status_code}

Validar os dados retornados
    log to console    Log:${RESPOSTA.json()}
    Log                 O valor restornado existe no JSON: ${RESPOSTA.json()}
    Dictionary Should Contain Value	${RESPOSTA.json()}	Alfonso Sipes