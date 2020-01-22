unit UPontosDia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, DateUtils;

type
  TFormPontosDia = class(TForm)
    PageControlGeralPontuacao: TPageControl;
    TabSheetListagemTorneios: TTabSheet;
    Panel1: TPanel;
    SpeedButtonEditar: TSpeedButton;
    SpeedButtonSair: TSpeedButton;
    DBGridListagemTorneio: TDBGrid;
    TabSheetPontuacaoDia: TTabSheet;
    Panel2: TPanel;
    SpeedButtonCancelar: TSpeedButton;
    StringGridPontuacaoDia: TStringGrid;
    Panel3: TPanel;
    Label1: TLabel;
    DateTimePickerDataUltimoJogo: TDateTimePicker;
    SpeedButtonPesquisar: TSpeedButton;
    procedure DBGridListagemTorneioCellClick(Column: TColumn);
    procedure SpeedButtonEditarClick(Sender: TObject);
    procedure SpeedButtonPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButtonCancelarClick(Sender: TObject);
    procedure SpeedButtonSairClick(Sender: TObject);
  private
    { Private declarations }
    CodigoTorneio: Integer;
    Procedure MontaTitulos;
  public
    { Public declarations }
  end;

var
  FormPontosDia: TFormPontosDia;

implementation

{$R *.dfm}

uses UDataModuloGeral;

procedure TFormPontosDia.DBGridListagemTorneioCellClick(Column: TColumn);
begin
  CodigoTorneio:= DBGridListagemTorneio.Fields[0].AsInteger;
end;

procedure TFormPontosDia.FormShow(Sender: TObject);
begin
  DataModuleGeral.FDQueryTorneios.Close;
  DataModuleGeral.FDQueryTorneios.Open;
  PageControlGeralPontuacao.TabIndex:= 0;
  CodigoTorneio:= -1;
  DateTimePickerDataUltimoJogo.Date:= Date;
end;

procedure TFormPontosDia.MontaTitulos;
var
  I: Integer;
begin
  for i:= 1 to StringGridPontuacaoDia.RowCount-1 do
    StringGridPontuacaoDia.Rows[i].Clear;
  StringGridPontuacaoDia.RowCount := 2;

  with StringGridPontuacaoDia do
  begin
    ColWidths[0]:=180;
    Cols[0].Text:= 'Nome';
    ColWidths[1]:=100;
    Cols[1].Text:= 'Presença';
    ColWidths[2]:=100;
    Cols[2].Text:= 'Retirada';
    ColWidths[3]:=100;
    Cols[3].Text:= 'Colocação';
    ColWidths[4]:=100;
    Cols[4].Text:= 'Ponto Ant.';
    ColWidths[5]:=100;
    Cols[5].Text:= 'Total';
  end;
end;

procedure TFormPontosDia.SpeedButtonCancelarClick(Sender: TObject);
begin
  PageControlGeralPontuacao.TabIndex:= 0;
end;

procedure TFormPontosDia.SpeedButtonEditarClick(Sender: TObject);
begin
    if (CodigoTorneio <> -1) then
  begin
    MontaTitulos;
    PageControlGeralPontuacao.TabIndex:= 1;
  end
  else
  begin
    ShowMessage('Você deve selecionar um torneio para editar!');
  end;
end;

procedure TFormPontosDia.SpeedButtonPesquisarClick(Sender: TObject);
var
  I:Integer;
begin
  DataModuleGeral.FDQueryPontuacaoGeral.Close;
  DataModuleGeral.FDQueryPontuacaoGeral.SQL.Clear;
  DataModuleGeral.FDQueryPontuacaoGeral.SQL.Add('SELECT');
  DataModuleGeral.FDQueryPontuacaoGeral.SQL.Add('  V_JOGO_DIA.CODIGO_JOGADOR,');
  DataModuleGeral.FDQueryPontuacaoGeral.SQL.Add('  V_JOGO_DIA.NOME_JOGADOR,');
  DataModuleGeral.FDQueryPontuacaoGeral.SQL.Add('  sum(V_JOGO_DIA.PONTOS_POSICAO + V_JOGO_DIA.PONTOS_ELIMINACAO + V_JOGO_DIA.COMPARECEU_PONTOS) AS total_pontos,');
  DataModuleGeral.FDQueryPontuacaoGeral.SQL.Add('  V_JOGO_DIA.TORNEIO');
  DataModuleGeral.FDQueryPontuacaoGeral.SQL.Add('FROM');
  DataModuleGeral.FDQueryPontuacaoGeral.SQL.Add('  V_JOGO_DIA');
  DataModuleGeral.FDQueryPontuacaoGeral.SQL.Add('WHERE');
  DataModuleGeral.FDQueryPontuacaoGeral.SQL.Add('  V_JOGO_DIA.TORNEIO = :TORNEIO and');
  DataModuleGeral.FDQueryPontuacaoGeral.SQL.Add('  V_JOGO_DIA.DATA_JOGO <= :DATA_JOGO');
  DataModuleGeral.FDQueryPontuacaoGeral.SQL.Add('GROUP BY');
  DataModuleGeral.FDQueryPontuacaoGeral.SQL.Add('  V_JOGO_DIA.CODIGO_JOGADOR,');
  DataModuleGeral.FDQueryPontuacaoGeral.SQL.Add('  V_JOGO_DIA.NOME_JOGADOR,');
  DataModuleGeral.FDQueryPontuacaoGeral.SQL.Add('  V_JOGO_DIA.TORNEIO');
  DataModuleGeral.FDQueryPontuacaoGeral.SQL.Add('  order by total_pontos desc');
  DataModuleGeral.FDQueryPontuacaoGeral.ParamByName('TORNEIO').AsInteger:= CodigoTorneio;
  DataModuleGeral.FDQueryPontuacaoGeral.ParamByName('DATA_JOGO').AsDate:= IncDay(DateTimePickerDataUltimoJogo.Date,-1);
  DataModuleGeral.FDQueryPontuacaoGeral.Open;
  DataModuleGeral.FDQueryPontuacaoGeral.First;
  if DataModuleGeral.FDQueryPontuacaoGeral.RecordCount > 0 then
  begin
    with StringGridPontuacaoDia do
    begin
      I:= 1;
      while not DataModuleGeral.FDQueryPontuacaoGeral.Eof do
      begin
        if (Cells[0,i] = '') then
        begin
          DataModuleGeral.FDQueryPontosUltimoJogo.Close;
          DataModuleGeral.FDQueryPontosUltimoJogo.SQL.Clear;
          DataModuleGeral.FDQueryPontosUltimoJogo.SQL.Add('select TORNEIO, CODIGO_JOGADOR, NOME_JOGADOR, COMPARECEU_PONTOS, PONTOS_ELIMINACAO,');
          DataModuleGeral.FDQueryPontosUltimoJogo.SQL.Add('  PONTOS_POSICAO, DATA_JOGO from V_JOGO_DIA');
          DataModuleGeral.FDQueryPontosUltimoJogo.SQL.Add('where TORNEIO = :TORNEIO and DATA_JOGO = :DATA_JOGO');
          DataModuleGeral.FDQueryPontosUltimoJogo.SQL.Add('and CODIGO_JOGADOR = :JOGADOR');
          DataModuleGeral.FDQueryPontosUltimoJogo.ParamByName('TORNEIO').AsInteger:= CodigoTorneio;
          DataModuleGeral.FDQueryPontosUltimoJogo.ParamByName('DATA_JOGO').AsDate:= DateTimePickerDataUltimoJogo.Date;
          DataModuleGeral.FDQueryPontosUltimoJogo.ParamByName('JOGADOR').AsInteger:= DataModuleGeral.FDQueryPontuacaoGeralCODIGO_JOGADOR.AsInteger;
          DataModuleGeral.FDQueryPontosUltimoJogo.Open;
          if (DataModuleGeral.FDQueryPontosUltimoJogo.RecordCount > 0)then
          begin
            Cells[0,I] := DataModuleGeral.FDQueryPontuacaoGeral.FieldByName('NOME_JOGADOR').AsString;
            Cells[1,i] := FloatToStrF(DataModuleGeral.FDQueryPontosUltimoJogo.FieldByName('COMPARECEU_PONTOS').AsFloat,ffNumber,12,0);
            Cells[2,i] := FloatToStrF(DataModuleGeral.FDQueryPontosUltimoJogo.FieldByName('PONTOS_ELIMINACAO').AsFloat,ffNumber,12,0);
            Cells[3,i] := FloatToStrF(DataModuleGeral.FDQueryPontosUltimoJogo.FieldByName('PONTOS_POSICAO').AsFloat,ffNumber,12,0);
            Cells[4,i] := FloatToStrF(DataModuleGeral.FDQueryPontuacaoGeral.FieldByName('TOTAL_PONTOS').AsFloat,ffNumber,12,0);
            Cells[5,i] := FloatToStrF(DataModuleGeral.FDQueryPontosUltimoJogoCOMPARECEU_PONTOS.AsFloat +
                                      DataModuleGeral.FDQueryPontosUltimoJogoPONTOS_ELIMINACAO.AsFloat +
                                      DataModuleGeral.FDQueryPontosUltimoJogoPONTOS_POSICAO.AsFloat +
                                      DataModuleGeral.FDQueryPontuacaoGeral.FieldByName('TOTAL_PONTOS').AsFloat,ffNumber,12,0);
          end;
          RowCount := RowCount + 1;
        end;
        inc(i);
        DataModuleGeral.FDQueryPontuacaoGeral.Next;
      end;
    end;
  end;
end;

procedure TFormPontosDia.SpeedButtonSairClick(Sender: TObject);
begin
  Close;
end;

end.
