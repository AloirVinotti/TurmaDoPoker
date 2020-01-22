unit UPontuacaoExtra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls;

type
  TFormPontuacaoExtra = class(TForm)
    Panel2: TPanel;
    SpeedButtonRoyalStraightFlush: TSpeedButton;
    SpeedButtonStraightFlush: TSpeedButton;
    SpeedButtonQuadra: TSpeedButton;
    Panel1: TPanel;
    LabelJogadorPontoExtra: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    LabelPontosExtra: TLabel;
    Panel3: TPanel;
    SpeedButtonCancelar: TSpeedButton;
    procedure SpeedButtonCancelarClick(Sender: TObject);
    procedure SpeedButtonRoyalStraightFlushClick(Sender: TObject);
    procedure SpeedButtonStraightFlushClick(Sender: TObject);
    procedure SpeedButtonQuadraClick(Sender: TObject);
  private
    { Private declarations }
    procedure AdicionarPontoExtra(pontoExtra: integer);
  public
    { Public declarations }
    codigoJogador: integer;
    pontoExtraJogador: integer;
  end;

var
  FormPontuacaoExtra: TFormPontuacaoExtra;

implementation

{$R *.dfm}
uses UMenuPrincipal;

procedure TFormPontuacaoExtra.AdicionarPontoExtra(pontoExtra: integer);
begin
  pontoExtraJogador:= pontoExtraJogador + pontoExtra;
  if not FormMenuPrincipal.FDTransaction.Active then
    FormMenuPrincipal.FDTransaction.StartTransaction;
  with TFDQuery.Create(Self) do
  try
    Connection:= FormMenuPrincipal.FDConnection;
    Transaction:= FormMenuPrincipal.FDTransaction;
    Close;
    SQL.Clear;
    SQL.Add('Update V_JOGO_DIA_AUX set PONTO_EXTRA = :PONTOS');
    SQL.Add('where TORNEIO = :TORNEIO and CODIGO_JOGADOR = :CODIGO_JOGADOR');
    ParamByName('TORNEIO').AsInteger:= FormMenuPrincipal.CodigoTorneio;
    ParamByName('CODIGO_JOGADOR').AsInteger:= codigoJogador;
    ParamByName('PONTOS').AsInteger:= pontoExtraJogador;
    ExecSQL;
    FormMenuPrincipal.FDTransaction.CommitRetaining;
  finally
    free;
  end;
  LabelPontosExtra.Caption:= '';
  LabelPontosExtra.Caption:= IntToStr(pontoExtraJogador);
end;

procedure TFormPontuacaoExtra.SpeedButtonCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TFormPontuacaoExtra.SpeedButtonQuadraClick(Sender: TObject);
begin
  AdicionarPontoExtra(20);
end;

procedure TFormPontuacaoExtra.SpeedButtonRoyalStraightFlushClick(
  Sender: TObject);
begin
  AdicionarPontoExtra(100);
end;

procedure TFormPontuacaoExtra.SpeedButtonStraightFlushClick(Sender: TObject);
begin
  AdicionarPontoExtra(50);
end;

end.
