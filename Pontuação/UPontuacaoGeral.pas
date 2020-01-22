unit UPontuacaoGeral;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TFormPontuacaoGeral = class(TForm)
    PageControlGeralPontuacao: TPageControl;
    TabSheetListagemTorneios: TTabSheet;
    Panel1: TPanel;
    SpeedButtonEditar: TSpeedButton;
    SpeedButtonSair: TSpeedButton;
    DBGridListagemTorneio: TDBGrid;
    TabSheetPontuacaoGeral: TTabSheet;
    Panel2: TPanel;
    SpeedButtonCancelar: TSpeedButton;
    StringGridPontuacaoGeral: TStringGrid;
    procedure DBGridListagemTorneioCellClick(Column: TColumn);
    procedure SpeedButtonEditarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButtonSairClick(Sender: TObject);
    procedure SpeedButtonCancelarClick(Sender: TObject);
  private
    { Private declarations }
    CodigoTorneio: Integer;
    Procedure MontaTitulos;
  public
    { Public declarations }
  end;

var
  FormPontuacaoGeral: TFormPontuacaoGeral;

implementation

{$R *.dfm}

uses UMenuPrincipal, UDataModuloGeral;

procedure TFormPontuacaoGeral.DBGridListagemTorneioCellClick(Column: TColumn);
begin
  CodigoTorneio:= DBGridListagemTorneio.Fields[0].AsInteger;
end;

procedure TFormPontuacaoGeral.FormShow(Sender: TObject);
begin
  PageControlGeralPontuacao.TabIndex:= 0;
  CodigoTorneio:= -1;
end;

procedure TFormPontuacaoGeral.MontaTitulos;
var
  I: Integer;
begin
  for i:= 1 to StringGridPontuacaoGeral.RowCount-1 do
    StringGridPontuacaoGeral.Rows[i].Clear;
  StringGridPontuacaoGeral.RowCount := 2;

  with StringGridPontuacaoGeral do
  begin
    ColWidths[0]:=180;
    Cols[0].Text:= 'Nome';
    ColWidths[1]:=180;
    Cols[1].Text:= 'Pontos';
    ColWidths[2]:=180;
    Cols[2].Text:= 'Difença Entre o Colocado Acima';
    ColWidths[3]:=180;
    Cols[3].Text:= 'Difença Entre o Primeiro';
  end;
end;

procedure TFormPontuacaoGeral.SpeedButtonCancelarClick(Sender: TObject);
begin
  PageControlGeralPontuacao.TabIndex:= 0;
end;

procedure TFormPontuacaoGeral.SpeedButtonEditarClick(Sender: TObject);
var
  I:Integer;
  DiferencaAcima, DiferencaPrimeiro, Valor: real;
begin
  if (CodigoTorneio <> -1) then
  begin
    MontaTitulos;
    DiferencaAcima:= 0;
    DiferencaPrimeiro:= 0;
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
    DataModuleGeral.FDQueryPontuacaoGeral.SQL.Add('order by TOTAL_PONTOS DESC');
    DataModuleGeral.FDQueryPontuacaoGeral.ParamByName('TORNEIO').AsInteger:= CodigoTorneio;
    DataModuleGeral.FDQueryPontuacaoGeral.ParamByName('DATA_JOGO').AsDate:= Date;
    DataModuleGeral.FDQueryPontuacaoGeral.Open;
    DataModuleGeral.FDQueryPontuacaoGeral.First;
    if DataModuleGeral.FDQueryPontuacaoGeral.RecordCount > 0 then
    begin
      with StringGridPontuacaoGeral do
      begin
        I:= 1;
        while not DataModuleGeral.FDQueryPontuacaoGeral.Eof do
        begin
          if (Cells[0,i] = '') then
          begin
            if (I <> 1) then
            begin
              Valor:= DataModuleGeral.FDQueryPontuacaoGeral.FieldByName('TOTAL_PONTOS').AsFloat;
              DiferencaAcima:= StrToFloat(Cells[1,I-1]) - Valor;
              DiferencaPrimeiro:= StrToFloat(Cells[1,1]) - Valor;
            end;
            Cells[0,I] := DataModuleGeral.FDQueryPontuacaoGeral.FieldByName('NOME_JOGADOR').AsString;
            Cells[1,i] := FloatToStrF(DataModuleGeral.FDQueryPontuacaoGeral.FieldByName('TOTAL_PONTOS').AsFloat,ffNumber,12,0);
            Cells[2,i] := FloatToStrF(DiferencaAcima,ffNumber,12,0);
            Cells[3,i] := FloatToStrF(DiferencaPrimeiro,ffNumber,12,0);
            RowCount := RowCount + 1;
          end;
          inc(i);
          DataModuleGeral.FDQueryPontuacaoGeral.Next;
        end;
      end;
    end;
    PageControlGeralPontuacao.TabIndex:= 1;
  end
  else
  begin
    ShowMessage('Você deve selecionar um torneio para editar!');
  end;
end;

procedure TFormPontuacaoGeral.SpeedButtonSairClick(Sender: TObject);
begin
  Close;
end;

end.
