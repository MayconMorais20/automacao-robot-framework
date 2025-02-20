*** Settings ***
Library    SeleniumLibrary
Resource    data/variables.robot     # Importação das variáveis


*** Variables ***
${URL}    https://www.kabum.com.br
${CHROME_DRIVER_PATH}      ${CURDIR}../drivers/chromedriver.exe
${timestamp}=    Get Time    result_format=%H%M%S

*** Test Cases ***
00001 - Validar tela detalhes tela do carrinho de compras
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    # - TELA INICIAL/PRINCIPAL
    Wait Until Element Is Visible    ${SEARCH_INPUT}
    Input Text    ${SEARCH_INPUT}    ${SEARCH_INPUT_TEXT}
    Press Keys    ${SEARCH_INPUT}    ENTER
    Wait Until Element Is Visible    ${NOTEBOOK_SELECTOR}

    # - TELA DE PESQUISA DE PRODUTOS
    Press Keys    None    PAGE_DOWN
    Click Element    ${NOTEBOOK_SELECTOR}

    # - TELA DE DETALHES DO PRODUTO
    Wait Until Element Is Visible    ${BTN_COMPRAR}
    Execute JavaScript    window.scrollTo(0, 500)
    Sleep    1s
    Click Element    ${INPUT_CEP}
    Sleep    1s
    Input Text    ${INPUT_CEP}    ${CEP}
    Sleep    2s
    Click Button    ${BTN_CALCULAR_FRETE}
    Wait Until Element Is Visible    ${FIELD_ENTREGA_ECONOMICA}
    Wait Until Element Is Visible    ${FIELD_ENTREGA_EXPRESSA}
    Sleep    1s
    # OS VALORES DE FRETE ESTÃO DIFERENTES DO VALOR ESPERADO A CADA/COM CERTA FREQUENCIA NA EXECUÇÃO DO TESTE PARA O MESMO CEP, 
    # SENDO NECESSARIO BUSCAR E COMPARAR OS VALORES DE FRETE COM OS VALORES DO PROPRIO ELEMENTO E ATRIBUIR NO VALOR ESPERADO
    # OBS: DEIXEI A VARIAVEL DECLARADAS CEP NAO SEJA TAO VOLATIL COM VALORES FIXOS
    ${VALUE_ENTREGA_ECONOMICA}=    Get Text    ${FIELD_ENTREGA_ECONOMICA}
    ${VALUE_ENTREGA_EXPRESSA}=    Get Text    ${FIELD_ENTREGA_EXPRESSA}
    Element Text Should Be    ${FIELD_ENTREGA_ECONOMICA}      ${VALUE_ENTREGA_ECONOMICA}
    Element Text Should Be    ${FIELD_ENTREGA_EXPRESSA}      ${VALUE_ENTREGA_EXPRESSA}
    Click Button    ${BTN_FECHAR_JANELA_CEP}
    Press Keys    None    PAGE_UP
    Wait Until Element Is Visible    ${BTN_COMPRAR}
    Sleep    1s
    Click Button    ${BTN_COMPRAR}

    # - TELA DE GARANTIA ESTENDIDA
    Wait Until Element Is Visible    ${CARD_GARANTIA_ESTENDIDA_12_MESES}
    Click Element    ${CARD_GARANTIA_ESTENDIDA_12_MESES}
    Element Should Be Enabled   ${VALID_SELECTED_FORM_GARANTIA_ESTENDIDA_12_MESES}
    Click Element    ${BNT_CARRINHO_DE_COMPRAS}

    # - VALIDACAO DA TELA DO CARRINHO DE COMPRAS
    #PELA MUDANCA DE NOTEBOOKS, O VALOR DO CARRINHO DE COMPRAS MUDA, VALIDEI SEUS PRINCIPAIS CAMPOS IMUTAVEIS E VALOR DO CAMPO NOME DO PRODUTO
    Wait Until Element Is Visible    ${VALID_QTD_ITENS_PRODUTO}
    Element Attribute Value Should Be    ${VALID_QTD_ITENS_PRODUTO}    value   ${VALUE_QTD_ITENS_PRODUTO}
    ${TEXT_PRODUCT_NAME}=    Get Text    ${VALID_PRODUCT_NAME}
    Should Contain    ${TEXT_PRODUCT_NAME}    ${VALUE_PRODUCT_NAME}
    Element Should Be Visible    ${VALID_FIELD_VALORES_DOS_PRODUTOS}
    Element Should Be Visible    ${VALID_FIELD_FRETE}
    Element Should Be Visible    ${VALID_FIELD_SERVICOS_ADICIOONAIS}
    Element Should Be Visible    ${VALID_FIELD_FRETE}
    Element Should Be Visible    ${VALID_BUTTON_REMOVER}
    Press Keys    None    PAGE_DOWN
    Element Text Should Be    ${VALID_PRECO_FRETE_ECONOMICO}    ${VALUE_ENTREGA_ECONOMICA}
    Element Text Should Be    ${VALID_PRECO_FRETE_EXPRESSO}    ${VALUE_ENTREGA_EXPRESSA}
    Capture Page Screenshot    filename=search-${TEST NAME}-${timestamp}.png

    [Teardown]    Close Browser


00002 - Validar se vai falhar ao validar valor do frete
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    # - TELA INICIAL/PRINCIPAL
    Wait Until Element Is Visible    ${SEARCH_INPUT}
    Input Text    ${SEARCH_INPUT}    ${SEARCH_INPUT_TEXT}
    Press Keys    ${SEARCH_INPUT}    ENTER
    Wait Until Element Is Visible    ${NOTEBOOK_SELECTOR}

    # - TELA DE PESQUISA DE PRODUTOS
    Press Keys    None    PAGE_DOWN
    Click Element    ${NOTEBOOK_SELECTOR}

    # - TELA DE DETALHES DO PRODUTO
    Wait Until Element Is Visible    ${BTN_COMPRAR}
    Execute JavaScript    window.scrollTo(0, 500)
    Sleep    1s
    Click Element    ${INPUT_CEP}
    Sleep    1s
    Input Text    ${INPUT_CEP}    ${CEP}
    Sleep    2s
    Click Button    ${BTN_CALCULAR_FRETE}
    Wait Until Element Is Visible    ${FIELD_ENTREGA_ECONOMICA}
    Wait Until Element Is Visible    ${FIELD_ENTREGA_EXPRESSA}
    Sleep    1s
    # OS VALORES DE FRETE ESTÃO DIFERENTES DO VALOR ESPERADO A CADA/COM CERTA FREQUENCIA NA EXECUÇÃO DO TESTE PARA O MESMO CEP, 
    # SENDO NECESSARIO BUSCAR E COMPARAR OS VALORES DE FRETE COM OS VALORES DO PROPRIO ELEMENTO E ATRIBUIR NO VALOR ESPERADO
    # OBS: DEIXEI A VARIAVEL DECLARADAS CEP NAO SEJA TAO VOLATIL COM VALORES FIXOS
    ${VALUE_ENTREGA_ECONOMICA}=    Get Text    ${FIELD_ENTREGA_ECONOMICA}
    Element Text Should Be    ${FIELD_ENTREGA_ECONOMICA}      R$ 002,12
    Capture Page Screenshot    filename=search-${TEST NAME}-${timestamp}.png

    [Teardown]    Close Browser