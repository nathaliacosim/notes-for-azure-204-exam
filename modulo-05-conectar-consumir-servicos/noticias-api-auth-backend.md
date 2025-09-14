## **Autenticação de Back-end com Certificado de Cliente no Azure API Management**

### **Cenário**
Estamos desenvolvendo uma solução de gateway para uma **API pública de notícias**, cujo back-end é implementado como um serviço **RESTful** hospedado em uma instância do **Serviço de Aplicativo do Azure (Azure App Service)**. A API será exposta por meio do **Azure API Management (APIM)**, que atuará como camada intermediária entre os consumidores da API e o serviço de back-end.

---

### **Objetivo**
Garantir uma comunicação segura e autenticada entre o **gateway (APIM)** e o **serviço de back-end**, utilizando um mecanismo robusto de autenticação.

---

### **Configuração Recomendada**

#### **Target (Destino): HTTP(s) endpoint**
- O serviço de back-end expõe um ponto de extremidade seguro via HTTPS.
- O APIM deve ser configurado para encaminhar as requisições para esse endpoint.

#### **Gateway Credentials (Credenciais do Gateway): Certificado de Cliente**
- A autenticação baseada em **certificado de cliente** é a abordagem recomendada para esse cenário.
- O certificado é instalado no APIM e apresentado ao serviço de back-end durante a negociação TLS.
- Essa técnica garante que apenas gateways autorizados possam se comunicar com o serviço de back-end.

---

### **Justificativa Técnica**
Usar um **certificado de cliente** como credencial de gateway é a escolha correta para autenticação em um ponto de extremidade HTTPS. Os certificados de cliente fornecem uma forma segura e confiável de autenticar o gateway perante o serviço de back-end, garantindo:

- **Confidencialidade**: A comunicação é criptografada de ponta a ponta.  
- **Autenticidade**: O back-end pode verificar a identidade do gateway.  
- **Integridade**: Reduz o risco de interceptação ou modificação de mensagens.

---

### **Resumo da Configuração**

| Parâmetro              | Valor Recomendado     |
|------------------------|----------------------|
| **Target**             | HTTP(s) endpoint     |
| **Gateway Credentials** | Certificado de Cliente |

---
