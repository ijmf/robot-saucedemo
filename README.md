# robot-saucedemo

Testes E2E automatizados com Robot Framework e SeleniumLibrary para o SauceDemo, cobrindo Login, Carrinho e Checkout.

## O que é

Suite de testes end-to-end construída com Robot Framework e Python, validando os fluxos principais do SauceDemo. Os casos de teste são escritos em linguagem natural próxima ao inglês, legível para qualquer pessoa do time. O Chrome roda em modo headless com gerenciamento automático do ChromeDriver.

## Stack

- Python 3.13
- Robot Framework — framework de automação com linguagem natural
- SeleniumLibrary — integração com Selenium WebDriver
- WebDriver Manager — gerenciamento automático do ChromeDriver

## Estrutura

```
robot-saucedemo/
├── resources/
│   └── keywords.robot       # Keywords reutilizáveis e variáveis
├── tests/
│   └── saucedemo.robot      # 7 casos de teste
├── requirements.txt
└── .gitignore
```

## Como executar

```bash
# Criar ambiente virtual
python -m venv venv
venv\Scripts\activate

# Instalar dependências
pip install -r requirements.txt

# Rodar todos os testes
python -m robot tests/saucedemo.robot

# Ver relatório HTML
start report.html
```

## Casos de teste

| Teste | O que valida |
|---|---|
| Login Com Credenciais Validas | Redireciona para inventário após login |
| Login Com Senha Invalida | Exibe mensagem de erro |
| Login Com Usuario Bloqueado | Exibe mensagem de erro |
| Adicionar Produto Ao Carrinho | Badge exibe 1 item |
| Remover Produto Do Carrinho | Carrinho fica vazio |
| Checkout Completo Com Sucesso | Exibe "Thank you for your order!" |
| Checkout Sem Preencher Campos | Exibe mensagem de erro |

## Resultado

7 testes — 0 falhas — 40s

O Robot Framework gera automaticamente três arquivos de resultado:
- `report.html` — resumo visual da execução
- `log.html` — log detalhado de cada step
- `output.xml` — resultado em formato XML para integração CI/CD
