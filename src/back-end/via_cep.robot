*** Settings ***
Library    RequestsLibrary
Library    Collections
Resource    data/variaveis.robot

*** Variables ***
${BASE_URL}      https://viacep.com.br/ws/

*** Test Cases ***
CEP Válido
    [Documentation]    Testa um CEP válido e verifica se os dados retornados estão corretos
    ${response}    GET    ${BASE_URL}54160449/json/
    Should Be Equal As Strings    ${response.status_code}    200
    Dictionary Should Contain Item    ${CEP_VALIDO}    cep    ${response.json()['cep']}
    Dictionary Should Contain Item    ${CEP_VALIDO}    cep    ${response.json()['cep']}
    Dictionary Should Contain Item    ${CEP_VALIDO}    logradouro    ${response.json()['logradouro']}
    Dictionary Should Contain Item    ${CEP_VALIDO}    complemento    ${response.json()['complemento']}
    Dictionary Should Contain Item    ${CEP_VALIDO}    unidade    ${response.json()['unidade']}
    Dictionary Should Contain Item    ${CEP_VALIDO}    bairro    ${response.json()['bairro']}
    Dictionary Should Contain Item    ${CEP_VALIDO}    uf    ${response.json()['uf']}
    Dictionary Should Contain Item    ${CEP_VALIDO}    estado    ${response.json()['estado']}
    Dictionary Should Contain Item    ${CEP_VALIDO}    regiao    ${response.json()['regiao']}
    Dictionary Should Contain Item    ${CEP_VALIDO}    ibge    ${response.json()['ibge']}
    Dictionary Should Contain Item    ${CEP_VALIDO}    gia    ${response.json()['gia']}
    Dictionary Should Contain Item    ${CEP_VALIDO}    ddd    ${response.json()['ddd']}
    Dictionary Should Contain Item    ${CEP_VALIDO}    siafi    ${response.json()['siafi']}

[FAIL CASE] CEP Válido
    [Documentation]    Testa um CEP válido e verifica se FALHA
    ${response}    GET    ${BASE_URL}54160449/json/
    Should Be Equal As Strings    ${response.status_code}    400
    Dictionary Should Contain Item    ${CEP_VALIDO}    cep    ${response.json()['cep']}
    Dictionary Should Contain Item    ${CEP_VALIDO}    cep    ${response.json()['cep']}
    Dictionary Should Contain Item    ${CEP_VALIDO}    logradouro    ${response.json()['logradouro']}
    Dictionary Should Contain Item    ${CEP_VALIDO}    complemento    ${response.json()['complemento']}
    Dictionary Should Contain Item    ${CEP_VALIDO}    unidade    ${response.json()['unidade']}
    Dictionary Should Contain Item    ${CEP_VALIDO}    bairro    ${response.json()['bairro']}
    Dictionary Should Contain Item    ${CEP_VALIDO}    uf    ${response.json()['uf']}
    Dictionary Should Contain Item    ${CEP_VALIDO}    estado    ${response.json()['estado']}
    Dictionary Should Contain Item    ${CEP_VALIDO}    regiao    ${response.json()['regiao']}
    Dictionary Should Contain Item    ${CEP_VALIDO}    ibge    ${response.json()['ibge']}
    Dictionary Should Contain Item    ${CEP_VALIDO}    gia    ${response.json()['gia']}
    Dictionary Should Contain Item    ${CEP_VALIDO}    ddd    ${response.json()['ddd']}
    Dictionary Should Contain Item    ${CEP_VALIDO}    siafi    ${response.json()['siafi']}

CEP Inválido
    [Documentation]    Testa um CEP inexistente e verifica se a resposta indica erro
    ${response}    GET    ${BASE_URL}00000000/json/
    Should Be Equal As Strings    ${response.status_code}    200
    Dictionary Should Contain Item    ${CEP_INVALIDO}    erro    ${response.json()['erro']}

Formato Incorreto - Menos de 8 dígitos
    [Documentation]    Testa um CEP com menos de 8 dígitos e verifica a resposta
    Run Keyword And Expect Error    HTTPError: 400*    GET    ${BASE_URL}5416/json/

    # Or alternatively with more specific validations:
    ${response}=    GET    ${BASE_URL}5416/json/    expected_status=400
    Status Should Be    400    ${response}
    Should Be Equal    ${response.reason}    Bad Request

Formato Incorreto - Mais de 8 dígitos
    [Documentation]    Testa um CEP com mais de 8 dígitos e verifica a resposta
    Run Keyword And Expect Error    HTTPError: 400*    GET    ${BASE_URL}54160449328/json/

    # Or alternatively with more specific validations:
    ${response}=    GET    ${BASE_URL}5416/json/    expected_status=400
    Status Should Be    400    ${response}
    Should Be Equal    ${response.reason}    Bad Request

Caracteres Especiais
    [Documentation]    Testa um CEP com caracteres não numéricos e verifica a resposta
    Run Keyword And Expect Error    HTTPError: 400*    GET    ${BASE_URL}12A4B6C8/json/

    # Or alternatively with more specific validations:
    ${response}=    GET    ${BASE_URL}5416/json/    expected_status=400
    Status Should Be    400    ${response}
    Should Be Equal    ${response.reason}    Bad Request

[FAIL CASE] Caracteres Especiais
    [Documentation]    Testa um CEP com caracteres não numéricos e verifica a resposta com FALHA
    Run Keyword And Expect Error    HTTPError: 400*    GET    ${BASE_URL}12A4B6C8/json/

    # Or alternatively with more specific validations:
    ${response}=    GET    ${BASE_URL}5416/json/    expected_status=200
    Status Should Be    400    ${response}
    Should Be Equal    ${response.reason}    Bad Request