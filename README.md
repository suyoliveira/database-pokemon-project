# Trabalho Prático: Análise de Dados do Banco Pokémon 🐾

Repositório acadêmico dedicado ao desenvolvimento e à implementação de consultas analíticas avançadas, procedimentos armazenados, views gerenciais/analíticas e triggers de auditoria utilizando MySQL (versão 8.0), executadas em ambiente Laragon.

## 👥 Integrantes do Grupo
* Taislene da Silva Gonçalves
* Suyane Oliveira da Silva
* Isaque Miranda Cidade
* Antônio Marinho Neto
* João Victor Araújo Jaguaribe

---

## 📂 Estrutura do Repositório e Questões Implementadas

O projeto está dividido para atender a todos os requisitos propostos no trabalho prático:

* `database/` - Contém o dump original e os scripts de estruturação do banco `pokemon_db`.
* `queries/`
  * **`Q1.sql`** - **Panorama Temporal e Ranking (Funções de Janela):** Consulta analítica utilizando gerações como eixo temporal, rankeamento "Top 3" de ataque por geração e tipo com tratamento de empates (`DENSE_RANK()`), acompanhada de tendência por média acumulada.
  * **`Q2.sql`** - **View Analítica de Qualidade de Dados:** Criação da view `view_qualidade_pokemon` para monitorizar desvios de status totais em relação à média geral, classificando os registos por scores de prioridade (Outliers e fora do padrão).
  * **`Q3.sql`** - **Garantia de Regra de Negócio (Triggers e Auditoria):** Implementação da tabela `log_auditoria` e dos triggers `NEW_MOVE` e `UPDATE_MOVE` na tabela `moves` para bloquear valores negativos ou fora da faixa permitida, registando automaticamente a tentativa de violação com rastreabilidade de utilizador e operação.
  * **`Q4.sql`** - **Automação de Relatórios (Stored Procedure):** Criação da procedure parametrizada `relatorio_pokemon(IN p_geracao INT)` que valida os parâmetros e consolida métricas de quantidade, somas e médias de ataque e HP por geração.
  * **`Q5.sql`** - **Views para Diferentes Perfis:** Desenvolvimento de duas visões de consumo distintas:
    * *Perfil Gerencial:* Visão macro e agregada por geração.
    * *Perfil Analítico:* Visão detalhada por Pokémon para acompanhamento operacional.

---

## ⚙️ Como Executar o Ambiente

1. Certifique-se de ter o MySQL (via Laragon) ativo na sua máquina.
2. Abra o terminal do MySQL e selecione/importe a base de dados:
   ```sql
   CREATE DATABASE IF NOT EXISTS pokemon_db;
   USE pokemon_db;
