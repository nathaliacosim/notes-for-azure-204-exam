## **Implementação de Azure Service Bus para Aplicativo de Entrega Móvel**

### **Cenário**
Estamos desenvolvendo um aplicativo móvel para um serviço de entrega, no qual usuários podem fazer pedidos em restaurantes da sua região. O fluxo de trabalho do aplicativo segue as etapas abaixo:

1. O motorista seleciona os restaurantes para os quais deseja realizar entregas.  
2. Os pedidos são enviados a todos os motoristas disponíveis na região.  
3. Cada motorista visualiza apenas os pedidos dos restaurantes que selecionou.  
4. O primeiro motorista a aceitar um pedido o remove da lista de pedidos disponíveis.

### **Objetivo**
Implementar uma solução escalável e eficiente utilizando o **Azure Service Bus**, que permita distribuir os pedidos de forma seletiva e garantir que cada pedido seja atribuído a apenas um motorista.

---

### **Solução Técnica com Azure Service Bus**

Para atender aos requisitos do fluxo de trabalho, a solução será composta pelas seguintes ações:

#### **1. Criar um único namespace do Service Bus**
- O namespace funciona como um contêiner lógico para os recursos do Service Bus.
- Centraliza a gestão de tópicos e assinaturas, facilitando o controle e a escalabilidade.

#### **2. Criar um único tópico do Service Bus**
- O tópico será o canal de publicação dos pedidos.
- Permite que múltiplos motoristas (assinantes) recebam mensagens simultaneamente.

#### **3. Criar uma assinatura do Service Bus para cada restaurante selecionado por um motorista**
- Cada assinatura será configurada com **filtros baseados em propriedades da mensagem**, como o identificador do restaurante.
- Isso garante que o motorista receba apenas os pedidos dos restaurantes que escolheu.
- Quando um motorista aceita um pedido, a mensagem é consumida e removida da fila, evitando duplicidade.

---

### **Benefícios da Arquitetura Proposta**
- **Escalabilidade**: Suporta grande volume de pedidos e motoristas simultaneamente.  
- **Eficiência**: Reduz o tráfego de mensagens irrelevantes para cada motorista.  
- **Controle**: Permite rastrear e auditar o fluxo de mensagens e entregas.  
- **Desempenho**: Minimiza latência na entrega de pedidos aos motoristas certos.