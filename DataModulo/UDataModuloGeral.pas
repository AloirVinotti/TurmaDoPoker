unit UDataModuloGeral;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDataModuleGeral = class(TDataModule)
    FDQueryJogadores: TFDQuery;
    FDQueryJogadoresCODIGO: TIntegerField;
    FDQueryJogadoresNOME: TStringField;
    DataSourceJogadores: TDataSource;
    FDQueryTorneios: TFDQuery;
    DataSourceTorneios: TDataSource;
    FDQueryTorneioJogadores: TFDQuery;
    DataSourceTorneioJogadores: TDataSource;
    FDQueryTorneiosCODIGO: TIntegerField;
    FDQueryTorneiosNOME: TStringField;
    FDQueryTorneiosBUY_IN_VALOR: TSingleField;
    FDQueryTorneiosBUY_IN_QUANTIDADE: TIntegerField;
    FDQueryTorneiosRE_BUY: TStringField;
    FDQueryTorneiosRE_BUY_VALOR: TSingleField;
    FDQueryTorneiosRE_BUY_QUANTIDADE: TIntegerField;
    FDQueryTorneiosRE_BUY_LIMITE_TIPO: TStringField;
    FDQueryTorneiosRE_BUY_LIMITE: TIntegerField;
    FDQueryTorneiosADD_ON: TStringField;
    FDQueryTorneiosADD_ON_VALOR: TSingleField;
    FDQueryTorneiosADD_ON_QUANTIDADE: TIntegerField;
    FDQueryTorneiosJOGADORES_QUANTIDADE: TIntegerField;
    FDQueryTorneiosPONTUACAO: TStringField;
    FDQueryTorneiosPONTUACAO_RETIRADA_JOGADOR: TSingleField;
    FDQueryTorneiosPONTUACAO_PRESENCA: TSingleField;
    FDQueryTorneiosPREMIACAO: TStringField;
    FDQueryTorneiosJOGADORES: TStringField;
    FDTableMesalidade: TFDTable;
    DataSourceMensalidade: TDataSource;
    FDTableMesalidadeTORNEIO: TIntegerField;
    FDTableMesalidadeJOGADOR: TIntegerField;
    FDTableMesalidadeNOME_JOGADOR: TStringField;
    FDTableMesalidadeJANEIRO: TSingleField;
    FDTableMesalidadeFEVEREIRO: TSingleField;
    FDTableMesalidadeMARCO: TSingleField;
    FDTableMesalidadeABRIL: TSingleField;
    FDTableMesalidadeMAIO: TSingleField;
    FDTableMesalidadeJUNHO: TSingleField;
    FDTableMesalidadeJULHO: TSingleField;
    FDTableMesalidadeAGOSTO: TSingleField;
    FDTableMesalidadeSETEMBRO: TSingleField;
    FDTableMesalidadeOUTUBRO: TSingleField;
    FDTableMesalidadeNOVEMBRO: TSingleField;
    FDTableMesalidadeDEZEMBRO: TSingleField;
    FDQueryTorneioJogadoresCODIGO_TORNEIO: TIntegerField;
    FDQueryTorneioJogadoresCODIGO_JOGADORE: TIntegerField;
    FDQueryTorneioJogadoresNOME: TStringField;
    FDQueryPontuacaoGeral: TFDQuery;
    DataSourcePontuacaoGeral: TDataSource;
    FDQueryPontosUltimoJogo: TFDQuery;
    DataSourcePontosUltimoJogo: TDataSource;
    FDQueryPremiacao: TFDQuery;
    DataSourcePremiacao: TDataSource;
    FDQueryPremiacaoTORNEIO: TIntegerField;
    FDQueryPremiacaoDATA_JOGO: TDateField;
    FDQueryPremiacaoCODIGO_JOGADOR: TIntegerField;
    FDQueryPremiacaoNOME_JOGADOR: TStringField;
    FDQueryPremiacaoPOSICAO: TIntegerField;
    FDQueryPremiacaoVALOR_PREMIO: TSingleField;
    FDTableCalendario: TFDTable;
    DataSourceCalendario: TDataSource;
    FDTableCalendarioTORNEIO: TIntegerField;
    FDTableCalendarioDATA_JOGO: TDateField;
    FDTableCalendarioLOCAL_JOGO: TStringField;
    FDQueryConfiguracoes: TFDQuery;
    IntegerField1: TIntegerField;
    DataSourceConfiguracoes: TDataSource;
    FDQueryConfiguracoesPASTA_SOM: TStringField;
    FDQueryTorneiosPONTUACAO_RETIRADA_DUPLA: TSingleField;
    FDQueryTorneiosPONTUACAO_RETIRADA_MULTIPLA: TSingleField;
    FDQueryPontosUltimoJogoNOME_JOGADOR: TStringField;
    FDQueryPontosUltimoJogoCOMPARECEU_PONTOS: TIntegerField;
    FDQueryPontosUltimoJogoPONTOS_ELIMINACAO: TIntegerField;
    FDQueryPontosUltimoJogoPONTOS_POSICAO: TSingleField;
    FDQueryPontosUltimoJogoPONTO_EXTRA: TIntegerField;
    FDQueryPontosUltimoJogoPONTUACAO_ANTERIOR: TIntegerField;
    FDQueryPontosUltimoJogoPONTUACAO_GERAL: TIntegerField;
    FDQueryPontosUltimoJogoCODIGO_JOGADOR: TIntegerField;
    FDQueryPontuacaoGeralTORNEIO: TIntegerField;
    FDQueryPontuacaoGeralCODIGO_JOGADOR: TIntegerField;
    FDQueryPontuacaoGeralDATA_JOGO: TDateField;
    FDQueryPontuacaoGeralPONTUACAO_GERAL: TIntegerField;
    FDQueryPontuacaoGeralPONTUACAO_ANTERIOR: TIntegerField;
    FDQueryPontuacaoGeralNOME_JOAGDOR: TStringField;
    FDQueryTorneiosPOSSUI_HORA_INICIO: TStringField;
    FDQueryTorneiosHORA_INICIO: TTimeField;
    FDQueryTorneiosCAMINHO_PASTA_SOM: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleGeral: TDataModuleGeral;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}
uses UMenuPrincipal;
end.
