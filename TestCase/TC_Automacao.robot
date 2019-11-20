*** Settings ***
Documentation    Validações do site
Resource    ../PageAction/PA_Automacao.robot

*** Test Cases ***
Cenário 1: Acessar site
    [Tags]
    Given Acessar o site com o endereço http://www.automationpractice.com
    When Escolha um produto qualquer na loja
    AND Adicione o produto escolhido ao carrinho.
    AND Prossiga para o checkout.
    AND Valide se o produto foi corretamente adicionado ao carrinho
    AND prossiga caso esteja tudo certo.
    AND Realize o cadastro do cliente preenchendo todos os campos obrigatórios dos formulários.
    AND Valide se o endereço está correto e prossiga.
    AND Aceite os termos de serviço e prossiga.
    AND Valide o valor total da compra.
    AND Selecione um método de pagamento e prossiga.
    Then Confirme a compra e valide se foi finalizada com sucesso.



