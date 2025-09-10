### 🧩 Códigos de Completar — Questões Similares em Simulados e na Prova AZ-204

📚 **Domínio:** Desenvolver para o armazenamento do Azure  

---

## 🔹 Cenário 1 — Gorjeta em Pedidos (OrderTip)

Uma empresa possui atualmente um serviço web implantado para **receber pedidos e entregas de alimentos**.  
O serviço web utilizava o **Azure Cosmos DB** como armazenamento de dados.  

Um novo recurso está sendo implementado para permitir que os **usuários definam um valor de gorjeta** para pedidos.  
O novo recurso agora exige que o pedido tenha uma propriedade chamada **`Ordertip`** no documento no Cosmos DB e que essa propriedade contenha um valor numérico.  

Pode haver sites e serviços web existentes que ainda não foram atualizados para incluir esse recurso de gorjeta.  

Você precisa **concluir o gatilho** de código abaixo para este requisito.  

### 🧪 Código Esperado
```javascript
function OrderTip(){
    var context = getContext();
    var request = context.getRequest();
    var tipsItem = request.getBody();

    if(!("tip" in tipsItem)){
        tipsItem["tip"] = 0;
    }

    request.setBody(tipsItem);
}
```

---

## 🔹 Cenário 2 — Registro de Usuários com Data/Hora

📚 **Domínio:** Desenvolver para armazenamento do Azure

A empresa **Whizlabs Telecommunications** está lançando um programa de recompensas para seus clientes.
Cada cliente pode se cadastrar usando seu **e-mail**.

Após a conclusão do cadastro, você precisará **criá-lo no Azure Cosmos DB**.
A **data e a hora de criação do usuário** precisam ser registradas como parte do documento.

Você decide escrever **gatilhos do Azure Cosmos DB** para implementar o requisito.
Complete o trecho de código abaixo para obter uma solução ideal.

### 🧪 Código Esperado

```csharp
await client.GetContainer("database", "container").Scripts.CreateTriggerAsync(new TriggerProperties
{
    Id = "trgPreValidateToDoItemTimestamp",
    Body = File.ReadAllText(@"..\js\trgPreValidateToDoItemTimestamp.js"),
    TriggerOperation = TriggerOperation.Create,
    TriggerType = TriggerType.Pre
});

dynamic newItem = new
{
    category = "Personal",
    name = "Groceries",
    description = "Pick up strawberries",
    isComplete = false
};

await client.GetContainer("database", "container").CreateItemAsync(
    newItem, 
    null, 
    new ItemRequestOptions { 
        PreTriggers = new List<string> { "trgPreValidateToDoItemTimestamp" } 
    }
);
```