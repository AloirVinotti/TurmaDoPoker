unit UConfiguracoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Themes, Vcl.Styles;

type
  TFormConfiguracoes = class(TForm)
    Panel2: TPanel;
    SpeedButtonSalvar: TSpeedButton;
    SpeedButtonCancelar: TSpeedButton;
    PageControl1: TPageControl;
    TabSheetAparencia: TTabSheet;
    Label1: TLabel;
    ComboBoxEstilo: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure ComboBoxEstiloChange(Sender: TObject);
    procedure SpeedButtonCancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarEstilos;
  public
    { Public declarations }
  end;

var
  FormConfiguracoes: TFormConfiguracoes;

implementation

{$R *.dfm}

{ TFormConfiguracoes }

procedure TFormConfiguracoes.CarregarEstilos;
var
  estilo: string;
begin
  ComboBoxEstilo.Items.BeginUpdate;
  try
    ComboBoxEstilo.Items.Clear;

    for estilo in TStyleManager.StyleNames do
    begin
      ComboBoxEstilo.Items.Add(estilo);
    end;
    ComboBoxEstilo.Sorted:= true;
    ComboBoxEstilo.ItemIndex:= ComboBoxEstilo.Items.IndexOf(TStyleManager.ActiveStyle.Name);
  finally
    ComboBoxEstilo.Items.EndUpdate;
  end;
end;

procedure TFormConfiguracoes.ComboBoxEstiloChange(Sender: TObject);
begin
  TStyleManager.TrySetStyle(ComboBoxEstilo.Items[ComboBoxEstilo.ItemIndex]);
end;

procedure TFormConfiguracoes.FormShow(Sender: TObject);
begin
  CarregarEstilos;
end;

procedure TFormConfiguracoes.SpeedButtonCancelarClick(Sender: TObject);
begin
  close;
end;

end.
