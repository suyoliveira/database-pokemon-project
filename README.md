# Trabalho Prático: Análise de Dados do Banco Pokémon 🐾

Repositório acadêmico dedicado ao desenvolvimento e à implementação de consultas analíticas avançadas utilizando MySQL, executadas em ambiente Laragon.

## 👥 Integrantes do Grupo
* [
Taislene da Silva Gonçalves
Suyane Oliveira da Silva
Isaque Miranda Cidade
Antônio Marinho Neto
João Victor Araújo Jaguaribe
]


## 📂 Estrutura do Repositório
* `database/` - Contém os arquivos de suporte ou o dump original utilizado para a importação e estruturação do banco `pokemon_db`.
* `queries/` - Contém os scripts SQL correspondentes a cada questão solicitada no trabalho.
  * `Q1.sql` - Consulta analítica da Questão 1 (envolvendo eixo temporal por geração, funções de janela, média acumulada de tendência e ranking Top 3 com tratamento de empates via `DENSE_RANK()`).

## ⚙️ Como Executar o Ambiente
1. Certifique-se de ter o MySQL (via Laragon) ativo na sua máquina.
2. Abra o terminal do MySQL e importe a base de dados original utilizando o comando de dump:
   ```sql
   source Caminho/Para/O/Seu/Dump.sql;