# EC2-PostgreSQL
Neste Repositório será tratado sobre comandos básicos de postgre utlizando o EC2 da AWS para fins de estudos relacionados a Engenharia de Dados

🔷 EC2 da AWS o que é?
O Amazon Elastic Compute Cloud (Amazon EC2) é um serviço da web que oferece a capacidade de computação segura, redimensionável e virtualizada na nuvem. Ele funciona como servidores virtuais (instâncias) onde é possível hospedar aplicações, sites e bancos de dados sem gerenciar hardware físico, pagando apenas pelo que usa.

* Principais Características e Benefícios:
- Máquinas Virtuais (Instâncias): Permite alugar servidores com diferentes capacidades de CPU, memória, armazenamento e rede.
- Elasticidade: Capacidade de aumentar ou diminuir a quantidade de instâncias automaticamente conforme a demanda.
- Flexibilidade de SO: Suporte para sistemas operacionais Linux, Windows e macOS.
- Tipos de Instância: Variedade de opções otimizadas para diferentes cargas de trabalho (computação intensiva, memória, etc.).
- Pagamento por Uso: Cobrança baseada no tempo de execução, com opções de instâncias sob demanda (sob demanda) ou instâncias spot (descontos para capacidade não utilizada). 

O EC2 é um dos serviços fundamentais da AWS, projetado para facilitar a computação na nuvem para desenvolvedores e empresas de qualquer tamanho.

🔷 O PostgreSQL o que é?
PostgreSQL (também conhecido como Postgres) é um sistema gerenciador de banco de dados relacional (SGBD) objeto-relacional de alto desempenho, código aberto (open source) e amplamente utilizado por sua confiabilidade e robustez.

* Aqui está um resumo detalhado do que é o Postgres:
- Relacional e Objeto-Relacional: Organiza dados em tabelas (linhas e colunas), mas também suporta recursos avançados de orientação a objetos, como herança de tabelas e tipos de dados definidos pelo usuário.
- Código Aberto (Open Source): É gratuito, não exigindo licenças comerciais para uso. É mantido por uma comunidade global ativa, com suporte de grandes empresas.
- Conformidade Padrão: É conhecido por sua estrita aderência aos padrões SQL (ANSI-SQL), garantindo portabilidade e confiabilidade dos dados.
- Recursos Avançados: Suporta chaves estrangeiras, gatilhos (triggers), visões (views), consultas complexas, transações aninhadas e integridade referencial.
- Versatilidade: Além de relacional, o PostgreSQL tem excelente suporte para dados não relacionais, permitindo o armazenamento e consulta de dados no formato JSON de maneira eficiente.
- Alto Desempenho: Projetado para lidar com grandes volumes de dados e alta intensidade de acessos simultâneos, sendo ideal para aplicações corporativas e sites de e-commerce.
- Extensibilidade: Permite criar novas funções e índices, além de suportar extensões populares, como o PostGIS para dados geográficos. 

Em resumo, o PostgreSQL é uma ferramenta robusta e gratuita para quem precisa gerenciar bancos de dados complexos com segurança e performance. 

🔷 Como iniciar no EC2?
Primeiramente será necessário criar uma conta na AWS, ao concluir o cadastro o AWS será necessário vincular um cartão de crédito (poderá ser cobrado no futuro cuidado para não esquecer uma instância aberta) para possíveis cobranças mensais. Posteriormente do cadastro será redirecionado a tela inicial do console da AWS lá é possível ver gerenciamento de custos, aplicações, entre outras coisa, mas o principal está ao apertar nas 3 barrinhas no canto superior esquerdo e entrar na opção todos os serviços e assim olhar na parte computação e selecionar EC2.
Com isso será redirecionado ao painel do EC2 onde mostrará informações sobre instâncias criadas, custos, entre outros. Por enquanto não haverá nada nesta tela para nos preocuparmos, com isso vamos clicar em executar instância.
Posteriormente, vamos colocando o nome da instância (pode ser o nome de sua preferência), na escolha do SO vamos em Linux Ubuntu (pode ser o último lançado), após isso escolhemos o tipo t3.micro como tipo de instância, após isso criaremos o par de chaves para se conectar com segurança na instância (caso ja tenha alguma pode selecionar ela), na parte de rede habilitaremos o acesso via SSH que será o mais utilizado via CMD ou PowerShell, então não precisaremos mexer em mais nada podemos apertar em executar instância na direita.
Com isso criamos nossa instância.

🔷 Como acessar a instância?
Lembra que habilitamos o SSH? Será via SSH pelo CMD que faremos o acesso, ao criar provavelmente a instância ja estará executando, apenas devemos clicar no ID da instância, ali abriremos todas as informações da instância criada e caso necessário fazer alguma alteração ali mesmo, posteriomente clicaremos em conectar. Será aberto a opção de SSH, ali devemos copiar a última linha de comando que o próprio AWS proporciona, mas antes devemos entrar na pasta que foi salva o par de chaves. Para isso apenas devemos escrever no CMD "cd C:\Users\caminho do arquivo" após isso entraremos na pasta e assim apenas vamos colar a linha que o AWS nos deu, após isso escrever "yes" com isso parabéns você entrou na sua instância Ubuntu do EC2 da AWS.

🔷 Tentei entrar na instância mas deu erro de segurança o que fazer?
Talvez o seu arquivo de par de chaves tenha dado erro igual o meu, se não pode pular este tópico. Caso sim, é simples arrumar o que aconteceu é que o arquivo está aberto a todos poderem alterar, e com isso apenas devemos entrar nas propriedades e excluir de todos o acesso e apenas deixar que o ADM possa ler e executar o arquivo. Pronto seu arquivo foi corrigido. Caso não ache a opção é simples:
1. Clicar com o botão direito no arquivo e selecionar propriedades;
2. Entrar na aba Segurança e clicar em "Editar";
3. Com isso remova todos e deixe apenas o login ADM do pc;
4. Clicar em Aplicar e fechar tudo.

🔷 Entrei na instância e agora para usar o Postgres?
Bom devemos baixar o postgres seguindo os seguintes passo:
1. Instalar o unzip para caso queira utilizar de arquivos .zip pra isso apenas digitaremos: "sudo apt-get install unzip"
2. Agora entraremos no site do PostgreSQL e entraremos em download na aba de Linux, Ubuntu;
3. Procure este comando copie e cole: sudo sh -c "echo 'deb [signed-by=/usr/share/postgresql-common/pgdg/apt.postgresql.org.asc] https://apt.postgresql.org/pub/repos/apt $VERSION_CODENAME-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
4. Então copiaremos e colaremos: wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
5. Atualizar a lista do apt-get: sudo apt-get update
6. Por fim instalar o postgresql: sudo apt-get -y install postgresql
7. Agora entraremos no postgres utilizando: sud su - postgres
8. Uma sugestão criar um diretório para armazenar os bancos: mkdir relacional
9. Agora caso criou vamos entrar: cd relacional/
10. Estou utlizando para estudos os dados deste lugar: wget https://www.datascientist.com.br/engdados/relacional.zip
11. Vamos descompactar este zip: unzip relacional.zip
12. Caso queira ver o conteúdo do arquivo apenas digite: cat 1.CreateTable.sql
13. \list - Para listarmos os bancos existentes
14. Criaremos o banco: create database ed;
15. Entraremos no banco: \c ed;
16. Agora iremos executar o script digitaremos: \i /var/lib/postgresql/1.CreateTable.sql
17. Faça o mesmo para os demais o script 6
18. Podemos executar o comando para ver as tabelas: "\dt *.*"
19. Com isso você está pronto para inciar os estudos. Boa sorte.
