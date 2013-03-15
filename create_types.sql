DROP TYPE Jogador FORCE;
DROP TYPE Endereco FORCE;
DROP TYPE Emprestimo FORCE;
DROP TYPE Serie FORCE;
DROP TYPE Venda FORCE;
DROP TYPE Clube FORCE;
DROP TYPE Titulo FORCE;
DROP TYPE Table_Titulo FORCE;
DROP TYPE listaTelefone_array FORCE;
DROP TYPE listaEmail_array FORCE;
DROP TYPE Empresario FORCE;
DROP TYPE Atacante FORCE;
DROP TYPE Meio_Ofensivo FORCE;
DROP TYPE Volante FORCE;
DROP TYPE Goleiro FORCE;
DROP TYPE Lateral FORCE;
DROP TYPE Zagueiro FORCE;
DROP TYPE listaDeClubesDoJogador_array FORCE;

CREATE OR REPLACE TYPE listaTelefone_array AS VARRAY(100) OF VARCHAR2(40);
/
CREATE OR REPLACE TYPE listaEmail_array AS VARRAY(100) OF VARCHAR2(40);
/

CREATE OR REPLACE TYPE Endereco AS OBJECT(
    rua VARCHAR2(50),
    bairro VARCHAR2(50),
    complemento VARCHAR2(50),
    cep VARCHAR2(10),
    cidade VARCHAR2(50)
);
/

CREATE OR REPLACE TYPE Serie AS OBJECT(
    nome_completo VARCHAR2(40),
    apelido VARCHAR2(30),
    regulamento VARCHAR2(4000)
);
/

CREATE OR REPLACE TYPE Titulo AS OBJECT(
    serie REF Serie,
    nome VARCHAR2(30)
);
/

CREATE OR REPLACE TYPE Table_Titulo AS TABLE OF Titulo;
/

CREATE OR REPLACE TYPE Clube AS OBJECT(
    nome_completo VARCHAR2(40),
    nome_comum VARCHAR2(30),
    serie_atual REF Serie,
    data_fundacao DATE,
    titulos_por_serie Table_Titulo,
    nome_estadio VARCHAR2(50)
);
/

CREATE OR REPLACE TYPE Empresario AS OBJECT(
    nome_completo VARCHAR2(50),
    apelido VARCHAR(30),
    cpf_cnpj VARCHAR2(40),
    telefones listaTelefone_array,
    emails listaEmail_array
);
/

CREATE OR REPLACE TYPE Jogador AS OBJECT(
    nome_completo VARCHAR2(40),
    apelido VARCHAR2(30),
    situacao_medica VARCHAR2(20),
    clube_dono  REF Clube,
    clube_atual REF Clube,
    empresario_responsavel REF Empresario,
    valor NUMBER,
    status VARCHAR2(20),
    total_jogos INTEGER,
    gols_marcados INTEGER,
    faltas_cometidas INTEGER,
    faltas_sofridas INTEGER,
    cartoes_amarelo INTEGER,
    cartoes_vermelho INTEGER,
    data_nascimento DATE
       
) NOT FINAL;
/

CREATE OR REPLACE TYPE Venda AS OBJECT(
    clube_vendedor REF Clube,
    clube_comprador REF Clube,
    data DATE,
    valor_de_venda NUMBER,
    alteracao_valor_jogador NUMBER,
    jogador_vendido REF JOGADOR
);
/

CREATE OR REPLACE TYPE Emprestimo AS OBJECT(
    data DATE,
    jogador_emprestado REF JOGADOR
);
/

CREATE OR REPLACE TYPE Atacante under Jogador(
    num_finalizacao INTEGER
);
/

CREATE OR REPLACE TYPE Meio_Ofensivo UNDER Jogador(
    num_passes_feitos INTEGER,
    assistencias INTEGER
   
);
/

CREATE OR REPLACE TYPE Volante UNDER Jogador(
    num_desarmes INTEGER,
    passes_realizados INTEGER,
    passes_feitos INTEGER
);
/

CREATE OR REPLACE TYPE Lateral UNDER Jogador(
    num_desarmes INTEGER,
    cruzamentos_feitos INTEGER,
    cruzamentos_certos INTEGER
);
/

CREATE OR REPLACE TYPE Zagueiro UNDER Jogador(
    num_desarmes INTEGER
);
/

CREATE OR REPLACE TYPE Goleiro UNDER Jogador(
    num_defesas_dificeis INTEGER,
    gols_sofridos INTEGER
);
/

CREATE OR REPLACE TYPE listaDeClubesDoJogador_array AS VARRAY(100) OF Clube;
/

ALTER TYPE Jogador ADD ATTRIBUTE lista_clubes listaDeClubesDoJogador_array CASCADE;
/
