
## Automação de testes E2E e de API.
# Índice

1. [Criar Ambiente](#criar-ambiente)
   - [Criar Ambiente Virtual](#criar-ambiente-virtual)
   - [Ativar Ambiente Virtual](#ativar-ambiente-virtual)
   - [Instalar Dependências](#instalar-dependências)
2. [Configurar WebDriver](#configurar-webdriver)
   - [Baixar WebDriver](#baixar-webdriver)
   - [Descompactar e Colocar na Pasta](#descompactar-e-colocar-na-pasta)
   - [Indicar WebDriver no Teste](#indicar-webdriver-no-teste)
3. [Execução do Projeto](#execução-do-projeto)
   - [Rodar os Testes](#rodar-os-testes)

---

# Criar Ambiente

**Para criar um ambiente virtual do Python com o nome "env" e configurar o Robot Framework, siga estes passos no terminal:**

### Criar Ambiente Virtual
```bash
python -m venv env


# Criar ambiente
**Para criar um ambiente virtual do Python com o nome "env" e configurar o Robot Framework, siga estes passos no terminal:**

1.  Crie o ambiente virtual com o comando:

```bash
python -m venv env
```
2.  Ative o ambiente virtual. Use o comando abaixo conforme seu sistema operacional:

• Em sistemas Linux ou macOS:

```bash
source env/bin/activate
```
• Em sistemas Windows:
```bash
env\Scripts\activate
```
3.  Com o ambiente ativado, instale as dependências do projeto:
```bash
pip install -r requirements.txt
```

Após esses passos, seu ambiente virtual estará configurado para automação com Robot Framework.

**Para incluir o WebDriver (por exemplo, o Chromedriver para o Google Chrome) no seu projeto, siga estes passos:**

1.  Baixe o driver manualmente: • Acesse o site oficial (por exemplo,  https://chromedriver.chromium.org/downloads) e baixe a versão compatível com a versão do seu navegador. • Extraia o executável do Chromedriver.
    
2.  Descompacte o zip e coloque o executável do Chromedriver nessa pasta.
    
3.  Indique a pasta do WebDriver no seu teste: • No arquivo de teste Robot Framework, você pode definir uma variável que aponte para o caminho do Chromedriver utilizando a variável ${CURDIR} (que representa o diretório atual do arquivo). • Na chamada do comando Open Browser, utilize o parâmetro "executable_path" para indicar o caminho específico do driver.

# Execução do projeto**

1. Rodar os Testes com o Comando `robot`
• Em sistemas Linux ou macOS:
```bash
robot --outputdir report/ src/front-end/kabum.robot
```
