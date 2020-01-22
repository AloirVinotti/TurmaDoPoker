unit URelatorioPontuacaoDia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, DateUtils, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFormRelatorioJogoDia = class(TForm)
    RLReportPontuacaoDia: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLBand2: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLGroup1: TRLGroup;
    RLBand3: TRLBand;
    RLDBTextValor1: TRLDBText;
    RLDBTextValor2: TRLDBText;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    FDQuery1: TFDQuery;
    RLLabel8: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelatorioJogoDia: TFormRelatorioJogoDia;

implementation

{$R *.dfm}

uses UDataModuloGeral {URelatorioPremiacao};

end.
