# 🚀 Questionário Azure - Containers, DevOps e Persistência de Dados

---

## 🔹 Pergunta 1 – Escalonamento no Azure Container App (ACA)

Você está desenvolvendo um serviço que roda em **Azure Container App (ACA)**.  
O serviço processa mensagens armazenadas em uma fila do **Azure Storage**.

Atualmente, ele roda continuamente com instâncias fixas, gerando **custos desnecessários** quando o volume de mensagens é baixo.

Você quer que:

- 🔄 O número de réplicas seja escalonado automaticamente conforme mensagens na fila.
- ⚡ Instâncias sejam reduzidas a **zero** quando não houver mensagens.
- 🟢 Solução seja **totalmente gerenciada** e compatível com ACA.

### ❓ Qual alternativa representa corretamente essa configuração?

- [ ] **A.** Política de escalonamento baseada em CPU + *Always On* (mínimo 1 instância).  
- [ ] **B.** *Cron job* no Azure Logic Apps para monitorar fila e atualizar ACA manualmente via CLI.  
- [x] **C.** **KEDA (Kubernetes Event-driven Autoscaler)** com *scaler* `azure-queue`. Configure `queueName`, `connection`, `messageCount` e `cooldownPeriod`.  
- [ ] **D.** Azure Function (plano Premium) ligada à fila, acionando ACA via HTTP.  
- [ ] **E.** Métrica customizada no Azure Monitor + regra de escalonamento manual via Azure Autoscale.  

---

## 🔹 Pergunta 2 – Otimização do Azure Container Registry (ACR)

Equipe DevOps deseja **reduzir custos** e manter apenas as **imagens mais recentes** no **ACR**, removendo versões obsoletas automaticamente.

### ❓ Qual funcionalidade do ACR atende a este requisito?

- [ ] **A.** Replicação Geográfica para distribuir imagens entre regiões e remover cópias antigas.  
- [ ] **B.** Pipeline no Azure DevOps para excluir imagens manualmente.  
- [ ] **C.** Azure Storage para mover imagens antigas do ACR.  
- [x] **D.** **Políticas de retenção no ACR** para exclusão automática de imagens antigas e não utilizadas.

---

## 🔹 Pergunta 3 – Persistência de dados em Azure Container Instance (ACI)

Você cria uma aplicação em contêiner no **ACI** que precisa **persistir arquivos de configuração** entre execuções.

Requisitos:

- 📁 Arquivos acessíveis no contêiner via caminho local.
- 🔄 Disponíveis mesmo após reinício ou recriação do ACI.
- 🔐 Armazenados de forma **segura** em um serviço gerenciado do Azure.

### ❓ Como configurar o volume persistente?

- [ ] **A.** *emptyDir* mapeado para `/app/data`. Persistência temporária.  
- [x] **B.** **azureFile** vinculado a compartilhamento **Azure Files**, mapeado para `/app/config`.  
- [ ] **C.** *blobfuse* de Azure Blob Storage, exposto em `/mnt/blob`.  
- [ ] **D.** **Azure App Configuration**, acessado via API no contêiner.  
- [ ] **E.** *gitRepo* incluído no tempo de criação do contêiner.  

---

✨ **Dica de estudo:**  

- ACA + KEDA = escalonamento **event-driven** 🔹  
- ACR + Políticas de retenção = **limpeza automática de imagens** 🔹  
- ACI + AzureFile = **persistência de dados entre reinícios** 🔹
