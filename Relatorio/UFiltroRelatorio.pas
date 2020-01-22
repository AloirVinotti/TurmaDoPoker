unit UFiltroRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TFormRelatorios = class(TForm)
    PageControlGeralRelatorios: TPageControl;
    TabSheetListagemTorneios: TTabSheet;
    Panel1: TPanel;
    SpeedButtonEditar: TSpeedButton;
    SpeedButtonSair: TSpeedButton;
    DBGridListagemTorneio: TDBGrid;
    TabSheetRelatorios: TTabSheet;
    Panel2: TPanel;
    SpeedButtonRelatorio: TSpeedButton;
    SpeedButtonCancelar: TSpeedButton;
    Panel3: TPanel;
    Label1: TLabel;
    SpeedButtonPesquisar: TSpeedButton;
    DateTimePickerJogo: TDateTimePicker;
    procedure SpeedButtonCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridListagemTorneioCellClick(Column: TColumn);
    procedure SpeedButtonEditarClick(Sender: TObject);
    procedure SpeedButtonRelatorioClick(Sender: TObject);
    procedure SpeedButtonSairClick(Sender: TObject);
  private
    { Private declarations }
    CodigoTorneio: Integer;
  public
    { Public declarations }
  end;

var
  FormRelatorios: TFormRelatorios;

implementation

{$R *.dfm}

uses UdataModuloGeral, URelatorioMensalidade, URelatorioPremiacao, UMenuPrincipal,
     URelatorioPontuacaoGeral, URelatorioPontuacaoDia, URelatorioCalendario, UUtil;

procedure TFormRelatorios.DBGridListagemTorneioCellClick(Column: TColumn);
begin
  CodigoTorneio:= DBGridListagemTorneio.Fields[0].AsInteger;
end;

procedure TFormRelatorios.FormShow(Sender: TObject);
begin
  PageControlGeralRelatorios.TabIndex:= 0;
  CodigoTorneio:= -1;
  DateTimePickerJogo.Date:= Date;
end;

procedure TFormRelatorios.SpeedButtonCancelarClick(Sender: TObject);
begin
  PageControlGeralRelatorios.TabIndex:= 0;
end;

procedure TFormRelatorios.SpeedButtonEditarClick(Sender: TObject);
begin
  if (CodigoTorneio <> -1) then
  begin
    PageControlGeralRelatorios.TabIndex:= 1;
  end
  else
  begin
    ShowMessage('Você deve selecionar um torneio para editar!');
  end;
end;

procedure TFormRelatorios.SpeedButtonRelatorioClick(Sender: TObject);
begin
  //with TFormRelatorioMensalidade.Create(Self) do
  with TFormRelatorioJogoDia.Create(Self) do
  try
    {
    DataModuleGeral.FDTableMesalidade.Close;
    DataModuleGeral.FDTableMesalidade.Filter:= '';
    DataModuleGeral.FDTableMesalidade.Filter:= 'TORNEIO = ' + QuotedStr(IntToStr(CodigoTorneio));
    DataModuleGeral.FDTableMesalidade.Filtered:= True;
    DataModuleGeral.FDTableMesalidade.Open;}

    DataModuleGeral.FDQueryPontosUltimoJogo.Close;
    DataModuleGeral.FDQueryPontosUltimoJogo.SQL.Clear;
    DataModuleGeral.FDQueryPontosUltimoJogo.SQL.Add('select V_JOGO_DIA.CODIGO_JOGADOR,');
    DataModuleGeral.FDQueryPontosUltimoJogo.SQL.Add('	V_JOGO_DIA.NOME_JOGADOR, V_JOGO_DIA.COMPARECEU_PONTOS,');
    DataModuleGeral.FDQueryPontosUltimoJogo.SQL.Add('	V_JOGO_DIA.PONTOS_ELIMINACAO, V_JOGO_DIA.PONTOS_POSICAO,');
    DataModuleGeral.FDQueryPontosUltimoJogo.SQL.Add('	V_JOGO_DIA.PONTO_EXTRA, PONTUACAO_GERAL.PONTUACAO_ANTERIOR,');
    DataModuleGeral.FDQueryPontosUltimoJogo.SQL.Add('	PONTUACAO_GERAL.PONTUACAO_GERAL');
    DataModuleGeral.FDQueryPontosUltimoJogo.SQL.Add('from V_JOGO_DIA');
    DataModuleGeral.FDQueryPontosUltimoJogo.SQL.Add('INNER JOIN PONTUACAO_GERAL ON PONTUACAO_GERAL.CODIGO_JOGADOR = V_JOGO_DIA.CODIGO_JOGADOR');
    DataModuleGeral.FDQueryPontosUltimoJogo.SQL.Add('	AND PONTUACAO_GERAL.DATA_JOGO = V_JOGO_DIA.DATA_JOGO AND PONTUACAO_GERAL.TORNEIO = V_JOGO_DIA.TORNEIO');
    DataModuleGeral.FDQueryPontosUltimoJogo.SQL.Add('where V_JOGO_DIA.TORNEIO = :TORNEIO AND V_JOGO_DIA.DATA_JOGO = :DATA_JOGO');
    DataModuleGeral.FDQueryPontosUltimoJogo.SQL.Add('ORDER BY V_JOGO_DIA.PONTOS_POSICAO DESC,');
    DataModuleGeral.FDQueryPontosUltimoJogo.SQL.Add('	V_JOGO_DIA.PONTO_EXTRA DESC, V_JOGO_DIA.PONTOS_ELIMINACAO DESC, V_JOGO_DIA.COMPARECEU_PONTOS DESC');
    DataModuleGeral.FDQueryPontosUltimoJogo.ParamByName('TORNEIO').AsInteger:= CodigoTorneio;
    DataModuleGeral.FDQueryPontosUltimoJogo.ParamByName('DATA_JOGO').AsDate:= DateTimePickerJogo.Date;
    DataModuleGeral.FDQueryPontosUltimoJogo.Open;
    DataModuleGeral.FDQueryPontosUltimoJogo.First;

{    DataModuleGeral.FDQueryPremiacao.Close;
    DataModuleGeral.FDQueryPremiacao.SQL.Clear;
    DataModuleGeral.FDQueryPremiacao.SQL.Add('Select * from V_JOGO_PREMIACAO');
    DataModuleGeral.FDQueryPremiacao.SQL.Add('where TORNEIO = :TORNEIO');
    DataModuleGeral.FDQueryPremiacao.SQL.Add('order by CODIGO_JOGADOR, DATA_JOGO');
    DataModuleGeral.FDQueryPremiacao.ParamByName('TORNEIO').AsInteger:= CodigoTorneio;
    DataModuleGeral.FDQueryPremiacao.Open;}

    DataModuleGeral.FDQueryPontuacaoGeral.Close;
    DataModuleGeral.FDQueryPontuacaoGeral.SQL.Clear;
    DataModuleGeral.FDQueryPontuacaoGeral.SQL.Add('select *');
    DataModuleGeral.FDQueryPontuacaoGeral.SQL.Add('from V_PONTUACAO_GERAL');
    DataModuleGeral.FDQueryPontuacaoGeral.SQL.Add('where TORNEIO = :TORNEIO and DATA_JOGO = :DATA_JOGO');
    DataModuleGeral.FDQueryPontuacaoGeral.SQL.Add('ORDER BY PONTUACAO_GERAL DESC');
    DataModuleGeral.FDQueryPontuacaoGeral.ParamByName('TORNEIO').AsInteger:= CodigoTorneio;
    DataModuleGeral.FDQueryPontuacaoGeral.ParamByName('DATA_JOGO').AsDate:= DateTimePickerJogo.Date;
    DataModuleGeral.FDQueryPontuacaoGeral.Open;
    DataModuleGeral.FDQueryPontuacaoGeral.First;

{    DataModuleGeral.FDTableCalendario.Close;
    DataModuleGeral.FDTableCalendario.Filter:= '';
    DataModuleGeral.FDTableCalendario.Filter:= 'TORNEIO = ' + QuotedStr(IntToStr(CodigoTorneio));
    DataModuleGeral.FDTableCalendario.Filtered:= True;
    DataModuleGeral.FDTableCalendario.Open;}

    if (DataModuleGeral.FDQueryPontosUltimoJogo.RecordCount > 0) then
    begin
      RLReportPontuacaoDia.Preview;
    end
    else
    begin
      ShowMessage('Não foram encontrados dados!');
    end;
  finally
    free;
  end;

{  with TFormRelatorioJogoDia.Create(Self) do
  try
    DataModuleGeral.FDQueryPontosUltimoJogo.Close;
    DataModuleGeral.FDQueryPontosUltimoJogo.SQL.Clear;
    DataModuleGeral.FDQueryPontosUltimoJogo.SQL.Add('select TORNEIO, CODIGO_JOGADOR, NOME_JOGADOR, COMPARECEU_PONTOS, PONTOS_ELIMINACAO,');
    DataModuleGeral.FDQueryPontosUltimoJogo.SQL.Add(' PONTOS_POSICAO, DATA_JOGO from V_JOGO_DIA');
    DataModuleGeral.FDQueryPontosUltimoJogo.SQL.Add('where TORNEIO = :TORNEIO and DATA_JOGO = :DATA_JOGO');
    DataModuleGeral.FDQueryPontosUltimoJogo.ParamByName('TORNEIO').AsInteger:= CodigoTorneio;
    DataModuleGeral.FDQueryPontosUltimoJogo.ParamByName('DATA_JOGO').AsDate:= DateTimePickerJogo.Date;
    DataModuleGeral.FDQueryPontosUltimoJogo.Open;
    DataModuleGeral.FDQueryPontosUltimoJogo.First;
    if (DataModuleGeral.FDQueryPontosUltimoJogo.RecordCount > 0) then
    begin
//      DataPesquisa:= DateTimePickerJogo.Date;
      RLReportPontuacaoDia.Preview;
    end;
  finally
    Free;
  end;

  with TFormRelatorioPremiacao.Create(Self) do
  try
    DataModuleGeral.FDQueryPremiacao.Close;
    DataModuleGeral.FDQueryPremiacao.SQL.Clear;
    DataModuleGeral.FDQueryPremiacao.SQL.Add('Select * from V_JOGO_PREMIACAO');
    DataModuleGeral.FDQueryPremiacao.SQL.Add('where TORNEIO = :TORNEIO');
    DataModuleGeral.FDQueryPremiacao.SQL.Add('order by CODIGO_JOGADOR, DATA_JOGO');
    DataModuleGeral.FDQueryPremiacao.ParamByName('TORNEIO').AsInteger:= CodigoTorneio;
    DataModuleGeral.FDQueryPremiacao.Open;
    if DataModuleGeral.FDQueryPremiacao.RecordCount > 0 then
    begin
      RLReportPremiacao.Preview;
    end;
  finally
    free;
  end;

  with TFormRelatorioPontuacaoGeral.Create(Self) do
  try
    DataModuleGeral.FDQueryPontuacaoGeral.Close;
    DataModuleGeral.FDQueryPontuacaoGeral.ParamByName('TORNEIO').AsInteger:= CodigoTorneio;
    DataModuleGeral.FDQueryPontuacaoGeral.ParamByName('DATA_JOGO').AsDate:= Date;
    DataModuleGeral.FDQueryPontuacaoGeral.Open;
    DataModuleGeral.FDQueryPontuacaoGeral.First;
    if DataModuleGeral.FDQueryPontuacaoGeral.RecordCount > 0 then
    begin
      RLReportPontuacaGeral.Preview;
    end;
  finally
    free;
  end;}

end;

procedure TFormRelatorios.SpeedButtonSairClick(Sender: TObject);
begin
  Close;
end;

end.
