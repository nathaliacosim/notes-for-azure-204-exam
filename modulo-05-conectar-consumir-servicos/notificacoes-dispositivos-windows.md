## **Envio de Notificações Brutas para Dispositivos Windows via Azure Notification Hubs**

### **Cenário**
Como parte de uma solução SaaS, estamos desenvolvendo um exemplo de código que permite aos clientes enviar **notificações brutas (raw)** para dispositivos Windows usando os **Hubs de Notificação do Azure**. O objetivo é fornecer um modelo simples, sem dependência de pacotes externos, que possa ser facilmente adaptado e integrado.

---

### **Objetivo**
Demonstrar como construir uma requisição HTTP para envio de notificações brutas ao **Windows Push Notification Services (WNS)**, utilizando apenas bibliotecas padrão do .NET.

---

### **Configuração da Plataforma e Tipo de Conteúdo**

| Parâmetro        | Valor Correto               |
|------------------|-----------------------------|
| **Plataforma**    | `windows`                  |
| **Content-Type**  | `application/octet-stream` |

- **`windows`**: Identifica a plataforma de destino como dispositivos Windows.  
- **`application/octet-stream`**: Define o tipo de conteúdo como binário, necessário para notificações brutas.

---

### **Exemplo de Código em C#**

```csharp
var endpoint = "<endpoint>"; // URL do canal WNS
var payload = "<payload>";   // Conteúdo da notificação bruta

var request = new HttpRequestMessage(HttpMethod.Post, endpoint);
request.Headers.Add("X-WNS-Type", "wns/raw");
request.Content = new StringContent(payload, Encoding.UTF8, "application/octet-stream");

// Autenticação via token OAuth 2.0
request.Headers.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", "<access_token>");

var client = new HttpClient();
await client.SendAsync(request);
```

---

### **Notas Técnicas**

* O **endpoint** é obtido pelo aplicativo cliente no dispositivo Windows.
* O **payload** pode ser qualquer conteúdo binário relevante para a aplicação.
* O **token de acesso** deve ser gerado com as credenciais do pacote do aplicativo (SID e chave secreta), conforme exigido pelo WNS.

---

### **Benefícios da Abordagem**

* **Segurança**: Utiliza autenticação OAuth com token de acesso.
* **Compatibilidade**: Alinhado com os requisitos do WNS para notificações brutas.
* **Simplicidade**: Não requer bibliotecas externas, facilitando a integração em ambientes restritos.