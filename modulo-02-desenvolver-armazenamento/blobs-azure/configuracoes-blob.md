# 📦 Azure Blob Storage — Configurações Padrão

Este documento resume quais funcionalidades do **Azure Blob Storage** já vêm **habilitadas por padrão** e quais precisam ser **ativadas manualmente**.  
Esse tipo de detalhe costuma cair em provas como a **AZ-204** em forma de pegadinha.

---

## ✅ O que já vem habilitado por padrão

| Funcionalidade | Status | Observação |
|----------------|--------|------------|
| 🔒 **Criptografia em repouso (SSE)** | Habilitado | Sempre ativo com chave da Microsoft. Pode trocar para CMK. |
| 🌐 **Criptografia em trânsito (HTTPS)** | Habilitado | Tráfego forçado por HTTPS por padrão. HTTP precisa ser ativado manualmente. |
| ♻️ **Replicação (LRS)** | Habilitado | LRS é o nível mínimo de redundância. Pode trocar para ZRS/GRS. |
| 🚫 **Bloqueio de acesso anônimo a containers** | Habilitado | Desde 2021, containers não são mais públicos por padrão. |
| 📦 **Account Versioning (metadados/configs)** | Habilitado | Sempre ativo em contas de armazenamento. **Não confundir com Blob Versioning.** |

---

## ⚠️ O que NÃO vem habilitado (precisa configurar)

| Funcionalidade | Status | Observação |
|----------------|--------|------------|
| 🗑️ **Soft Delete (blobs, containers, contas)** | Desabilitado | Precisa ser ativado manualmente. |
| 📝 **Blob Versioning** | Desabilitado | Necessário ativar para manter versões de blobs. |
| 📜 **Change Feed** | Desabilitado | Registra histórico de operações, mas só se ativado. |
| 📸 **Blob Snapshots** | Manual | Criados sob demanda, não automáticos. |
| 📆 **Lifecycle Management** | Desabilitado | Políticas de arquivamento/expiração precisam ser configuradas. |
| 🌍 **CORS (Cross-Origin Resource Sharing)** | Desabilitado | Só funciona após configuração explícita. |
| 🖥️ **Static Website Hosting** | Desabilitado | Deve ser ativado manualmente. |
| 🔑 **Customer-managed keys (CMK)** | Desabilitado | Padrão usa chave da Microsoft, CMK precisa ser configurado. |
| 📂 **Suporte NFS 3.0 / SFTP** | Desabilitado | Só disponível se habilitado e em contas de tipo compatível. |

---

## 🔧 Exemplos de Habilitação (CLI & PowerShell)

### 1. Soft Delete (para blobs)

**Azure CLI**
```bash
az storage account blob-service-properties delete-policy update \
  --account-name <nomeConta> \
  --resource-group <nomeRG> \
  --enable true \
  --days-retained 7
```

**Azure PowerShell**

```powershell
Set-AzStorageBlobServiceProperty `
  -ResourceGroupName <nomeRG> `
  -StorageAccountName <nomeConta> `
  -EnableDeleteRetention `
  -DeleteRetentionDays 7
```

---

### 2. Blob Versioning

**Azure CLI**

```bash
az storage account blob-service-properties update \
  --account-name <nomeConta> \
  --resource-group <nomeRG> \
  --enable-versioning true
```

**Azure PowerShell**

```powershell
Enable-AzStorageBlobVersioning `
  -ResourceGroupName <nomeRG> `
  -StorageAccountName <nomeConta>
```

---

### 3. Change Feed

**Azure CLI**

```bash
az storage account blob-service-properties update \
  --account-name <nomeConta> \
  --resource-group <nomeRG> \
  --enable-change-feed true
```

**Azure PowerShell**

```powershell
Enable-AzStorageChangeFeed `
  -ResourceGroupName <nomeRG> `
  -StorageAccountName <nomeConta>
```

---

### 4. Static Website Hosting

**Azure CLI**

```bash
az storage blob service-properties update \
  --account-name <nomeConta> \
  --static-website \
  --index-document index.html \
  --404-document error.html
```

**Azure PowerShell**

```powershell
Enable-AzStorageStaticWebsite `
  -ResourceGroupName <nomeRG> `
  -StorageAccountName <nomeConta> `
  -IndexDocument index.html `
  -ErrorDocument404Path error.html
```

---

### 5. CORS

**Azure CLI**

```bash
az storage cors add \
  --services b \
  --methods GET PUT \
  --origins "https://meusite.com" \
  --allowed-headers "*" \
  --exposed-headers "*" \
  --account-name <nomeConta>
```

**Azure PowerShell**

```powershell
$ctx = (Get-AzStorageAccount -ResourceGroupName <nomeRG> -Name <nomeConta>).Context
Add-AzStorageCORSRule `
  -ServiceType Blob `
  -AllowedOrigins "https://meusite.com" `
  -AllowedMethods GET,PUT `
  -AllowedHeaders "*" `
  -ExposedHeaders "*" `
  -MaxAgeInSeconds 200 `
  -Context $ctx
```

---

## 🎯 Dicas para a Prova AZ-204

* **Soft Delete, Blob Versioning, Change Feed e Snapshots NÃO vêm habilitados por padrão.**
* Sempre que aparecer algo relacionado a **segurança**, pense que a Microsoft habilita por padrão (criptografia, redundância, bloqueio de acesso anônimo).
* Cuidado para não confundir **Account Versioning** (sempre ativo) com **Blob Versioning** (precisa ser ativado).