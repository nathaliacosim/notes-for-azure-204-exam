## **Sistema de Alerta de Temperatura com Azure Service Bus e Logic Apps**

### **Cenário**
A empresa possui diversos armazéns, cada um equipado com dispositivos IoT que monitoram a temperatura ambiente. Esses dispositivos enviam dados de temperatura diariamente para uma **fila do Azure Service Bus**. O objetivo é implementar um sistema que **envie alertas por e-mail aos supervisores** sempre que a temperatura ultrapassar os limites pré-definidos (máximos ou mínimos).

---

### **Objetivo**
Criar uma solução automatizada e escalável que:
- Monitore continuamente os dados de temperatura recebidos.  
- Compare os valores com os limites estabelecidos.  
- Envie alertas por e-mail em tempo real para os responsáveis.

---

### **Sequência de Ações Recomendadas**

#### ✅ **1. Criar um Aplicativo Lógico em Branco**
- Inicia o fluxo de trabalho automatizado.  
- Permite configurar gatilhos e ações personalizadas.

#### ✅ **2. Adicionar um Gatilho de Fila do Service Bus**
- O gatilho é acionado **quando uma ou mais mensagens chegam à fila**.  
- Garante que o processamento ocorra imediatamente após o envio dos dados.

#### ✅ **3. Adicionar uma Ação para Ler os Dados de Temperatura**
- Extrai o conteúdo da mensagem da fila.  
- Os dados podem estar em formato JSON, XML ou texto simples.

#### ✅ **4. Adicionar uma Condição para Verificar os Limites**
- Compara o valor da temperatura com os **limites superiores e inferiores** definidos.  
- Permite ramificar o fluxo com base no resultado da verificação.

#### ✅ **5. Adicionar uma Ação para Enviar E-mail**
- Se a temperatura estiver fora dos limites, um e-mail é enviado automaticamente para a equipe responsável.  
- Pode incluir detalhes como o valor da temperatura, o armazém afetado e o horário do evento.

---

### **Resumo da Arquitetura**

| Etapa                      | Componente Azure                  |
|----------------------------|-----------------------------------|
| Recebimento de dados       | Azure Service Bus (fila)          |
| Processamento automatizado | Azure Logic App                   |
| Verificação de limites     | Condição lógica no Logic App      |
| Notificação                | Ação de envio de e-mail (SMTP, Outlook, etc.) |

---

### **Benefícios da Solução**
- **Automação total**: Nenhuma intervenção manual é necessária para monitorar ou alertar.  
- **Escalabilidade**: Suporta milhares de dispositivos e armazéns simultaneamente.  
- **Tempo real**: Alertas são enviados imediatamente após a detecção de anomalias.  
- **Flexibilidade**: Fácil de ajustar limites, destinatários e lógica de decisão.
