### 🧩 Códigos de Completar — Questões Similares em Simulados e na Prova AZ-204

📚 **Domínio:** Desenvolver soluções de computação do Azure

Cenário comum em simulados (e também presente na prova):  
Você precisa implantar um aplicativo web no Azure usando o **App Service no Linux**, com uma **imagem Docker personalizada**. Após criar o **Plano de Serviço de Aplicativo** e publicar o contêiner, é necessário **acessar os logs do console gerados pelo contêiner em tempo real**.

A questão exige que você **complete o comando da Azure CLI** corretamente para visualizar esses logs.

🧪 Comando esperado:

```bash
az webapp log config --name webappnath --resource-group rg-nath --docker-container-logging
```

Ou, em alguns contextos, a versão sem o parâmetro específico:

```bash
az webapp log tail --name webappnath --resource-group rg-nath
```

🔍 **Dica:**  
O parâmetro `--docker-container-logging` é essencial quando o App Service está executando uma imagem Docker personalizada. Ele garante que os logs do contêiner sejam exibidos corretamente no terminal.

---

💡 Esse tipo de questão costuma aparecer como "complete o comando" ou "qual comando permite visualizar os logs em tempo real?".  
Vale a pena memorizar a estrutura e entender o contexto de uso!
