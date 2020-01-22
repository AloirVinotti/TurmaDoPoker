object DataModuleGeral: TDataModuleGeral
  OldCreateOrder = False
  Height = 318
  Width = 776
  object FDQueryJogadores: TFDQuery
    Connection = FormMenuPrincipal.FDConnection
    Transaction = FormMenuPrincipal.FDTransaction
    SQL.Strings = (
      'Select * from JOGADORES where CODIGO > 0')
    Left = 38
    object FDQueryJogadoresCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryJogadoresNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 60
    end
  end
  object DataSourceJogadores: TDataSource
    DataSet = FDQueryJogadores
    Left = 38
    Top = 48
  end
  object FDQueryTorneios: TFDQuery
    Connection = FormMenuPrincipal.FDConnection
    Transaction = FormMenuPrincipal.FDTransaction
    SQL.Strings = (
      'Select * from TORNEIOS where CODIGO > 0')
    Left = 150
    object FDQueryTorneiosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryTorneiosNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 60
    end
    object FDQueryTorneiosBUY_IN_VALOR: TSingleField
      FieldName = 'BUY_IN_VALOR'
      Origin = 'BUY_IN_VALOR'
    end
    object FDQueryTorneiosBUY_IN_QUANTIDADE: TIntegerField
      FieldName = 'BUY_IN_QUANTIDADE'
      Origin = 'BUY_IN_QUANTIDADE'
    end
    object FDQueryTorneiosRE_BUY: TStringField
      FieldName = 'RE_BUY'
      Origin = 'RE_BUY'
      FixedChar = True
      Size = 1
    end
    object FDQueryTorneiosRE_BUY_VALOR: TSingleField
      FieldName = 'RE_BUY_VALOR'
      Origin = 'RE_BUY_VALOR'
    end
    object FDQueryTorneiosRE_BUY_QUANTIDADE: TIntegerField
      FieldName = 'RE_BUY_QUANTIDADE'
      Origin = 'RE_BUY_QUANTIDADE'
    end
    object FDQueryTorneiosRE_BUY_LIMITE_TIPO: TStringField
      FieldName = 'RE_BUY_LIMITE_TIPO'
      Origin = 'RE_BUY_LIMITE_TIPO'
      FixedChar = True
      Size = 1
    end
    object FDQueryTorneiosRE_BUY_LIMITE: TIntegerField
      FieldName = 'RE_BUY_LIMITE'
      Origin = 'RE_BUY_LIMITE'
    end
    object FDQueryTorneiosADD_ON: TStringField
      FieldName = 'ADD_ON'
      Origin = 'ADD_ON'
      FixedChar = True
      Size = 1
    end
    object FDQueryTorneiosADD_ON_VALOR: TSingleField
      FieldName = 'ADD_ON_VALOR'
      Origin = 'ADD_ON_VALOR'
    end
    object FDQueryTorneiosADD_ON_QUANTIDADE: TIntegerField
      FieldName = 'ADD_ON_QUANTIDADE'
      Origin = 'ADD_ON_QUANTIDADE'
    end
    object FDQueryTorneiosJOGADORES_QUANTIDADE: TIntegerField
      FieldName = 'JOGADORES_QUANTIDADE'
      Origin = 'JOGADORES_QUANTIDADE'
    end
    object FDQueryTorneiosPONTUACAO: TStringField
      FieldName = 'PONTUACAO'
      Origin = 'PONTUACAO'
      FixedChar = True
      Size = 1
    end
    object FDQueryTorneiosPONTUACAO_RETIRADA_JOGADOR: TSingleField
      FieldName = 'PONTUACAO_RETIRADA_JOGADOR'
      Origin = 'PONTUACAO_RETIRADA_JOGADOR'
    end
    object FDQueryTorneiosPONTUACAO_PRESENCA: TSingleField
      FieldName = 'PONTUACAO_PRESENCA'
      Origin = 'PONTUACAO_PRESENCA'
    end
    object FDQueryTorneiosPREMIACAO: TStringField
      FieldName = 'PREMIACAO'
      Origin = 'PREMIACAO'
      FixedChar = True
      Size = 1
    end
    object FDQueryTorneiosJOGADORES: TStringField
      FieldName = 'JOGADORES'
      Origin = 'JOGADORES'
      FixedChar = True
      Size = 1
    end
    object FDQueryTorneiosPONTUACAO_RETIRADA_DUPLA: TSingleField
      FieldName = 'PONTUACAO_RETIRADA_DUPLA'
      Origin = 'PONTUACAO_RETIRADA_DUPLA'
    end
    object FDQueryTorneiosPONTUACAO_RETIRADA_MULTIPLA: TSingleField
      FieldName = 'PONTUACAO_RETIRADA_MULTIPLA'
      Origin = 'PONTUACAO_RETIRADA_MULTIPLA'
    end
    object FDQueryTorneiosPOSSUI_HORA_INICIO: TStringField
      FieldName = 'POSSUI_HORA_INICIO'
      Origin = 'POSSUI_HORA_INICIO'
      FixedChar = True
      Size = 1
    end
    object FDQueryTorneiosHORA_INICIO: TTimeField
      FieldName = 'HORA_INICIO'
      Origin = 'HORA_INICIO'
    end
    object FDQueryTorneiosCAMINHO_PASTA_SOM: TStringField
      FieldName = 'CAMINHO_PASTA_SOM'
      Origin = 'CAMINHO_PASTA_SOM'
      Size = 500
    end
  end
  object DataSourceTorneios: TDataSource
    DataSet = FDQueryTorneios
    Left = 150
    Top = 48
  end
  object FDQueryTorneioJogadores: TFDQuery
    Connection = FormMenuPrincipal.FDConnection
    Transaction = FormMenuPrincipal.FDTransaction
    SQL.Strings = (
      'Select * from V_TORNEIOS_JOGADORES where CODIGO_TORNEIO > 0')
    Left = 275
    object FDQueryTorneioJogadoresCODIGO_TORNEIO: TIntegerField
      FieldName = 'CODIGO_TORNEIO'
      Origin = 'CODIGO_TORNEIO'
    end
    object FDQueryTorneioJogadoresCODIGO_JOGADORE: TIntegerField
      FieldName = 'CODIGO_JOGADORE'
      Origin = 'CODIGO_JOGADORE'
    end
    object FDQueryTorneioJogadoresNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 60
    end
  end
  object DataSourceTorneioJogadores: TDataSource
    DataSet = FDQueryTorneioJogadores
    Left = 275
    Top = 48
  end
  object FDTableMesalidade: TFDTable
    IndexFieldNames = 'TORNEIO;JOGADOR'
    Connection = FormMenuPrincipal.FDConnection
    Transaction = FormMenuPrincipal.FDTransaction
    UpdateOptions.UpdateTableName = 'V_MENSALIDADE'
    TableName = 'V_MENSALIDADE'
    Left = 48
    Top = 168
    object FDTableMesalidadeTORNEIO: TIntegerField
      FieldName = 'TORNEIO'
      Origin = 'TORNEIO'
    end
    object FDTableMesalidadeJOGADOR: TIntegerField
      FieldName = 'JOGADOR'
      Origin = 'JOGADOR'
    end
    object FDTableMesalidadeNOME_JOGADOR: TStringField
      FieldName = 'NOME_JOGADOR'
      Origin = 'NOME_JOGADOR'
      Size = 60
    end
    object FDTableMesalidadeJANEIRO: TSingleField
      FieldName = 'JANEIRO'
      Origin = 'JANEIRO'
      currency = True
    end
    object FDTableMesalidadeFEVEREIRO: TSingleField
      FieldName = 'FEVEREIRO'
      Origin = 'FEVEREIRO'
      currency = True
    end
    object FDTableMesalidadeMARCO: TSingleField
      FieldName = 'MARCO'
      Origin = 'MARCO'
      currency = True
    end
    object FDTableMesalidadeABRIL: TSingleField
      FieldName = 'ABRIL'
      Origin = 'ABRIL'
      currency = True
    end
    object FDTableMesalidadeMAIO: TSingleField
      FieldName = 'MAIO'
      Origin = 'MAIO'
      currency = True
    end
    object FDTableMesalidadeJUNHO: TSingleField
      FieldName = 'JUNHO'
      Origin = 'JUNHO'
      currency = True
    end
    object FDTableMesalidadeJULHO: TSingleField
      FieldName = 'JULHO'
      Origin = 'JULHO'
      currency = True
    end
    object FDTableMesalidadeAGOSTO: TSingleField
      FieldName = 'AGOSTO'
      Origin = 'AGOSTO'
      currency = True
    end
    object FDTableMesalidadeSETEMBRO: TSingleField
      FieldName = 'SETEMBRO'
      Origin = 'SETEMBRO'
      currency = True
    end
    object FDTableMesalidadeOUTUBRO: TSingleField
      FieldName = 'OUTUBRO'
      Origin = 'OUTUBRO'
      currency = True
    end
    object FDTableMesalidadeNOVEMBRO: TSingleField
      FieldName = 'NOVEMBRO'
      Origin = 'NOVEMBRO'
      currency = True
    end
    object FDTableMesalidadeDEZEMBRO: TSingleField
      FieldName = 'DEZEMBRO'
      Origin = 'DEZEMBRO'
      currency = True
    end
  end
  object DataSourceMensalidade: TDataSource
    DataSet = FDTableMesalidade
    Left = 48
    Top = 216
  end
  object FDQueryPontuacaoGeral: TFDQuery
    Connection = FormMenuPrincipal.FDConnection
    Transaction = FormMenuPrincipal.FDTransaction
    SQL.Strings = (
      'select * '
      'from V_PONTUACAO_GERAL'
      'where TORNEIO = :TORNEIO and DATA_JOGO = :DATA_JOGO'
      'ORDER BY PONTUACAO_GERAL DESC')
    Left = 547
    ParamData = <
      item
        Name = 'TORNEIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA_JOGO'
        DataType = ftDate
        ParamType = ptInput
      end>
    object FDQueryPontuacaoGeralTORNEIO: TIntegerField
      FieldName = 'TORNEIO'
      Origin = 'TORNEIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryPontuacaoGeralCODIGO_JOGADOR: TIntegerField
      FieldName = 'CODIGO_JOGADOR'
      Origin = 'CODIGO_JOGADOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryPontuacaoGeralDATA_JOGO: TDateField
      FieldName = 'DATA_JOGO'
      Origin = 'DATA_JOGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryPontuacaoGeralPONTUACAO_GERAL: TIntegerField
      FieldName = 'PONTUACAO_GERAL'
      Origin = 'PONTUACAO_GERAL'
    end
    object FDQueryPontuacaoGeralPONTUACAO_ANTERIOR: TIntegerField
      FieldName = 'PONTUACAO_ANTERIOR'
      Origin = 'PONTUACAO_ANTERIOR'
    end
    object FDQueryPontuacaoGeralNOME_JOAGDOR: TStringField
      FieldName = 'NOME_JOAGDOR'
      Origin = 'NOME_JOAGDOR'
      Size = 60
    end
  end
  object DataSourcePontuacaoGeral: TDataSource
    DataSet = FDQueryPontuacaoGeral
    Left = 547
    Top = 48
  end
  object FDQueryPontosUltimoJogo: TFDQuery
    Connection = FormMenuPrincipal.FDConnection
    Transaction = FormMenuPrincipal.FDTransaction
    SQL.Strings = (
      'select  V_JOGO_DIA.CODIGO_JOGADOR,'
      #9'V_JOGO_DIA.NOME_JOGADOR, V_JOGO_DIA.COMPARECEU_PONTOS,'
      #9'V_JOGO_DIA.PONTOS_ELIMINACAO, V_JOGO_DIA.PONTOS_POSICAO,'
      #9'V_JOGO_DIA.PONTO_EXTRA, PONTUACAO_GERAL.PONTUACAO_ANTERIOR,'
      #9'PONTUACAO_GERAL.PONTUACAO_GERAL'
      'from V_JOGO_DIA'
      
        'INNER JOIN PONTUACAO_GERAL ON PONTUACAO_GERAL.CODIGO_JOGADOR = V' +
        '_JOGO_DIA.CODIGO_JOGADOR'
      
        #9'AND PONTUACAO_GERAL.DATA_JOGO = V_JOGO_DIA.DATA_JOGO AND PONTUA' +
        'CAO_GERAL.TORNEIO = V_JOGO_DIA.TORNEIO'
      
        'where V_JOGO_DIA.TORNEIO = :TORNEIO AND V_JOGO_DIA.DATA_JOGO = :' +
        'DATA_JOGO'
      'ORDER BY V_JOGO_DIA.POSICAO DESC')
    Left = 419
    ParamData = <
      item
        Name = 'TORNEIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA_JOGO'
        DataType = ftDate
        ParamType = ptInput
      end>
    object FDQueryPontosUltimoJogoCODIGO_JOGADOR: TIntegerField
      FieldName = 'CODIGO_JOGADOR'
      Origin = 'CODIGO_JOGADOR'
    end
    object FDQueryPontosUltimoJogoNOME_JOGADOR: TStringField
      FieldName = 'NOME_JOGADOR'
      Origin = 'NOME_JOGADOR'
      Size = 60
    end
    object FDQueryPontosUltimoJogoCOMPARECEU_PONTOS: TIntegerField
      FieldName = 'COMPARECEU_PONTOS'
      Origin = 'COMPARECEU_PONTOS'
    end
    object FDQueryPontosUltimoJogoPONTOS_ELIMINACAO: TIntegerField
      FieldName = 'PONTOS_ELIMINACAO'
      Origin = 'PONTOS_ELIMINACAO'
    end
    object FDQueryPontosUltimoJogoPONTOS_POSICAO: TSingleField
      FieldName = 'PONTOS_POSICAO'
      Origin = 'PONTOS_POSICAO'
    end
    object FDQueryPontosUltimoJogoPONTO_EXTRA: TIntegerField
      FieldName = 'PONTO_EXTRA'
      Origin = 'PONTO_EXTRA'
    end
    object FDQueryPontosUltimoJogoPONTUACAO_ANTERIOR: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'PONTUACAO_ANTERIOR'
      Origin = 'PONTUACAO_ANTERIOR'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryPontosUltimoJogoPONTUACAO_GERAL: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'PONTUACAO_GERAL'
      Origin = 'PONTUACAO_GERAL'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object DataSourcePontosUltimoJogo: TDataSource
    DataSet = FDQueryPontosUltimoJogo
    Left = 419
    Top = 48
  end
  object FDQueryPremiacao: TFDQuery
    Connection = FormMenuPrincipal.FDConnection
    Transaction = FormMenuPrincipal.FDTransaction
    SQL.Strings = (
      'Select * from V_JOGO_PREMIACAO ')
    Left = 678
    object FDQueryPremiacaoTORNEIO: TIntegerField
      FieldName = 'TORNEIO'
      Origin = 'TORNEIO'
    end
    object FDQueryPremiacaoDATA_JOGO: TDateField
      FieldName = 'DATA_JOGO'
      Origin = 'DATA_JOGO'
    end
    object FDQueryPremiacaoCODIGO_JOGADOR: TIntegerField
      FieldName = 'CODIGO_JOGADOR'
      Origin = 'CODIGO_JOGADOR'
    end
    object FDQueryPremiacaoNOME_JOGADOR: TStringField
      FieldName = 'NOME_JOGADOR'
      Origin = 'NOME_JOGADOR'
      Size = 60
    end
    object FDQueryPremiacaoPOSICAO: TIntegerField
      FieldName = 'POSICAO'
      Origin = 'POSICAO'
    end
    object FDQueryPremiacaoVALOR_PREMIO: TSingleField
      FieldName = 'VALOR_PREMIO'
      Origin = 'VALOR_PREMIO'
      currency = True
    end
  end
  object DataSourcePremiacao: TDataSource
    DataSet = FDQueryPremiacao
    Left = 678
    Top = 48
  end
  object FDTableCalendario: TFDTable
    IndexFieldNames = 'TORNEIO;DATA_JOGO'
    Connection = FormMenuPrincipal.FDConnection
    Transaction = FormMenuPrincipal.FDTransaction
    UpdateOptions.UpdateTableName = 'CALENDARIO'
    TableName = 'CALENDARIO'
    Left = 152
    Top = 168
    object FDTableCalendarioTORNEIO: TIntegerField
      FieldName = 'TORNEIO'
      Origin = 'TORNEIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDTableCalendarioDATA_JOGO: TDateField
      FieldName = 'DATA_JOGO'
      Origin = 'DATA_JOGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDTableCalendarioLOCAL_JOGO: TStringField
      FieldName = 'LOCAL_JOGO'
      Origin = 'LOCAL_JOGO'
      Size = 300
    end
  end
  object DataSourceCalendario: TDataSource
    DataSet = FDTableCalendario
    Left = 152
    Top = 216
  end
  object FDQueryConfiguracoes: TFDQuery
    Connection = FormMenuPrincipal.FDConnection
    Transaction = FormMenuPrincipal.FDTransaction
    SQL.Strings = (
      'Select * from CONFIGURACOES where CODIGO > 0')
    Left = 302
    Top = 176
    object IntegerField1: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryConfiguracoesPASTA_SOM: TStringField
      FieldName = 'PASTA_SOM'
      Origin = 'PASTA_SOM'
      Size = 500
    end
  end
  object DataSourceConfiguracoes: TDataSource
    DataSet = FDQueryConfiguracoes
    Left = 302
    Top = 224
  end
end
