object FormRelatorioJogoDia: TFormRelatorioJogoDia
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio Jogo Dia'
  ClientHeight = 511
  ClientWidth = 777
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RLReportPontuacaoDia: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = DataModuleGeral.DataSourcePontosUltimoJogo
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    NextReport = FormRelatorioPontuacaoGeral.RLReportPontuacaGeral
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 19
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel1: TRLLabel
        AlignWithMargins = True
        Left = 0
        Top = 0
        Width = 647
        Height = 18
        Align = faLeft
        Alignment = taCenter
        Caption = 'JOGO DIA'
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 57
      Width = 718
      Height = 16
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object RLLabel2: TRLLabel
        Left = 0
        Top = 0
        Width = 107
        Height = 15
        Align = faLeft
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = False
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel3: TRLLabel
        Left = 107
        Top = 0
        Width = 76
        Height = 15
        Align = faLeft
        Alignment = taCenter
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = False
        Caption = 'Presen'#231'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 183
        Top = 0
        Width = 76
        Height = 15
        Align = faLeft
        Alignment = taCenter
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = False
        Caption = 'Retirada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 259
        Top = 0
        Width = 76
        Height = 15
        Align = faLeft
        Alignment = taCenter
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = False
        Caption = 'Coloca'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 411
        Top = 0
        Width = 108
        Height = 15
        Align = faLeft
        Alignment = taCenter
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = False
        Caption = 'Pontua'#231#227'o  Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel7: TRLLabel
        Left = 519
        Top = 0
        Width = 108
        Height = 15
        Align = faLeft
        Alignment = taCenter
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = False
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel8: TRLLabel
        Left = 335
        Top = 0
        Width = 76
        Height = 15
        Align = faLeft
        Alignment = taCenter
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = False
        Caption = 'Ponto Extra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 73
      Width = 718
      Height = 24
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      DataFields = 'CODIGO_JOGADOR'
      object RLBand3: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 16
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = False
        object RLDBTextValor1: TRLDBText
          Left = 0
          Top = 0
          Width = 107
          Height = 16
          Align = faLeft
          AutoSize = False
          Borders.Sides = sdCustom
          Borders.DrawLeft = True
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = False
          DataField = 'NOME_JOGADOR'
          DataSource = DataModuleGeral.DataSourcePontosUltimoJogo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBTextValor2: TRLDBText
          Left = 107
          Top = 0
          Width = 76
          Height = 16
          Align = faLeft
          Alignment = taCenter
          AutoSize = False
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = False
          DataField = 'COMPARECEU_PONTOS'
          DataSource = DataModuleGeral.DataSourcePontosUltimoJogo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText1: TRLDBText
          Left = 183
          Top = 0
          Width = 76
          Height = 16
          Align = faLeft
          Alignment = taCenter
          AutoSize = False
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = False
          DataField = 'PONTOS_ELIMINACAO'
          DataSource = DataModuleGeral.DataSourcePontosUltimoJogo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText2: TRLDBText
          Left = 259
          Top = 0
          Width = 76
          Height = 16
          Align = faLeft
          Alignment = taCenter
          AutoSize = False
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = False
          DataField = 'PONTOS_POSICAO'
          DataSource = DataModuleGeral.DataSourcePontosUltimoJogo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 335
          Top = 0
          Width = 76
          Height = 16
          Align = faLeft
          Alignment = taCenter
          AutoSize = False
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = False
          DataField = 'PONTO_EXTRA'
          DataSource = DataModuleGeral.DataSourcePontosUltimoJogo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 411
          Top = 0
          Width = 108
          Height = 16
          Align = faLeft
          Alignment = taCenter
          AutoSize = False
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = False
          DataField = 'PONTUACAO_ANTERIOR'
          DataSource = DataModuleGeral.DataSourcePontosUltimoJogo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText5: TRLDBText
          Left = 519
          Top = 0
          Width = 108
          Height = 16
          Align = faLeft
          Alignment = taCenter
          AutoSize = False
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = False
          DataField = 'PONTUACAO_GERAL'
          DataSource = DataModuleGeral.DataSourcePontosUltimoJogo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
      end
    end
  end
  object FDQuery1: TFDQuery
    Left = 560
    Top = 232
  end
end
