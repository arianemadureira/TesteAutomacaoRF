*** Settings ***
Documentation    Page Objects da Tela, mapeamentos dos componentes das telas para acesso de outras classes.


Library     Selenium2Library    timeout=11


*** Keywords ***
Acessar site ${url}
    Selenium2Library.Open Browser    ${url}  chrome
        Maximize Browser Window
Focar produto
    Selenium2Library.Set Focus To Element    id=search_query_top
    Mouse Over      xpath=//a[@class='product_img_link']
Buscar produto
    sleep   3
    Selenium2Library.Set Focus To Element    id=search_query_top
    Selenium2Library.Input Text      id=search_query_top     Faded Short Sleeve T-shirts
    Selenium2Library.Click Element   xpath=//button[@name='submit_search']

Submit account
    Selenium2Library.Click Element   id=submitAccount

Inserir First name ${name}
    Selenium2Library.Set Focus To Element    id=customer_firstname
    Selenium2Library.Input Text      id=customer_firstname    ${name}

Inserir Last Name ${lastname}
    Selenium2Library.Set Focus To Element    id=customer_lastname
    Selenium2Library.Input Text      id=customer_lastname    ${lastname}

Inserir password ${passwd}
    Selenium2Library.Set Focus To Element    id=passwd
    Selenium2Library.Input Text      id=passwd    ${passwd}

Inserir Data ${data} mes ${mes} ano ${ano}
    Selenium2Library.Set Focus To Element    id=days
    Select From List By Value       id=days    ${data}
    Select From List By Value       id=months    ${mes}
    Select From List By Value       id=years    ${ano}

Inserir endereço First name ${name}
    Selenium2Library.Set Focus To Element    id=firstname
    Selenium2Library.Input Text      id=firstname    ${name}

Inserir endereço last name ${name}
    Selenium2Library.Set Focus To Element    id=lastname
    Selenium2Library.Input Text      id=lastname    ${name}

Inserir company ${name} endereço
    Selenium2Library.Set Focus To Element    id=company
    Selenium2Library.Input Text      id=company    ${name}

Inserir address1 ${text} endereço
    Selenium2Library.Set Focus To Element    id=address1
    Selenium2Library.Input Text      id=address1    ${text}

Inserir city ${text} endereço
    Selenium2Library.Set Focus To Element    id=city
    Selenium2Library.Input Text      id=city    ${text}

Select state ${value}
    Selenium2Library.Set Focus To Element    id=id_state
    Select From List By Value       id=id_state    ${value}

Inserir postcode ${text} endereço
    Selenium2Library.Set Focus To Element    id=postcode
    Selenium2Library.Input Text      id=postcode    ${text}

Inserir mobile phone ${text} endereço
    Selenium2Library.Set Focus To Element    id=phone_mobile
    Selenium2Library.Input Text      id=phone_mobile    ${text}

Clicar Add produto
    Selenium2Library.Click Element  xpath=//a[@data-id-product='1']
Focus to button
    Selenium2Library.Set Focus To Element     xpath=//a[@class='button btn btn-default standard-checkout button-medium']
Clicar Botao Proceed Checkout
   Wait Until Element Is Visible    xpath=//a[@title='Proceed to checkout']
   Selenium2Library.Click Element    xpath=//a[@title='Proceed to checkout']
Adicionar e-mail ${text}
    Selenium2Library.Set Focus To Element   id=email_create
    Selenium2Library.Input Text     id=email_create     ${text}

Selecionar genero tipo ${value}
    [Documentation]  value 1 é Mr e value 2 é Mrs
    Wait Until Element Is Visible       name=id_gender
    Select Radio Button    id_gender  ${value}
#    Selenium2Library.Click Element  value=${value}


Clicar botão create account
    Selenium2Library.Set Focus To Element   id=SubmitCreate
    Selenium2Library.Click Element      id=SubmitCreate

Clicar Botao Finalizar compra
    Wait Until Element Is Visible   xpath=//a[@class='button btn btn-default standard-checkout button-medium']
    Selenium2Library.Click Element      xpath=//a[@class='button btn btn-default standard-checkout button-medium']
Verifica produto adicionado
    Selenium2Library.Set Focus To Element  xpath=//td[@class='cart_description']//a[contains(text(),'Faded Short Sleeve T-shirts')]
    Wait Until Page Contains Element      xpath=//td[@class='cart_description']//a[contains(text(),'Faded Short Sleeve T-shirts')]

Verifica endereços ${cadastro} e ${address_company} e ${address_address1} e ${address_delivery} e ${address_phone_mobile}
   Selenium2Library.Set Focus To Element   xpath=//ul[@id='address_delivery']//li[@class='address_firstname address_lastname'][contains(text(),'${cadastro}')]
   Wait Until Page Contains Element  xpath=//ul[@id='address_delivery']//li[@class='address_firstname address_lastname'][contains(text(),'${cadastro}')]
   Wait Until Page Contains Element     xpath=//ul[@id='address_delivery']//li[@class='address_company'][contains(text(),'${address_company}')]
   Wait Until Page Contains Element    xpath=//ul[@id='address_delivery']//li[@class='address_address1 address_address2'][contains(text(),'${address_address1}')]
   Wait Until Page Contains Element    xpath=//ul[@id='address_delivery']//li[@class='address_city address_state_name address_postcode'][contains(text(),'${address_delivery}')]
   Wait Until Page Contains Element      xpath=//ul[@id='address_delivery']//li[@class='address_phone_mobile'][contains(text(),'${address_phone_mobile}')]

Clicar botão próximo
    Selenium2Library.Set Focus To Element       xpath=//button[@name='processAddress']
    Wait Until Element Is Visible       xpath=//button[@name='processAddress']
    Selenium2Library.Click Element      xpath=//button[@name='processAddress']

Clicar Aceitar termos
    Selenium2Library.Set Focus To Element       xpath=//input[@id='cgv']
#     Wait Until Element Is Visible          xpath=//input[@id='cgv']
     Selenium2Library.Click Element         xpath=//input[@id='cgv']

Prossiga para pagamento
    Selenium2Library.Set Focus To Element   xpath=//button[@name='processCarrier']
    Wait Until Element Is Visible           xpath=//button[@name='processCarrier']
    Selenium2Library.Click Element          xpath=//button[@name='processCarrier']

Verifica o valor total ${total}
    Wait Until Page Contains Element    xpath=//span[@id='total_price'][contains(text(),'${total}')]

Escolhe a forma de pagamento ${tipopag}
    [Documentation]  tipos: cheque ou bankwire
    Selenium2Library.Set Focus To Element   xpath=//a[@class='${tipopag}']
    Wait Until Element Is Visible       xpath=//a[@class='${tipopag}']
    Selenium2Library.Click Element     xpath=//a[@class='${tipopag}']

Confirme a compra
    Selenium2Library.Set Focus To Element   xpath=//span[contains(text(),'I confirm my order')]
    Wait Until Element Is Visible           xpath=//span[contains(text(),'I confirm my order')]
    Selenium2Library.Click Element      xpath=//span[contains(text(),'I confirm my order')]

Verifique se a compra teve sucesso com a mensagem ${text}
    Wait Until Page Contains Element   xpath=//p[@class='alert alert-success'][contains(text(),'Your order on My Store is complete.')]

