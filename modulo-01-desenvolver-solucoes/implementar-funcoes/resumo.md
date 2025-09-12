# ⚡ Resumo de Azure Functions – AZ-204

## 📌 Conceito
- Serviço **serverless** da Azure para executar pequenos trechos de código sob demanda.  
- Suporte a múltiplas linguagens: C#, JavaScript, Python, PowerShell, Java, etc.  
- Escalabilidade automática baseada em eventos.  

---

## 🔑 Tipos de Gatilhos (Triggers)
- **HTTP Trigger** → executa via requisição HTTP/REST.  
- **Timer Trigger** → execução agendada via CRON.  
- **Queue Trigger** → processa mensagens de Azure Storage Queue.  
- **Blob Trigger** → dispara ao criar/alterar blobs em um Storage.  
- **Event Hub Trigger** → processa eventos em tempo real.  
- **Service Bus Trigger** → consome mensagens de tópicos/filas do Service Bus.  

---

## 🔗 Bindings
- **Input Binding**: permite ler dados de outros serviços (ex: Cosmos DB, Blob Storage).  
- **Output Binding**: envia dados para outro serviço sem código adicional.  

---

## 🛠️ Planos de Hospedagem
- **Consumption Plan**  
  - Paga apenas por execução/duração.  
  - 1M execuções grátis/mês.  
  - **Até 10 min de duração** por execução.  

- **Premium Plan**  
  - Sem cold start, instâncias sempre ativas.  
  - **Até 60 min de duração**.  
  - Suporte a VNET e maior performance.  

- **Dedicated (App Service Plan – Basic, Standard, Premium)**  
  - Usa instâncias fixas do App Service.  
  - **Sem limite de duração**.  

❌ **Isolated (App Service Environment)** não é suportado para Functions.  

---

## 📊 Comparativo de Limites por Plano

| Plano         | Duração Máxima | Escalabilidade        | Cold Start | VNET Integration | Memória por Instância |
|---------------|----------------|-----------------------|------------|------------------|------------------------|
| Consumption   | Até 10 min     | Até ~200 instâncias   | ✅ Sim     | ❌ Não           | ~1,5 GB                |
| Premium       | Até 60 min     | Ilimitado (SKU)       | ❌ Não     | ✅ Sim           | Conforme SKU (até 14 GB+) |
| Dedicated     | Ilimitado      | Conforme App Service  | ❌ Não     | ✅ Sim           | Conforme App Service     |

---

## 🧩 Durable Functions
- Extensão do Azure Functions para **workflows stateful** (mantém estado entre execuções).  
- Permite criar processos longos que não se perdem se a função reiniciar.  
- Três padrões principais:  
  - **Function Chaining (Encadeamento de funções)** → executa funções em sequência, passando resultados de uma para outra. Ideal quando cada etapa depende da anterior.  
  - **Fan-out/Fan-in** → executa várias funções em paralelo e depois agrega os resultados. Útil para processamento massivo ou paralelização de tarefas.  
  - **Async HTTP APIs** → cria APIs que realizam operações longas, retornando um status inicial e enviando a resposta final quando concluído.  
- **Benefícios:**  
  - Processos de longa duração sem estourar o timeout do plano de consumo.  
  - Persistência automática do estado e checkpoints.  
  - Retry automático em caso de falhas.  
- **Nota:** Funciona no **Plano de Consumo, Premium ou App Service**, mas no Consumo o timeout padrão de 230s é contornado porque a orquestração mantém o estado e reinicia as execuções conforme necessário.

---

## 🔒 Autenticação e Segurança
- Integração nativa com **Azure AD**.  
- Pode usar **Managed Identity** para acessar Key Vault, Storage, Cosmos DB sem armazenar credenciais.  

---

## 📊 Monitoramento
- Logs e métricas via **Application Insights**.  
- Monitoramento em tempo real pelo **Azure Portal**.  

---

## 🎯 Pontos Importantes para Prova
- Escolher o **plano correto** conforme custo/latência/duração.  
- Saber **quando usar bindings** para simplificar integração.  
- Identificar **gatilhos mais adequados** a cada cenário (ex: fila → Queue Trigger).  
- **Durable Functions**: lembrar dos padrões Fan-out/Fan-in e Function chaining.  
- **Security**: evitar chaves fixas, usar **Managed Identity**.  
