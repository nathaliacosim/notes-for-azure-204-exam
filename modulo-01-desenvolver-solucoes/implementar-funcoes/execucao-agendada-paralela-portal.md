# 🛠️ Hands-On | Execução Agendada e Paralela com Azure Functions

## 📋 Pré-Requisitos
- Conta no **Azure**.  
- **Azure CLI** instalada.  
- **Azure Function App** criado previamente.  

---

## 🚀 Parte 1 – Criar a Função com Gatilho de Timer
No portal Azure:

1. Acesse sua **Azure Function App**.  
2. Clique em **Functions** > **Adicionar**.  
3. Selecione o template **Timer trigger**.  
4. Dê um nome: `AgendadorParalelo`.  
5. Configure a expressão **CRON**, por exemplo:  
   ```cron
   0 */2 * * * *
    ```
*(a cada 2 minutos)*

---

## 💻 Parte 2 – Código de Exemplo para Execução Paralela

```python
import logging
import azure.functions as func
import time
import random
 
def main(mytimer: func.TimerRequest) -> None:
    exec_id = random.randint(1000, 9999)
    logging.info(f"Execução #{exec_id} iniciada.")
    time.sleep(20)
    logging.info(f"Execução #{exec_id} finalizada.")
```

👉 Esse exemplo simula uma tarefa longa e permite observar **execuções simultâneas**.

---

## 📊 Parte 3 – Monitorar Execuções em Paralelo

* Acompanhe pelo painel de **logs** no portal Azure > **Monitoramento**.
* Verifique que novas instâncias são criadas conforme necessidade.