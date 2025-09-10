# 🧾 Comandos Básicos com Azure CLI

Este diretório contém uma coleção de scripts `.azcli` com comandos essenciais para trabalhar com recursos do Azure. Eles fazem parte do módulo **"Desenvolver Soluções"** do curso para certificação **AZ-204** e servem como base para provisionamento, configuração e gerenciamento de serviços na nuvem.

---

## 🧭 Índice dos Scripts

| Script | Descrição |
|--------|-----------|
| [01-login.azcli](./01-login.azcli) | Autenticação no Azure via CLI |
| [02-resource-groups.azcli](./02-resource-groups.azcli) | Criação e gerenciamento de grupos de recursos |
| [03-app-service.azcli](./03-app-service.azcli) | Provisionamento de App Service Plan |
| [04-web-app.azcli](./04-web-app.azcli) | Criação de Web App no Azure App Service |
| [05-functions.azcli](./05-functions.azcli) | Criação de Azure Functions via CLI |
| [06-cosmosdb.azcli](./06-cosmosdb.azcli) | Provisionamento de Azure Cosmos DB |
| [07-storage.azcli](./07-storage.azcli) | Criação de conta de armazenamento e containers |
| [08-keyvault.azcli](./08-keyvault.azcli) | Criação de Azure Key Vault e configuração de segredos |

---

## 📌 Como Usar

1. Certifique-se de ter o [Azure CLI](https://learn.microsoft.com/pt-br/cli/azure/install-azure-cli) instalado e autenticado (`az login`).
2. Navegue até este diretório no terminal.
3. Execute os scripts com o comando:

```bash
az cli --file nome-do-script.azcli
```

> 💡 Dica: você pode abrir os arquivos no VS Code e executar trechos diretamente com a extensão do Azure CLI.

---

## 🎯 Finalidade

Estes comandos são úteis para:

- Automatizar tarefas comuns no Azure
- Aprender a sintaxe da CLI para diferentes serviços
- Criar recursos rapidamente em ambientes de teste ou desenvolvimento
- Reforçar conceitos importantes para o exame AZ-204

---

## 📖 Referências

- [Documentação oficial do Azure CLI](https://learn.microsoft.com/pt-br/cli/azure/)
- [Guia AZ-204](https://learn.microsoft.com/pt-br/certifications/exams/az-204/)
- [Azure Quickstart Templates](https://learn.microsoft.com/pt-br/azure/templates/)

---

**Domine os comandos, domine a nuvem! ☁️💪**