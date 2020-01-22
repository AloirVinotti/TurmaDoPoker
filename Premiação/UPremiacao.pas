unit UPremiacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TFormPremiacao = class(TForm)
    PageControlGeralPremiacao: TPageControl;
    TabSheetListagemTorneios: TTabSheet;
    Panel1: TPanel;
    SpeedButtonEditar: TSpeedButton;
    SpeedButtonSair: TSpeedButton;
    DBGridListagemTorneio: TDBGrid;
    TabSheetPremiacao: TTabSheet;
    Panel2: TPanel;
    SpeedButtonCancelar: TSpeedButton;
    DBGridPremiacao: TDBGrid;
    SpeedButtonSalvar: TSpeedButton;
    Panel3: TPanel;
    Label1: TLabel;
    SpeedButtonPesquisar: TSpeedButton;
    DateTimePickerJogo: TDateTimePicker;
    procedure DBGridListagemTorneioCellClick(Column: TColumn);
    procedure SpeedButtonEditarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButtonCancelarClick(Sender: TObject);
    procedure SpeedButtonSairClick(Sender: TObject);
    procedure SpeedButtonPesquisarClick(Sender: TObject);
    procedure SpeedButtonSalvarClick(Sender: TObject);
  private
    { Private declarations }
    CodigoTorneio: Integer;
  public
    { Public declarations }
  end;

var
  FormPremiacao: TFormPremiacao;

implementation

{$R *.dfm}

uses UDataModuloGeral, UMenuPrincipal;

procedure TFormPremiacao.DBGridListagemTorneioCellClick(Column: TColumn);
begin
  CodigoTorneio:= DBGridListagemTorneio.Fields[0].AsInteger;
end;

procedure TFormPremiacao.FormShow(Sender: TObject);
begin
  PageControlGeralPremiacao.TabIndex:= 0;
  CodigoTorneio:= -1;
  DateTimePickerJogo.Date:= Date;
end;

procedure TFormPremiacao.SpeedButtonCancelarClick(Sender: TObject);
begin
  PageControlGeralPremiacao.TabIndex:= 0;
end;

procedure TFormPremiacao.SpeedButtonEditarClick(Sender: TObject);
begin
  if (CodigoTorneio <> -1) then
  begin
    PageControlGeralPremiacao.TabIndex:= 1;
    SpeedButtonPesquisarClick(Self);
  end
  else
  begin
    ShowMessage('Você deve selecionar um torneio para editar!');
  end;
end;

procedure TFormPremiacao.SpeedButtonPesquisarClick(Sender: TObject);
begin
  DataModuleGeral.FDQueryPremiacao.Close;
  DataModuleGeral.FDQueryPremiacao.SQL.Clear;
  DataModuleGeral.FDQueryPremiacao.SQL.Add('Select * from V_JOGO_PREMIACAO');
  DataModuleGeral.FDQueryPremiacao.SQL.Add('where TORNEIO = :TORNEIO and DATA_JOGO = :DATA_JOGO');
  DataModuleGeral.FDQueryPremiacao.SQL.Add('order by POSICAO, DATA_JOGO');
  DataModuleGeral.FDQueryPremiacao.ParamByName('TORNEIO').AsInteger:= CodigoTorneio;
  DataModuleGeral.FDQueryPremiacao.ParamByName('DATA_JOGO').AsDate:= DateTimePickerJogo.Date;
  DataModuleGeral.FDQueryPremiacao.Open;
  DataModuleGeral.FDQueryPremiacao.Edit;
end;

procedure TFormPremiacao.SpeedButtonSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFormPremiacao.SpeedButtonSalvarClick(Sender: TObject);
begin
  DataModuleGeral.FDQueryPremiacao.Post;
  if not FormMenuPrincipal.FDTransaction.Active then
    FormMenuPrincipal.FDTransaction.StartTransaction;
  FormMenuPrincipal.FDTransaction.CommitRetaining;
  PageControlGeralPremiacao.TabIndex:= 0;
end;

end.
