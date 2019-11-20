*** Settings ***
Documentation    Ações da tela
Resource  ../PageObjects/PO_Automacao.robot

*** Keywords ***
Acessar o site com o endereço ${url}
    Acessar site ${url}
Escolha um produto qualquer na loja
    Buscar produto
    Focar produto
Adicione o produto escolhido ao carrinho.
    Clicar Add produto
Prossiga para o checkout.
    Clicar Botao Proceed Checkout
Valide se o produto foi corretamente adicionado ao carrinho
    Verifica produto adicionado

prossiga caso esteja tudo certo.
    Focus to button
    Clicar Botao Finalizar compra

Realize o cadastro do cliente preenchendo todos os campos obrigatórios dos formulários.
    Adicionar e-mail hatewe5212@4xmail.net
    Clicar botão create account
    Selecionar genero tipo 2
    Inserir First name Testando
    Inserir Last Name Automação
    Inserir password 12345
    Inserir Data 21 mes 8 ano 1990
    Inserir endereço First name residencial
    Inserir endereço last name casa
    Inserir company Empresa 1 endereço
    Inserir address1 rua qualquer teste endereço
    Inserir city Cidade teste endereço
    Select state 32
    Inserir postcode 00000 endereço
    Inserir mobile phone 99999999 endereço
    Submit account
Valide se o endereço está correto e prossiga.
    Verifica endereços residencial casa e Empresa 1 e rua qualquer teste e Cidade teste, New York 00000 e 99999999
    Clicar botão próximo
Aceite os termos de serviço e prossiga.
    Clicar Aceitar termos
    Prossiga para pagamento
Valide o valor total da compra.
    Verifica o valor total $18.51

Selecione um método de pagamento e prossiga.
    Escolhe a forma de pagamento cheque
    Confirme a compra

Confirme a compra e valide se foi finalizada com sucesso.
    Verifique se a compra teve sucesso com a mensagem Your order on My Store is complete.

