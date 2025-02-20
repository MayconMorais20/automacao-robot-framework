*** Variables ***

# - TELA INICIAL/PRINCIPAL
${CEP}    54160449    # CEP padrão para cálculo de frete
${SEARCH_INPUT}    id=input-busca    # ID do campo de busca
${SEARCH_INPUT_TEXT}    notebook    # Texto a ser inserido no campo de busca

# - TELA DE PESQUISA DE PRODUTOS
${NOTEBOOK_SELECTOR}    xpath=(//img[@class= "imageCard" ])[1]   # Seletor para o elemento de notebook

# - TELA DE DETALHES DO PRODUTO
${INPUT_CEP}    xpath=//input[@data-testid="ZipCodeInput"]    # Seletor para o campo de CEP
${BTN_CALCULAR_FRETE}    xpath=//button[@Id="botaoCalcularFrete"]    # Seletor para o botão de calcular frete
${VALUE_ENTREGA_ECONOMICA_CEP_PADRAO}    R$ 120,84      # Valor esperado para o campo de CEP 54160449
${VALUE_ENTREGA_EXPRESSA_CEP_PADRAO}    R$ 320,47    # Valor esperado para o campo de CEP 54160449
${FIELD_ENTREGA_ECONOMICA}    xpath=//div[@Id="listaOpcoesFrete"]/div[1]/span[2]    # Seletor para o campo de entrega econômica
${VALUE_ENTREGA_ECONOMICA}    ${VALUE_ENTREGA_ECONOMICA_CEP_PADRAO}    # Valor esperado para o campo de entrega econômica
${FIELD_ENTREGA_EXPRESSA}    xpath=//div[@Id="listaOpcoesFrete"]/div[2]/span[2]    # Seletor para o campo de entrega expressa
${VALUE_ENTREGA_EXPRESSA}    ${VALUE_ENTREGA_EXPRESSA_CEP_PADRAO}    # Valor esperado para o campo de entrega expressa
${BTN_FECHAR_JANELA_CEP}    xpath=(//button[@aria-label="Fechar"])[2]    # Seletor para o botão de fechar a janela de CEP
${BTN_COMPRAR}    xpath=//button[text()='COMPRAR']    # Seletor para o botão de comprar

# - TELA DE GARANTIA ESTENDIDA
${CARD_GARANTIA_ESTENDIDA_12_MESES}    xpath=//span[contains(text(),'12 Meses de garantia')]   # Seletor para o card - 12 meses de garantia estendida
${BNT_CARRINHO_DE_COMPRAS}    xpath=(//a[@id="linkCarrinhoHeader"])[1]    # Seletor para o botão de carrinho de compras
${VALID_SELECTED_FORM_GARANTIA_ESTENDIDA_12_MESES}    xpath=//li[@class=" flex flex-col items-center self-end overflow-hidden rounded-4 border border-solid text-center border-secondary-500"]//span[contains(text(), "12 Meses de garantia" )]   # Campo selecionado em garantia de 12 meses

# - VALIDACAO DA TELA DO CARRINHO DE COMPRAS
${VALID_QTD_ITENS_PRODUTO}    xpath=//input[contains(@id, "quantity" )]   # Campo de quantidade de itens do produto
${VALUE_QTD_ITENS_PRODUTO}    1    # Valor esperado para o campo de quantidade de itens do produto
${VALID_PRODUCT_NAME}    xpath=//a[contains(@class, "productName" )]    # Campo de nome do produto
${VALUE_PRODUCT_NAME}    MacBook    # Valor esperado para o campo de nome do produto
${VALID_FIELD_VALORES_DOS_PRODUTOS}    xpath=//div[@id="valorDosProdutos"]    # Campo de valores dos produtos
${VALID_FIELD_FRETE}    xpath=//div[@id="frete"]    # Campo de frete
${VALID_FIELD_SERVICOS_ADICIOONAIS}    xpath=//div[@id="servicosAdicionais"]    # Campo de serviços adicionais
${VALIDE_FIELD_FRETE}    xpath=//div[@id="frete"]    # Campo de frete
${VALID_FIELD_SEGURO}    xpath=//input[@data-gtm-form-interact-field-id="2"]    # Campo de seguro selecionado
${VALID_BUTTON_REMOVER}    xpath=//span[@class="hidden tablet:inline-block" and text()="Remover"]    # Botão de remover seguro
${VALID_PRECO_FRETE_ECONOMICO}    xpath=(//span[contains(@class, "ShippingOptionPrice")])[1]     # Campo de frete econômico
${VALID_PRECO_FRETE_EXPRESSO}    xpath=(//span[contains(@class, "ShippingOptionPrice")])[2]     # Campo de frete expresso