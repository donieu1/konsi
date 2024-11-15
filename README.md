Desafio Flutter - Assistente de Busca de CEP para Carlos
🚀 Projeto desenvolvido para otimizar a rotina de um servidor público que precisa de um processo rápido e eficiente para a busca e organização de CEPs e endereços.

💡 Objetivo do Projeto
O objetivo deste aplicativo é melhorar o fluxo de trabalho do Carlos, que diariamente precisa pesquisar CEPs, visualizar endereços no mapa e anotar tudo para futuras consultas. Este app simplifica as etapas de pesquisa e armazenamento de dados, permitindo uma gestão mais prática e moderna.

🎯 Problema
Carlos enfrenta as seguintes dificuldades:

Anotações manuais: Ele precisa anotar cada CEP e endereço numa caderneta, o que consome tempo.
Busca de CEP: Carlos se perde nos sites de CEP, principalmente quando os dados do documento contêm CEPs inválidos.
Visualização no Mapa: Localizar endereços no mapa torna-se uma tarefa demorada e complexa para ele.
✅ Solução Proposta
Desenvolvemos um aplicativo Android em Flutter que permite ao Carlos:

Consultar CEPs e visualizar automaticamente o bairro correspondente.
Acessar um mapa interativo para ver a localização.
Armazenar os endereços consultados para futuras referências.
Design: A interface foi baseada em um arquivo Figma fornecido, para garantir uma experiência de uso intuitiva e amigável. 🎨

🛠️ Tecnologias e Arquitetura Utilizadas
Flutter com Dart: Para construção da interface e lógica do aplicativo.
Gerenciamento de Estados com BLoC: Manutenção de um código limpo e organizado.
Hive para armazenamento local: Permite salvar e consultar endereços rapidamente.
Clean Arch: Estrutura modular e escalável para facilitar a manutenção e futuras expansões.
APIs de CEP e Mapa: Integração para busca de endereços e visualização no mapa.

📲 Funcionalidades
🔍 Busca de CEP: Pesquisa rápida e eficiente com validação de dados.
🗺️ Visualização no Mapa: Mostra a localização exata de cada CEP pesquisado.
📝 Armazenamento de Dados: Todos os endereços pesquisados são salvos automaticamente.
📖 Histórico de Pesquisa: Carlos pode acessar e reutilizar os CEPs e endereços já consultados, economizando tempo e trabalho.
📦 Instalação e Configuração
Para rodar o projeto localmente, siga os passos abaixo:

Clone o repositório:

bash
Copiar código
git clone https://github.com/donieu1/konsi.git
cd konsi
Instale as dependências:


flutter pub get
Execute o app:


flutter run
Nota: Certifique-se de ter o Flutter configurado e atualizado em sua máquina.

🌐 Recursos Úteis para Iniciantes no Flutter
Se você está começando no Flutter, alguns recursos que podem ajudar:

Clareza e legibilidade do código 💡
Escalabilidade 🚀
Uso de Futures e async para chamadas de API ⏳
Fidelidade ao Design (Figma) 🎨
Responsividade da Interface 📱
Uso de Plugins e pacotes compatíveis com Flutter 🔌
Gerenciamento de Estados e Manutenção com BLoC 📐
🤝 Contribuições
Contribuições são bem-vindas! Sinta-se à vontade para abrir uma issue ou enviar um pull request.

📜 Licença
Esse projeto está sob a licença MIT. Para mais detalhes, consulte o arquivo LICENSE.

📞 Contato
Caso tenha alguma dúvida ou sugestão, entre em contato:

📧 Email: dbreno09@gmail.com  
💼 LinkedIn: Daniel Martins
Desenvolvido com ❤️ por Donieu e powered by Flutter!
