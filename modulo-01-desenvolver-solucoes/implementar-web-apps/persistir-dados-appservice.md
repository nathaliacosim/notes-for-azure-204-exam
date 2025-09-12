## 🛠️ Persistência de Dados em Aplicativo Web ASP.NET Core no Azure

### 📌 Cenário

Você está desenvolvendo um aplicativo web utilizando **ASP.NET Core** e pretende implantá-lo no serviço **Azure App Service para Contêineres**. Durante a execução, o aplicativo precisa **armazenar dados de diagnóstico** que devem **persistir mesmo após reinicializações** do contêiner.

### 💡 Desafio

Por padrão, os contêineres no Azure App Service não mantêm dados gravados em disco após reinicializações. Portanto, é necessário configurar o ambiente para que os dados sejam armazenados em um local **persistente**.

### 🧪 Exemplo de Código

O trecho abaixo mostra como o aplicativo grava os dados de diagnóstico:

```csharp
public void SaveDiagData(string data){
    var path = Environment.GetEnvironmentVariable("DIAGDATA");
    File.WriteAllText(Path.Combine(path, "data"), data);
}
```

Neste exemplo, o caminho onde os dados serão salvos é obtido por meio da variável de ambiente `DIAGDATA`.

### ⚙️ Solução

Para garantir que os dados sejam armazenados em um local persistente, você deve configurar o aplicativo com a seguinte variável de ambiente:

| Configuração do Aplicativo | Valor     |
|----------------------------|-----------|
| `WEBSITES_ENABLE_APP_SERVICE_STORAGE` | `true`     |

Além disso, defina a variável `DIAGDATA` apontando para o diretório persistente:

| Variável de Ambiente | Valor     |
|----------------------|-----------|
| `DIAGDATA`           | `/home`   |

### 📂 Por que usar `/home`?

O diretório `/home` é uma área de armazenamento **persistente** fornecida pelo Azure App Service. Ele é montado em todos os contêineres e **sobrevive a reinicializações**, garantindo que os dados gravados ali não sejam perdidos.

### ✅ Resultado Esperado

Com essas configurações:

- O método `SaveDiagData` salva os dados no caminho `/home/data`.
- Os dados permanecem disponíveis mesmo após reinicializações do contêiner.
- O aplicativo continua funcionando corretamente sem perda de informações de diagnóstico.