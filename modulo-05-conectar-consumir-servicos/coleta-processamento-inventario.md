## **Processamento Ordenado de Mensagens no Azure Service Bus**

### **Cenário**
Estamos desenvolvendo um sistema de notificação de perigos que utiliza um servidor de sinalização para acionar alarmes sonoros e visuais. Os eventos de alarme são publicados no **Azure Service Bus**, e cada controlador de alarme consome essas mensagens por meio de transações. É essencial que os eventos sejam registrados e processados **na ordem de chegada**, e que cada mensagem contenha o **horário do evento** e o **tipo de perigo**.

---

### **Objetivo**
Garantir que as mensagens de alarme sejam processadas de forma sequencial, respeitando a ordem cronológica dos eventos, e que seja possível rastrear e correlacionar mensagens relacionadas ao mesmo tipo de perigo.

---

### **Configuração Recomendada**

Para atender aos requisitos de ordenação e rastreabilidade, devem ser atribuídos os seguintes valores nas propriedades da mensagem:

#### ✅ **1. Atribuir o valor da propriedade `SessionId` à propriedade `ReplyToSessionId`**
- Essa configuração permite que o consumidor da mensagem saiba para qual sessão deve enviar uma resposta, caso necessário.
- O uso de sessões ativa o **processamento sequencial** das mensagens dentro de uma mesma sessão, garantindo a ordenação por chegada.

#### ✅ **2. Atribuir o valor da propriedade `MessageId` à propriedade `CorrelationId`**
- Permite correlacionar mensagens relacionadas ao mesmo evento ou tipo de perigo.
- Facilita o rastreamento e agrupamento lógico de mensagens para fins de auditoria ou análise.

---

### **Resumo das Propriedades**

| Propriedade da Mensagem       | Valor Atribuído                  | Finalidade                          |
|-------------------------------|----------------------------------|-------------------------------------|
| `ReplyToSessionId`            | `SessionId`                      | Garantir entrega ordenada           |
| `CorrelationId`               | `MessageId`                      | Rastreabilidade e agrupamento       |

---

### **Benefícios da Abordagem**
- **Ordenação garantida**: Sessões permitem que as mensagens sejam processadas na sequência correta.  
- **Rastreabilidade**: O uso de `CorrelationId` facilita a identificação de mensagens relacionadas.  
- **Confiabilidade**: Transações asseguram que os alarmes sejam acionados de forma segura e consistente.  
- **Escalabilidade**: O Azure Service Bus suporta múltiplos consumidores e sessões paralelas.

---

### **Exemplo de Código em C#**

#### **Envio de Mensagens com Sessão e CorrelationId**

```csharp
using Azure.Messaging.ServiceBus;

string connectionString = "<ServiceBusConnectionString>";
string queueName = "<QueueName>";

await using var client = new ServiceBusClient(connectionString);
ServiceBusSender sender = client.CreateSender(queueName);

// Criar uma mensagem com SessionId e CorrelationId
var message = new ServiceBusMessage("Alarme de perigo ativado!")
{
    SessionId = "Perigo-Sessao-001",
    CorrelationId = Guid.NewGuid().ToString(),
    MessageId = Guid.NewGuid().ToString()
};

// Enviar a mensagem
await sender.SendMessageAsync(message);
Console.WriteLine("Mensagem enviada com sucesso.");
```

#### **Recebimento de Mensagens por Sessão**

```csharp
await using var client = new ServiceBusClient(connectionString);
ServiceBusSessionReceiver receiver = await client.AcceptSessionAsync(queueName, "Perigo-Sessao-001");

ServiceBusReceivedMessage receivedMessage = await receiver.ReceiveMessageAsync();
if (receivedMessage != null)
{
    Console.WriteLine($"Mensagem recebida: {receivedMessage.Body}");
    Console.WriteLine($"CorrelationId: {receivedMessage.CorrelationId}");
    
    // Completar a mensagem para removê-la da fila
    await receiver.CompleteMessageAsync(receivedMessage);
}

await receiver.DisposeAsync();
```

* O envio garante que todas as mensagens de uma mesma sessão sejam **processadas em ordem**.
* O uso de `CorrelationId` permite **rastrear e correlacionar eventos** relacionados ao mesmo tipo de perigo.
* O `CompleteMessageAsync` assegura que a mensagem seja removida da fila somente após o processamento.