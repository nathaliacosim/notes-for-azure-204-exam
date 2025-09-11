## 💡 Dicas sobre Azure PowerShell (Az) vs Azure CLI

Este guia reúne observações importantes sobre comandos que **existem no Azure CLI**, mas **não possuem equivalente direto** no módulo **Az PowerShell**.  
Assim você evita erros ao tentar usar parâmetros que não existem.

---

### 🔍 Logs em tempo real (`log tail`)

- **Disponível apenas no Azure CLI**
  ```bash
  az webapp log tail --name meu-webapp --resource-group meu-rg
  ```

* ❌ Não existe equivalente no **Az PowerShell**.
* ✅ Alternativa: habilitar logs com `Set-AzWebApp` e visualizar via **Portal do Azure** ou **Azure CLI**.

---

### 🔍 CORS (Cross-Origin Resource Sharing)

* **Disponível apenas no Azure CLI**

  ```bash
  az webapp cors add --name meu-webapp --resource-group meu-rg --allowed-origins "http://example.com"
  ```
* ❌ Não existe parâmetro `-Cors` no `Set-AzWebApp` do **PowerShell**.
* ✅ Alternativa: configurar CORS pelo **Portal do Azure** ou via **CLI**.

---

### 🔍 Extensões de WebApp

* **CLI possui suporte**

  ```bash
  az webapp extension set --name meu-webapp --resource-group meu-rg ...
  ```
* ❌ Não existe equivalente no **Az PowerShell**.

---

### 🔍 Logs de Aplicação

* ✅ No **PowerShell** você consegue habilitar logs com:

  ```powershell
  Set-AzWebApp -Name meu-webapp `
    -ResourceGroupName meu-rg `
    -HttpLoggingEnabled $true `
    -DetailedErrorLoggingEnabled $true `
    -ApplicationLoggingFileSystemLevel "Information" `
    -ApplicationLoggingFileSystemRetentionInDays 7
  ```

* ✅ No **CLI** o mesmo é feito com:

  ```bash
  az webapp log config --name meu-webapp --resource-group meu-rg \
    --web-server-logging filesystem \
    --application-logging filesystem \
    --detailed-error-messages true \
    --failed-request-tracing true \
    --level verbose \
    --retention-days 7 \
    --quota 35
  ```

---

### ✅ Resumo Rápido

| Funcionalidade          | PowerShell (Az) | Azure CLI   |
| ----------------------- | --------------- | ----------- |
| Criar RG, Plan, WebApp  | ✅ Suportado     | ✅ Suportado |
| Configurar logs         | ✅ Suportado     | ✅ Suportado |
| Stream de logs (`tail`) | ❌ Não existe    | ✅ Suportado |
| Configurar CORS         | ❌ Não existe    | ✅ Suportado |
| Extensões de WebApp     | ❌ Não existe    | ✅ Suportado |

---

📌 **Dica final**:

* Para **administração geral** e automação: use **PowerShell (Az)**.
* Para **features específicas do App Service** (logs em tempo real, CORS, extensões): use **Azure CLI**.