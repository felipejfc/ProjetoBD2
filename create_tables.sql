DROP TABLE empresarios FORCE;
DROP TABLE clubes FORCE;
DROP TABLE vendas FORCE;
DROP TABLE series FORCE;
DROP TABLE goleiros FORCE;
DROP TABLE zagueiros FORCE;
DROP TABLE laterais FORCE;
DROP TABLE volantes FORCE;
DROP TABLE meio_Ofensivos FORCE;
DROP TABLE atacantes FORCE;
DROP TABLE emprestimos FORCE;
DROP TABLE titulos_por_serie_nt FORCE;
DROP TABLE lista_clubes_goleiro_nt FORCE;
DROP TABLE titulos_por_serie_goleiro_nt FORCE;
DROP TABLE lista_clubes_zagueiro_nt FORCE;
DROP TABLE titulos_por_serie_zagueiro_nt FORCE;
DROP TABLE lista_clubes_lateral_nt FORCE;
DROP TABLE titulos_por_serie_lateral_nt FORCE;
DROP TABLE lista_clubes_volante_nt FORCE;
DROP TABLE titulos_por_serie_volante_nt FORCE;
DROP TABLE lista_clubes_meia_ofensivo_nt FORCE;
DROP TABLE titulos_por_serie_meia_ofensivo_nt FORCE;
DROP TABLE lista_clubes_atacante_nt FORCE;
DROP TABLE titulos_por_serie_atacante_nt FORCE;

CREATE TABLE empresarios OF Empresario(
    CONSTRAINT cpf_cnpj_pk PRIMARY KEY(cpf_cnpj),
    CONSTRAINT nome_completo_empresario_cons CHECK(nome_completo is NOT NULL),
    CONSTRAINT telefones_cons CHECK(telefones is NOT NULL),
    CONSTRAINT emails_cons CHECK(emails is NOT NULL)
);

CREATE TABLE clubes OF Clube(
    CONSTRAINT nome_completo_cons_clube CHECK(nome_completo is NOT NULL),
    CONSTRAINT nome_comum_cons_clube CHECK(nome_comum is NOT NULL),
    CONSTRAINT serie_atual_cons CHECK(serie_atual is NOT NULL),
    CONSTRAINT data_fundacao_cons CHECK(data_fundacao is NOT NULL),
    CONSTRAINT nome_estadio_cons CHECK(nome_estadio is NOT NULL)
)NESTED TABLE titulos_por_serie STORE AS titulos_por_serie_nt;

CREATE TABLE vendas OF Venda(
    CONSTRAINT clube_vendedor_cons CHECK(clube_vendedor is NOT NULL),
    CONSTRAINT clube_comprador_cons CHECK(clube_comprador IS NOT NULL),
    CONSTRAINT data_cons CHECK(data is NOT NULL),
    CONSTRAINT valor_de_venda_cons CHECK(valor_de_venda > 0),
    CONSTRAINT jogador_vendido_cons CHECK(jogador_vendido is NOT NULL),
    CONSTRAINT alteracao_valor_jogador_cons CHECK(alteracao_valor_jogador > 0)
);

CREATE TABLE series OF Serie(
    CONSTRAINT nome_completo_serie_cons CHECK(nome_completo is NOT NULL),
    CONSTRAINT apelido_serie_cons CHECK(apelido is NOT NULL),
    CONSTRAINT regulamento_cons CHECK(regulamento is NOT NULL)
);

CREATE TABLE emprestimos OF Emprestimo(
    CONSTRAINT data_emprestimo_cons CHECK(data is NOT NULL),
    CONSTRAINT jogador_emprestado_cons CHECK(jogador_emprestado is NOT NULL)
);

CREATE TABLE goleiros OF Goleiro(
    CONSTRAINT nome_completo_jogador_cons CHECK(nome_completo is NOT NULL),
    CONSTRAINT apelido_jog_cons CHECK(apelido is NOT NULL),
    CONSTRAINT situacao_medica_cons CHECK(situacao_medica is NOT NULL),
    CONSTRAINT tipo_situacao_medica CHECK (UPPER(situacao_medica) IN ('CONTUNDIDO', 'VOLTANDO-CONTUSAO',   'SAUDAVEL')),
    CONSTRAINT clube_dono_cons CHECK(clube_dono is NOT NULL),
    CONSTRAINT clube_atual_cons CHECK(clube_atual is NOT NULL),
    CONSTRAINT empresario_resp_cons CHECK(empresario_responsavel is NOT NULL),
    CONSTRAINT valor_cons CHECK(valor > 0),
    CONSTRAINT status_cons CHECK(status is NOT NULL),
    CONSTRAINT tipo_status CHECK (UPPER(status) IN ('A-VENDA', 'LIBERADO',   'COM-CONTRATO')),
    CONSTRAINT total_jogos_cons CHECK(total_jogos > 0),
    CONSTRAINT gols_marcados_cons CHECK(gols_marcados is NOT NULL),
    CONSTRAINT faltas_cometidas_cons CHECK(faltas_cometidas > 0),
    CONSTRAINT faltas_sofridas_cons CHECK(faltas_sofridas > 0),
    CONSTRAINT cartoes_amarelo_cons CHECK(cartoes_amarelo > 0),
    CONSTRAINT cartoes_vermelho_cons CHECK(cartoes_vermelho > 0),
    CONSTRAINT data_nascimento_cons CHECK(data_nascimento IS NOT NULL),
    CONSTRAINT num_defesas_cons CHECK(num_defesas_dificeis > 0),
    CONSTRAINT gols_sofridos_cons CHECK(gols_sofridos > 0)
)NESTED TABLE lista_clubes STORE AS lista_clubes_goleiro_nt
(NESTED TABLE titulos_por_serie STORE AS titulos_por_serie_goleiro_nt);

CREATE TABLE zagueiros OF Zagueiro(
    CONSTRAINT nome_completo_jogador_cons CHECK(nome_completo is NOT NULL),
    CONSTRAINT apelido_jog_cons CHECK(apelido is NOT NULL),
    CONSTRAINT situacao_medica_cons CHECK(situacao_medica is NOT NULL),
    CONSTRAINT tipo_situacao_medica CHECK (UPPER(situacao_medica) IN ('CONTUNDIDO', 'VOLTANDO-CONTUSAO',   'SAUDAVEL')),
    CONSTRAINT clube_dono_cons CHECK(clube_dono is NOT NULL),
    CONSTRAINT clube_atual_cons CHECK(clube_atual is NOT NULL),
    CONSTRAINT empresario_resp_cons CHECK(empresario_responsavel is NOT NULL),
    CONSTRAINT valor_cons CHECK(valor > 0),
    CONSTRAINT status_cons CHECK(status is NOT NULL),
    CONSTRAINT tipo_status CHECK (UPPER(status) IN ('A-VENDA', 'LIBERADO',   'COM-CONTRATO')),
    CONSTRAINT total_jogos_cons CHECK(total_jogos > 0),
    CONSTRAINT gols_marcados_cons CHECK(gols_marcados is NOT NULL),
    CONSTRAINT faltas_cometidas_cons CHECK(faltas_cometidas > 0),
    CONSTRAINT faltas_sofridas_cons CHECK(faltas_sofridas > 0),
    CONSTRAINT cartoes_amarelo_cons CHECK(cartoes_amarelo > 0),
    CONSTRAINT cartoes_vermelho_cons CHECK(cartoes_vermelho > 0),
    CONSTRAINT data_nascimento_cons CHECK(data_nascimento IS NOT NULL),
    CONSTRAINT num_desarmes_zagueiro_cons CHECK(num_desarmes > 0)
)NESTED TABLE lista_clubes STORE AS lista_clubes_zagueiro_nt
(NESTED TABLE titulos_por_serie STORE AS titulos_por_serie_zagueiro_nt);

CREATE TABLE laterais OF Lateral(
    CONSTRAINT nome_completo_jogador_cons CHECK(nome_completo is NOT NULL),
    CONSTRAINT apelido_jog_cons CHECK(apelido is NOT NULL),
    CONSTRAINT situacao_medica_cons CHECK(situacao_medica is NOT NULL),
    CONSTRAINT tipo_situacao_medica CHECK (UPPER(situacao_medica) IN ('CONTUNDIDO', 'VOLTANDO-CONTUSAO',   'SAUDAVEL')),
    CONSTRAINT clube_dono_cons CHECK(clube_dono is NOT NULL),
    CONSTRAINT clube_atual_cons CHECK(clube_atual is NOT NULL),
    CONSTRAINT empresario_resp_cons CHECK(empresario_responsavel is NOT NULL),
    CONSTRAINT valor_cons CHECK(valor > 0),
    CONSTRAINT status_cons CHECK(status is NOT NULL),
    CONSTRAINT tipo_status CHECK (UPPER(status) IN ('A-VENDA', 'LIBERADO',   'COM-CONTRATO')),
    CONSTRAINT total_jogos_cons CHECK(total_jogos > 0),
    CONSTRAINT gols_marcados_cons CHECK(gols_marcados is NOT NULL),
    CONSTRAINT faltas_cometidas_cons CHECK(faltas_cometidas > 0),
    CONSTRAINT faltas_sofridas_cons CHECK(faltas_sofridas > 0),
    CONSTRAINT cartoes_amarelo_cons CHECK(cartoes_amarelo > 0),
    CONSTRAINT cartoes_vermelho_cons CHECK(cartoes_vermelho > 0),
    CONSTRAINT data_nascimento_cons CHECK(data_nascimento IS NOT NULL),
    CONSTRAINT num_desarmes_lateral_cons CHECK(num_desarmes > 0),
    CONSTRAINT cruzamentos_feitos_cons CHECK(cruzamentos_feitos > 0),
    CONSTRAINT cruzamentos_certos_cons CHECK(cruzamentos_certos <= cruzamentos_feitos)
)NESTED TABLE lista_clubes STORE AS lista_clubes_lateral_nt
(NESTED TABLE titulos_por_serie STORE AS titulos_por_serie_lateral_nt);

CREATE TABLE volantes OF Volante(
    CONSTRAINT nome_completo_jogador_cons CHECK(nome_completo is NOT NULL),
    CONSTRAINT apelido_jog_cons CHECK(apelido is NOT NULL),
    CONSTRAINT situacao_medica_cons CHECK(situacao_medica is NOT NULL),
    CONSTRAINT tipo_situacao_medica CHECK (UPPER(situacao_medica) IN ('CONTUNDIDO', 'VOLTANDO-CONTUSAO',   'SAUDAVEL')),
    CONSTRAINT clube_dono_cons CHECK(clube_dono is NOT NULL),
    CONSTRAINT clube_atual_cons CHECK(clube_atual is NOT NULL),
    CONSTRAINT empresario_resp_cons CHECK(empresario_responsavel is NOT NULL),
    CONSTRAINT valor_cons CHECK(valor > 0),
    CONSTRAINT status_cons CHECK(status is NOT NULL),
    CONSTRAINT tipo_status CHECK (UPPER(status) IN ('A-VENDA', 'LIBERADO',   'COM-CONTRATO')),
    CONSTRAINT total_jogos_cons CHECK(total_jogos > 0),
    CONSTRAINT gols_marcados_cons CHECK(gols_marcados is NOT NULL),
    CONSTRAINT faltas_cometidas_cons CHECK(faltas_cometidas > 0),
    CONSTRAINT faltas_sofridas_cons CHECK(faltas_sofridas > 0),
    CONSTRAINT cartoes_amarelo_cons CHECK(cartoes_amarelo > 0),
    CONSTRAINT cartoes_vermelho_cons CHECK(cartoes_vermelho > 0),
    CONSTRAINT data_nascimento_cons CHECK(data_nascimento IS NOT NULL),
    CONSTRAINT num_desarmes_volante_cons CHECK(num_desarmes > 0),
    CONSTRAINT passes_realizados_cons CHECK(passes_realizados > 0),
    CONSTRAINT passes_feitos_cons CHECK(passes_feitos <= passes_realizados)
)NESTED TABLE lista_clubes STORE AS lista_clubes_volante_nt
(NESTED TABLE titulos_por_serie STORE AS titulos_por_serie_volante_nt);

CREATE TABLE meio_ofensivos OF Meio_Ofensivo(
    CONSTRAINT nome_completo_jogador_cons CHECK(nome_completo is NOT NULL),
    CONSTRAINT apelido_jog_cons CHECK(apelido is NOT NULL),
    CONSTRAINT situacao_medica_cons CHECK(situacao_medica is NOT NULL),
    CONSTRAINT tipo_situacao_medica CHECK (UPPER(situacao_medica) IN ('CONTUNDIDO', 'VOLTANDO-CONTUSAO',   'SAUDAVEL')),
    CONSTRAINT clube_dono_cons CHECK(clube_dono is NOT NULL),
    CONSTRAINT clube_atual_cons CHECK(clube_atual is NOT NULL),
    CONSTRAINT empresario_resp_cons CHECK(empresario_responsavel is NOT NULL),
    CONSTRAINT valor_cons CHECK(valor > 0),
    CONSTRAINT status_cons CHECK(status is NOT NULL),
    CONSTRAINT tipo_status CHECK (UPPER(status) IN ('A-VENDA', 'LIBERADO',   'COM-CONTRATO')),
    CONSTRAINT total_jogos_cons CHECK(total_jogos > 0),
    CONSTRAINT gols_marcados_cons CHECK(gols_marcados is NOT NULL),
    CONSTRAINT faltas_cometidas_cons CHECK(faltas_cometidas > 0),
    CONSTRAINT faltas_sofridas_cons CHECK(faltas_sofridas > 0),
    CONSTRAINT cartoes_amarelo_cons CHECK(cartoes_amarelo > 0),
    CONSTRAINT cartoes_vermelho_cons CHECK(cartoes_vermelho > 0),
    CONSTRAINT data_nascimento_cons CHECK(data_nascimento IS NOT NULL),
    CONSTRAINT num_passes_cons CHECK(num_passes_feitos > 0),
    CONSTRAINT assistencias_cons CHECK(assistencias <= num_passes_feitos)
)NESTED TABLE lista_clubes STORE AS lista_clubes_meia_ofensivo_nt
(NESTED TABLE titulos_por_serie STORE AS titulos_por_serie_meia_ofensivo_nt);

CREATE TABLE atacantes OF Atacante(
    CONSTRAINT nome_completo_jogador_cons CHECK(nome_completo is NOT NULL),
    CONSTRAINT apelido_jog_cons CHECK(apelido is NOT NULL),
    CONSTRAINT situacao_medica_cons CHECK(situacao_medica is NOT NULL),
    CONSTRAINT tipo_situacao_medica CHECK (UPPER(situacao_medica) IN ('CONTUNDIDO', 'VOLTANDO-CONTUSAO',   'SAUDAVEL')),
    CONSTRAINT clube_dono_cons CHECK(clube_dono is NOT NULL),
    CONSTRAINT clube_atual_cons CHECK(clube_atual is NOT NULL),
    CONSTRAINT empresario_resp_cons CHECK(empresario_responsavel is NOT NULL),
    CONSTRAINT valor_cons CHECK(valor > 0),
    CONSTRAINT status_cons CHECK(status is NOT NULL),
    CONSTRAINT tipo_status CHECK (UPPER(status) IN ('A-VENDA', 'LIBERADO',   'COM-CONTRATO')),
    CONSTRAINT total_jogos_cons CHECK(total_jogos > 0),
    CONSTRAINT gols_marcados_cons CHECK(gols_marcados is NOT NULL),
    CONSTRAINT faltas_cometidas_cons CHECK(faltas_cometidas > 0),
    CONSTRAINT faltas_sofridas_cons CHECK(faltas_sofridas > 0),
    CONSTRAINT cartoes_amarelo_cons CHECK(cartoes_amarelo > 0),
    CONSTRAINT cartoes_vermelho_cons CHECK(cartoes_vermelho > 0),
    CONSTRAINT data_nascimento_cons CHECK(data_nascimento IS NOT NULL),
    CONSTRAINT num_finalizacao_cons CHECK(num_finalizacao > gols_marcados)
)NESTED TABLE lista_clubes STORE AS lista_clubes_atacante_nt
(NESTED TABLE titulos_por_serie STORE AS titulos_por_serie_atacante_nt);
