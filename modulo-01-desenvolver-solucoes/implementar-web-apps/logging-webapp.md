## 📑 Configuração de Logs no Azure App Service

### 🖥️ Comando completo

```bash
az webapp log config --name webapp-nath-204 \
  --resource-group rg-nath-204 \
  --web-server-logging filesystem \
  --detailed-error-messages true \
  --failed-request-tracing true \
  --application-logging filesystem \
  --level verbose \
  --retention-days 7 \
  --quota 35
```

---

### 🔍 Que comando é esse?

`az webapp log config` → serve para **configurar o logging** de um **Web App do Azure App Service**.

Ele controla três áreas principais:

* **Application Logging** → logs de código/aplicação.
* **Web Server Logging** → logs de servidor HTTP.
* **Configurações extras** → detalhes de erro, tracing, retenção, quota.

---

### 📖 Linha por linha

```bash
az webapp log config --name webapp-nath-204 \
  --resource-group rg-nath-204 \
```

👉 Diz qual app você está configurando (**nome + grupo de recursos**).

---

```bash
  --web-server-logging filesystem \
```

👉 Habilita **Web Server Logging** (logs de requisições HTTP – status code, tempo de resposta etc.) e salva no **filesystem**.
Alternativas: `storage` (Blob Storage) ou `off` (desliga).

---

```bash
  --detailed-error-messages true \
```

👉 Ativa **mensagens de erro detalhadas** (HTML com stack trace, útil para depuração).
⚠️ Não recomendado em produção pública sem restrição de acesso.

---

```bash
  --failed-request-tracing true \
```

👉 Habilita **Failed Request Tracing (FREB logs)**, que grava informações detalhadas quando uma requisição falha (ex.: 500, 503).
Bom para entender por que um request deu erro.

---

```bash
  --application-logging filesystem \
```

👉 Ativa **logs de aplicação** (saída do seu código: `Console.WriteLine`, `ILogger`, etc.), gravando no **filesystem**.
Também poderia ser `storage`.

---

```bash
  --level verbose \
```

👉 Define o **nível de detalhe** dos logs de aplicação.
Opções: `error`, `warning`, `information`, `verbose`.
Aqui vai pegar **tudo** (`verbose`).

---

```bash
  --retention-days 7 \
```

👉 Mantém os logs no filesystem por **7 dias** antes de apagar automaticamente.

---

```bash
  --quota 35
```

👉 Define o **limite de espaço em disco (MB)** para logs no filesystem.
Exemplo: **35 MB** → quando atinge esse limite, logs mais antigos são substituídos.

---

### ⚠️ Observações importantes

* Logs em **filesystem são temporários**: se o App Service reinicia ou escala, você pode perder dados.
* Para **produção**, o ideal é usar **Application Insights** ou **Blob Storage**.
* Esse comando habilita praticamente **todos os tipos de logs** no App Service.

  * ✅ Ótimo para **testes e debugging**.
  * ⚠️ Em produção pode gerar **custo e impacto de performance**.