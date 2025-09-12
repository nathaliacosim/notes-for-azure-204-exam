# 🔑 Fluxo de Autenticação OAuth 2.0 / OpenID Connect (OIDC)

O **OAuth 2.0** e o **OIDC** são protocolos usados para autenticação e autorização de forma segura em aplicações modernas.  

---

## 📝 Authorization Code Flow
**Indicado para:** Aplicações web e apps que podem proteger um segredo de cliente.  
- Usuário interage com o app e fornece credenciais.  
- Aplicação recebe um **código de autorização** e troca por **tokens de acesso e ID**.  
- Permite acessar APIs em nome do usuário.

### 🔹 Exemplo
1. Usuário clica em **Entrar**.  
2. Redirecionamento para a tela de login da Microsoft.  
3. Usuário autentica e o app recebe **código de autorização**.  
4. Código é trocado por **Access Token** e **ID Token**.  
5. Aplicação acessa a API com o token.

---

## 📝 Client Credentials Flow
**Indicado para:** Aplicações servidor-a-servidor (sem usuário).  
- A aplicação usa **Client ID** e **Secret** para obter token diretamente do Azure AD.  
- Permite que apps acessem APIs de forma autônoma, sem interação do usuário.

### 🔹 Exemplo
1. Aplicação envia **Client ID + Secret** para o Azure AD.  
2. Recebe **Access Token**.  
3. Acessa a API com o token, sem precisar do usuário.

---

## 📝 Device Code Flow
**Indicado para:** Dispositivos com entrada limitada (TVs, consoles, IoT).  
- Dispositivo gera um **código de dispositivo**.  
- Usuário acessa outro dispositivo (PC ou celular) e faz login.  
- O dispositivo obtém o token após a autenticação do usuário.

### 🔹 Exemplo
1. Dispositivo mostra **código e URL** para login.  
2. Usuário acessa a URL em outro dispositivo e faz login.  
3. Dispositivo recebe **Access Token** e pode acessar a API.

---

## ⚡ Boas Práticas
- ✅ Use **MFA** para segurança adicional.  
- ✅ Use **Managed Identities** para autenticação de recursos do Azure sem secrets.  
- ✅ Configure **Acesso Condicional** para controlar quem e como acessa os recursos.  
- ✅ **Valide tokens** antes de confiar nas informações.  
- ✅ Utilize **Refresh Tokens** para manter sessões longas sem pedir login novamente.
