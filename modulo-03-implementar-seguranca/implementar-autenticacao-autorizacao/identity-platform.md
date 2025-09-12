# 🚀 Microsoft Identity Platform

O **Microsoft Identity Platform** permite gerenciar usuários, grupos e permissões de forma centralizada.  
Em vez de cada aplicativo ter seu próprio sistema de login, usamos um único provedor de identidade com suporte a protocolos amplamente adotados, como **OAuth 2.0**, **OpenID Connect** e **SAML**, garantindo **🔒 segurança** e **⚡ compatibilidade**.

---

## 🧩 Conceitos Fundamentais

- **👤 Usuário:** Pessoa ou conta que acessa o sistema.  
- **👥 Grupo:** Conjunto de usuários com permissões ou funções compartilhadas.  
- **🔑 Entidade de Serviço (Service Principal):** Representa aplicativos ou serviços que precisam acessar recursos de forma automatizada.  
- **🔐 Autenticação x Autorização:**  
  - **Autenticação:** Verifica *quem você é*.  
  - **Autorização:** Determina *o que você pode fazer*.  
- **📝 Tokens de Acesso:** Credenciais temporárias emitidas para acessar APIs ou recursos de forma segura.  
- **📲 Autenticação Multifator (MFA):** Camada extra de segurança que exige múltiplas formas de verificação (senha + código SMS ou app).

---

## 🌐 Protocolos Suportados

- **OAuth 2.0:** Autorização baseada em tokens.  
- **OpenID Connect:** Extensão do OAuth 2.0 para autenticação federada (login único entre apps mod  ernos).  
- **SAML:** SSO para aplicações legadas (principalmente sistemas antigos).  
- **JWT (JSON Web Token):** Formato padrão de token usado para transportar informações de autenticação e autorização.

---

## 🔑 Métodos de Autenticação

- **Senha tradicional:** Login com usuário e senha.  
- **MFA:** Confirmação via SMS, app autenticador ou push.  
- **Autenticação sem senha:** Windows Hello, FIDO2, chaves físicas.  
- **SSO (Single Sign-On):** Login único que permite acessar múltiplos aplicativos sem repetir credenciais.

---

## ⚙️ Configurando no Microsoft Entra ID

1. Criar um diretório no **Entra ID** via Azure Portal.  
2. Registrar o aplicativo (obter **Client ID** e **Secret**).  
3. Definir permissões em **API Permissions** (ex.: `openid`, `profile`, `User.Read`).  
4. Conceder o consentimento para o aplicativo acessar os recursos.

---

## 🌟 Vantagens da Plataforma

- **🔒 Segurança:** Suporte a MFA, tokens e roles.  
- **⚡ SSO escalável:** Acesso único para múltiplos aplicativos.  
- **🛠️ Gerenciamento centralizado:** Controle simplificado de usuários, grupos e políticas.  
- **✨ Suporte moderno:** Identidade sem senha, compatível com padrões de mercado.

---

> 💡 **Dica de estudo:** Lembre-se de diferenciar **autenticação** (quem você é) de **autorização** (o que você pode fazer), pois cai bastante na prova AZ-204.