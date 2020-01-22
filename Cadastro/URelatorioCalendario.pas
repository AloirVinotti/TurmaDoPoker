unit URelatorioCalendario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport;

type
  TFormRelatorioCalendario = class(TForm)
    RLReportCalendario: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLBand2: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLGroup1: TRLGroup;
    RLBand3: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelatorioCalendario: TFormRelatorioCalendario;

implementation

{$R *.dfm}

uses UDataModuloGeral, UMenuPrincipal;

end.
