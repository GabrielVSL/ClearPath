# ClearPath

[![Status](https://img.shields.io/badge/STATUS-Concluído-success?style=for-the-badge&logo=check-circle&logoColor=white)](https://)
<div>
  
  [![Tecnologias](https://img.shields.io/badge/iOS-17+-blue?logo=apple)](https://)
  [![Swift](https://img.shields.io/badge/Swift-5.9-orange?logo=swift)](https://)
  [![Tecnologias](https://img.shields.io/badge/Backend-Node--RED-FF6A00?logo=node.js)](https://)
  [![Banco de Dados](https://img.shields.io/badge/Cloudant-IBM_Cloud-052FAD?logo=ibm)](https://)
  
</div>


📌 **Descrição breve**: Aplicativo iOS para gerenciamento inteligente de tarefas com sincronização em tempo real e inteligência artificial para priorização automática.

---

**Juntos na disputa pela saúde: vença o vício, conquiste a liberdade!**

---

## 👥 Integrantes
- Gabriel Victor
- Matheus Filipe
- Thiago Branco
- Lucas Gabriel

---

## 🚬 Origem da Ideia
**Problema identificado:**  
Parar de fumar é uma jornada solitária, sem apoio ou incentivo para continuar mesmo com pequenos progressos. Muitos usuários desistem por falta de suporte contínuo e motivação durante os momentos de recaída.

---

## 🏁 Principal Desafio
Manter a motivação e o engajamento dos usuários a longo prazo, oferecendo suporte contínuo e estratégias eficazes para lidar com as recaídas no processo de abandono do vício em nicotina.

---

## 💡 Solução
Plataforma de gamificação que estimula competições saudáveis entre comunidades, utilizando rankings para valorizar o progresso coletivo e fortalecer a motivação através de:

- Acompanhamento personalizado de progresso  
- Sistema de recompensas e conquistas  
- Comunidade de apoio mútuo  
- Dicas diárias baseadas em ciência  

**Categorias:**  
- Saúde e Bem-Estar  
- Estilo de Vida  
- Gamificação  

---

## 🛠️ Tecnologias Utilizadas

**Desenvolvimento iOS:**
- Swift 5.9
- SwiftUI para interface declarativa
- Combine para gerenciamento de fluxo de dados
- CoreData para armazenamento local
- Alamofire para requisições HTTP
- Swift Charts para visualização de dados

**Back-end:**
- Node.js com Express
- MongoDB Atlas (Banco de dados na nuvem)
- WebSocket para comunicação em tempo real
- Firebase Cloud Messaging (Notificações push)

**Ferramentas:**
- Xcode 15
- Figma (Design de interface)
- Postman (Teste de APIs)
- GitHub Projects (Gestão de tarefas)
- TestFlight (Distribuição de testes)

---

## 🚧 Desafios Enfrentados

- **Engajamento Contínuo:** Manter usuários motivados durante os altos e baixos do processo de abstinência  
- **Gestão de Recaídas:** Criar mecanismos eficazes para lidar com lapsos sem desencorajar os usuários  
- **Sincronização de Dados:** Integrar dados sensíveis de saúde entre iOS e IBM Cloudant de forma segura  
- **Dinâmica de Comunidade:** Balancear competição saudável com apoio colaborativo nos rankings  
- **Personalização em Escala:** Adaptar as metas de redução para diferentes perfis de fumantes mantendo performance  
- **Privacidade de Dados:** Garantir segurança das informações de saúde seguindo regulamentações  

---

## 🖥️ Protótipos de Tela

| Landing Page | Formulário | Tela Principal |
|-------------------|--------------------------|---------------------|
| ![Tela 1](/assets/landingPage.png) | ![Tela 2](/assets/formulario.png) | ![Tela 3](/assets/telaPrincipal.png) |

| Comunidade | Dicas Diárias | Perfil |
|-------------------|--------------------------|---------------------|
| ![Tela 1](/assets/comunidade.png) | ![Tela 2](/assets/dicasDiarias.png) | ![Tela 3](/assets/perfil.png) |

| Edição de Avatar | Ranking |
|-------------------|--------------------------|
| ![Tela 1](/assets/edicaoAvatar.png) | ![Tela 2](/assets/ranking.png) |

*Protótipos desenvolvidos no Figma e implementação final*

## 🎥 Demonstração

https://github.com/user-attachments/assets/c474b90c-9f38-4291-8f58-81a05a6ca9e3

---

## 📱 Funcionalidades Principais

1. **Cadastro Personalizado:**
   - Histórico de tabagismo
   - Metas de redução progressiva
   - Cálculo de gastos mensais

2. **Sistema de Gamificação:**
   - Conquistas por marcos atingidos
   - Ranking comunitário
   - Recompensas virtuais

3. **Suporte Diário:**
   - Dicas científicas para abstinência
   - Técnicas de controle de ansiedade
   - Registro de "dias limpos"

---

## ⚙️ Arquitetura do Sistema
```plaintext
1. Frontend (iOS App)
   │
2. Node-RED (Middleware)
   │
3. IBM Cloudant (Banco de Dados)
   │
4. Serviços Externos:
   - API de Notificações
   - Sistema de Análise de Dados
