# ===============================
# Login e seleção de subscription
# ===============================

# Login na conta do Azure
Connect-AzAccount -UseDeviceCode

# Selecionar a assinatura (por nome ou por ID GUID)
# Select-AzSubscription -SubscriptionId "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
Select-AzSubscription -SubscriptionName "nathalia-az-01"

# ===============================
# Grupos de Recursos
# ===============================

# Criar um grupo de recursos no East US
New-AzResourceGroup -Name "nath-204-eastus" -Location "East US"

# Criar um grupo de recursos no Brazil South
New-AzResourceGroup -Name "nath-204-brazilsouth" -Location "Brazil South"

# ===============================
# App Service Plans
# ===============================

# Criar um App Service Plan no East US
New-AzAppServicePlan -Name "nath-app-eastus" `
  -ResourceGroupName "nath-204-eastus" `
  -Tier "Standard" `
  -WorkerSize "Small" `
  -NumberofWorkers 3 `
  -Location "East US"

# Criar um App Service Plan no Brazil South
New-AzAppServicePlan -Name "nath-app-brazilsouth" `
  -ResourceGroupName "nath-204-brazilsouth" `
  -Tier "Standard" `
  -WorkerSize "Small" `
  -NumberofWorkers 3 `
  -Location "Brazil South"

# ===============================
# Web App
# ===============================

# Criar um Web App no East US
New-AzWebApp -Name "nath-webapp-eastus" `
  -ResourceGroupName "nath-204-eastus" `
  -Location "East US" `
  -AppServicePlan "nath-app-eastus"

# Mostrar detalhes do Web App
Get-AzWebApp -Name "nath-webapp-eastus" -ResourceGroupName "nath-204-eastus" | Format-List *

# Atualizar tags do Web App
Set-AzWebApp -Name "nath-webapp-eastus" `
  -ResourceGroupName "nath-204-eastus" `
  -Tag @{ project="nathalia-az-204"; owner="nathalia" }

# Obter tags do Web App
Get-AzWebApp -Name "nath-webapp-eastus" -ResourceGroupName "nath-204-eastus" |
  Select-Object -ExpandProperty Tags | Format-List *

# Obter URL do Web App
(Get-AzWebApp -Name "nath-webapp-eastus" -ResourceGroupName "nath-204-eastus").DefaultHostName

# Obter estado do Web App
(Get-AzWebApp -Name "nath-webapp-eastus" -ResourceGroupName "nath-204-eastus").State

# ===============================
# Operações no Web App
# ===============================

# Iniciar, parar e reiniciar
Start-AzWebApp -Name "nath-webapp-eastus" -ResourceGroupName "nath-204-eastus"
Stop-AzWebApp -Name "nath-webapp-eastus" -ResourceGroupName "nath-204-eastus"
Restart-AzWebApp -Name "nath-webapp-eastus" -ResourceGroupName "nath-204-eastus"

# ===============================
# Logs do Web App
# ===============================

# Habilitar logs de aplicação
Set-AzWebApp -Name "nath-webapp-eastus" `
  -ResourceGroupName "nath-204-eastus" `
  -HttpLoggingEnabled $true `
  -DetailedErrorLoggingEnabled $true `
  -ApplicationLoggingFileSystemLevel "Information" `
  -ApplicationLoggingFileSystemRetentionInDays 7

# Desabilitar logs de aplicação
Set-AzWebApp -Name "nath-webapp-eastus" `
  -ResourceGroupName "nath-204-eastus" `
  -HttpLoggingEnabled $false `
  -DetailedErrorLoggingEnabled $false `
  -ApplicationLoggingFileSystemLevel "Off"

# ⚠️ Observação:
# O Az PowerShell NÃO tem equivalente a "az webapp log tail"
# Para streaming de logs use Azure CLI:
# az webapp log tail --name nath-webapp-eastus --resource-group nath-204-eastus

# ===============================
# Configurações extras do Web App
# ===============================

# Habilitar/Desabilitar redirecionamento HTTPS
Set-AzWebApp -Name "nath-webapp-eastus" -ResourceGroupName "nath-204-eastus" -HttpsOnly $true
Set-AzWebApp -Name "nath-webapp-eastus" -ResourceGroupName "nath-204-eastus" -HttpsOnly $false

# Habilitar Always On
Set-AzWebApp -Name "nath-webapp-eastus" -ResourceGroupName "nath-204-eastus" -AlwaysOn $true

# ⚠️ Observação:
# Não existe parâmetro -Cors em Set-AzWebApp
# Para configurar CORS use Azure CLI:
# az webapp cors add --name nath-webapp-eastus --resource-group nath-204-eastus --allowed-origins "http://example.com" "https://example.com"

# ===============================
# App Service Plan - Escalabilidade
# ===============================

# Obter número de workers
(Get-AzAppServicePlan -Name "nath-app-eastus" -ResourceGroupName "nath-204-eastus").NumberOfWorkers

# Escalar para 5 instâncias
Set-AzAppServicePlan -Name "nath-app-eastus" -ResourceGroupName "nath-204-eastus" -NumberofWorkers 5

# ===============================
# Exclusão de recursos
# ===============================

# Deletar o Web App
Remove-AzWebApp -Name "nath-webapp-eastus" -ResourceGroupName "nath-204-eastus" -Force

# Deletar o App Service Plan
Remove-AzAppServicePlan -Name "nath-app-eastus" -ResourceGroupName "nath-204-eastus" -Force

# Deletar o grupo de recursos
Remove-AzResourceGroup -Name "nath-204-eastus" -Force
