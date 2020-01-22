unit URelatorioPremiacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFormRelatorioPremiacao = class(TForm)
    RLReportPremiacao: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLBand2: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLGroup1: TRLGroup;
    RLBand3: TRLBand;
    RLDBTextValor1: TRLDBText;
    RLDBTextValor2: TRLDBText;
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FormRelatorioPremiacao: TFormRelatorioPremiacao;

implementation

{$R *.dfm}
uses UDataModuloGeral, URelatorioPontuacaoGeral;

end.
