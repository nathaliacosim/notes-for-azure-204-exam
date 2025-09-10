# 📦 Soluções Conteinerizadas no Azure

Este diretório reúne anotações e scripts relacionados ao uso de **contêineres no Azure**, parte do módulo **"Desenvolver Soluções"** do curso para certificação **AZ-204**.

O foco aqui é entender como criar, configurar e publicar aplicações em contêineres usando os principais serviços do Azure voltados para esse tipo de arquitetura.

---

## 🧭 Índice

- [📝 Visão Geral](#-visão-geral)
- [📁 Azure Container Apps (ACA)](./Azure%20Container%20Apps%20(ACA))
- [📁 Azure Container Instances (ACI)](./Azure%20Container%20Instance%20(ACI))
- [📜 Scripts de Provisionamento ACR](#-scripts-de-provisionamento-acr)
- [🧪 Simulado](./simulado-container.md)

---

## 📝 Visão Geral

As soluções conteinerizadas permitem empacotar aplicações com suas dependências, garantindo portabilidade, escalabilidade e consistência entre ambientes. No Azure, os principais serviços para isso são:

- **Azure Container Apps (ACA):** Ideal para microsserviços e aplicações serverless baseadas em contêineres.
- **Azure Container Instances (ACI):** Ótimo para execuções rápidas e isoladas de contêineres, sem necessidade de orquestrador.
- **Azure Container Registry (ACR):** Repositório privado para armazenar e gerenciar imagens de contêiner.

---

## 📜 Scripts de Provisionamento ACR

Este diretório inclui três scripts `.azcli` para provisionamento do Azure Container Registry com diferentes camadas de serviço:

| Script | Descrição |
|--------|-----------|
| [01-acr-basic.azcli](./01-acr-basic.azcli) | Criação de ACR com camada Basic |
| [02-acr-standard.azcli](./02-acr-standard.azcli) | Criação de ACR com camada Standard |
| [03-acr-premium.azcli](./03-acr-premium.azcli) | Criação de ACR com camada Premium |

Esses scripts podem ser executados no terminal do Azure CLI para provisionar rapidamente o repositório de imagens conforme o cenário desejado.

---

## 🧪 Simulado

O arquivo [simulado-container.md](./simulado-container.md) contém perguntas e respostas simuladas sobre soluções conteinerizadas, úteis para revisar conceitos e se preparar para o exame AZ-204.

---

## 📌 Observações

Este conteúdo é parte do meu processo de estudo para a certificação **AZ-204: Developing Solutions for Microsoft Azure**.  
As anotações podem conter insights pessoais, exemplos práticos e comandos úteis para aplicar em projetos reais.

---

**Vamos dominar o mundo dos contêineres no Azure e construir aplicações modernas, escaláveis e portáveis! 🐳☁️**