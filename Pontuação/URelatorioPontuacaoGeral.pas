unit URelatorioPontuacaoGeral;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport;

type
  TFormRelatorioPontuacaoGeral = class(TForm)
    RLReportPontuacaGeral: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLBand2: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLGroup1: TRLGroup;
    RLBand3: TRLBand;
    RLDBTextValor1: TRLDBText;
    RLDBTextValor2: TRLDBText;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabelDiferencaAcima: TRLLabel;
    RLLabelDiferencaPrimeiro: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabelPosicao: TRLLabel;
    procedure RLReportPontuacaGeralBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
    DiferencaAcima, DiferencaPrimeiro, ValorAtual: real;
    posicao: integer;
  public
    { Public declarations }
  end;

var
  FormRelatorioPontuacaoGeral: TFormRelatorioPontuacaoGeral;

implementation

{$R *.dfm}

uses UDataModuloGeral, URelatorioCalendario;

procedure TFormRelatorioPontuacaoGeral.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  DiferencaComPrimeiro: real;
begin
  Inc(posicao);
  RLLabelPosicao.Caption:= '';
  RLLabelPosicao.Caption:= IntToStr(posicao);
  DiferencaAcima:= ValorAtual - DataModuleGeral.FDQueryPontuacaoGeralPONTUACAO_GERAL.Value;
  DiferencaComPrimeiro:= DiferencaPrimeiro - DataModuleGeral.FDQueryPontuacaoGeralPONTUACAO_GERAL.Value;

  RLLabelDiferencaAcima.Caption:= '';
  RLLabelDiferencaPrimeiro.Caption:= '';
  if ValorAtual = 0 then
  begin
    RLLabelDiferencaAcima.Caption:= FloatToStrF(0,ffNumber,12,0);
    RLLabelDiferencaPrimeiro.Caption:= FloatToStrF(0,ffNumber,12,0);
  end
  else
  begin
    RLLabelDiferencaAcima.Caption:= FloatToStrF(DiferencaAcima,ffNumber,12,0);
    RLLabelDiferencaPrimeiro.Caption:= FloatToStrF(DiferencaComPrimeiro,ffNumber,12,0);
  end;
  ValorAtual:= DataModuleGeral.FDQueryPontuacaoGeralPONTUACAO_GERAL.Value;
  if RLBand3.Color = clSilver then
  begin
    RLBand3.Color:= clWhite;
  end
  else
  begin
    RLBand3.Color:= clSilver;
  end;
end;

procedure TFormRelatorioPontuacaoGeral.RLReportPontuacaGeralBeforePrint(
  Sender: TObject; var PrintIt: Boolean);
begin
  ValorAtual:= 0;
  DiferencaAcima:= 0;
  DiferencaPrimeiro:= DataModuleGeral.FDQueryPontuacaoGeralPONTUACAO_GERAL.Value;
  posicao:= 0;
end;

end.
