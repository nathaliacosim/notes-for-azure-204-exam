# **Documentação Técnica – Contoso, Ltd. – Monitoramento e Revisão de Conteúdo do SPA**

## **Cenário**
A Contoso, Ltd. possui um **site de rede social** desenvolvido como um **Aplicativo de Página Única (SPA)**. O conteúdo enviado pelos usuários é armazenado no **Azure Blob Storage**.  

O processo de monitoramento de conteúdo ocorre da seguinte forma:

1. Usuários enviam conteúdo via SPA para o **ContentUploadService**.  
2. O **ContentAnalysisService** processa o conteúdo enviado, identificando possíveis conteúdos inapropriados.  
3. Conteúdos aprovados são publicados; conteúdos rejeitados geram mensagens de rejeição.

### **Implantação do ContentAnalysisService**
- Usado **Azure Container Instances** a partir de um **Registro de Contêiner do Azure privado** (`contosoimages`).  
- Requisitos de CPU: **8 núcleos**.  
- Alta disponibilidade: serviços distribuídos entre **múltiplas regiões**.

### **Autenticação e Controle**
- A Contoso, Ltd. utiliza **Microsoft Entra ID** para autenticação de usuários internos e convidados.  
- Revisores devem pertencer à função **ContentReviewer**.  
- Todas as revisões incluem o **e-mail do revisor** para auditoria.

### **Segurança**
- Proteção contra **XSS** em serviços web públicos.  
- Todos os sites e serviços devem usar **SSL** válido.  
- Chaves do **Azure Storage** mantidas apenas na memória.  
- Serviços internos acessíveis apenas via **VNets internas**.  
- Restrições de tráfego e autenticação obrigatória para todas as chamadas de serviço.  
- **Políticas de segurança de rede**:  
  - Certificado SSL: Certificado raiz válido  
  - Tipo de proxy: **Azure Application Gateway**

### **Requisitos Funcionais**
- Função do Azure: **CheckUserContent** para executar verificações de conteúdo.  
- Contratos de usuário: consentimento para revisão de conteúdo, armazenamento de cookies e rastreamento de IPs.  
- Volume esperado: **milhões de contratos por hora**.  
- Teste de validação: novas versões do ContentAnalysisService devem reprocessar **7 dias de conteúdo** para garantir consistência.

### **Monitoramento**
- Alerta se o **ContentUploadService** utilizar mais de **80% dos núcleos de CPU disponíveis**.  
- Problema relatado: HTTP 502 em páginas específicas.

---

## **Exemplo de Configuração – ContentUploadService**

```yaml
apiVersion: '2018-10-01'
type: Microsoft.ContainerInstance/containerGroups
location: westus
name: contentUploadService
properties:
  containers:
  - name: service
    properties:
      image: contoso/contentUploadService:latest
      ports:
      - port: 80
        protocol: TCP
      resources:
        requests:
          cpu: 1.0
          memoryInGB: 1.5
  //CS17
  osType: Linux
  ipAddress:
    ip: 10.23.121.112
    ports:
    - port: 80
      protocol: TCP
  //CS23
  //CS24
  networkProfile:
    id: /subscriptions/19/resourceGroups/container/providers/Microsoft.Network/networkProfiles/subnet26
````

---

## **Exemplo de Manifesto – ContentAnalysisService**

```json
{
  "id": "2b079f03-9b06-2d44-98bb-e9182901fcb6",
  "appId": "7118a7f0-b5c2-4c9d-833c-3d71396f5e6a",
  //AM04
  "createdDateTime": "2019-12-24T06:01:44Z",
  "logoUrl": null,
  "logoutUrl": null,
  "name": "ContentAnalysisService",
  //AM09
  //AM10
  "orgRestrictions": [],
  "parentalControlSettings": {
    "countriesBlockedForMinors": [],
    "legalAgeGroupRule": "Allow"
  },
  "passwordCredentials": []
}
```

---

## **Perguntas de Configuração**

### **Pergunta 1**

Adicionar código na linha `AM09` para que os usuários possam revisar o conteúdo usando ContentAnalysisService.

**Resposta:**

* Caixa 1: `"oauth2AllowIdTokenImplicitFlow": true`
* Caixa 2: `"oauth2AllowImplicitFlow": true`

### **Pergunta 2**

Adicionar código na linha `AM10` do manifesto para atender ao requisito de revisão manual.

**Resposta:**

* Caixa 1: `sid`
* Caixa 2: `email`

### **Pergunta 3**

Armazenamento de contratos de usuário após conclusão:

**Resposta:** Hub de Eventos do Azure

### **Pergunta 4**

Monitoramento do `ContentUploadService`:

**Resposta:**

```bash
az monitor metrics alert create --name <alerta> --resource-group <Cg> --scopes <resource_id> --condition "Uso da CPU > 800"
```

### **Pergunta 5**

Investigação de logs do servidor HTTP do `ContentUploadService`:

**Resposta:**

```bash
az container attach
```

### **Pergunta 6**

Adicionar marcação na linha `AM04` para implementar a função `ContentReview`:

**Resposta:**

* Caixa 1: `allowedMemberTypes`
* Caixa 2: `User`
* Caixa 3: `value`

### **Pergunta 7**

Adicionar marcação YAML na linha `CS17` para que o `ContentUploadService` possa acessar as chaves do Azure Storage:

**Resposta:**

* Caixa 1: `volumeMounts`
* Caixa 2: `volumes`
* Caixa 3: `secret`

### **Pergunta 8**

Hospedagem da função `CheckUserContent` do Azure atendendo segurança e custo:

**Resposta:** Plano de serviço de aplicativo

### **Pergunta 9**

Configuração do teste de validação de conteúdo:

**Resposta:**

* Caixa 1: `ImagePushed`
* Caixa 2: `repositório`
* Caixa 3: `tópico`

### **Pergunta 10**

Implantação do `ContentUploadService` – duas ações necessárias:

**Resposta:**

1. Linha CS23: `type: Private`
2. Linha CS24: `osType: Linux`

### **Pergunta 11**

Garantir que as políticas de segurança de rede sejam atendidas:

**Resposta:**

* Certificado SSL: Certificado raiz válido
* Tipo de proxy: Azure Application Gateway

---

## **Resumo de Componentes e Regras**

| Componente                    | Função / Requisito                                       |
| ----------------------------- | -------------------------------------------------------- |
| ContentUploadService          | Recebe conteúdo do SPA, alerta em alta CPU               |
| ContentAnalysisService        | Processa conteúdo para identificar conteúdo inapropriado |
| CheckUserContent (Azure Func) | Executa verificação de conteúdo                          |
| Revisores (ContentReviewer)   | Revisam conteúdo, com auditoria por e-mail               |
| Microsoft Entra ID            | Autenticação e controle de acesso                        |
| Storage & VNets               | Armazenamento seguro, acesso interno apenas              |
| Monitoramento                 | Alertas de CPU, logs de falha                            |
| Contratos de Usuário          | Consentimento, auditoria, rastreamento de IP             |
| Segurança de Rede             | SSL válido, proxy: Azure Application Gateway             |