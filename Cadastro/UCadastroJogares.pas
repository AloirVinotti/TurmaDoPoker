unit UCadastroJogares;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TFormCadastroJogadores = class(TForm)
    PageControlGeralCadastroJogadores: TPageControl;
    TabSheetListagemJogadores: TTabSheet;
    TabSheetCadastroJogadores: TTabSheet;
    DBGridListagemJogadores: TDBGrid;
    Panel1: TPanel;
    SpeedButtonNovo: TSpeedButton;
    SpeedButtonEditar: TSpeedButton;
    SpeedButtonExcluir: TSpeedButton;
    SpeedButtonSair: TSpeedButton;
    Panel2: TPanel;
    SpeedButtonSalvar: TSpeedButton;
    SpeedButtonCancelar: TSpeedButton;
    Label1: TLabel;
    EditCodigoJogador: TEdit;
    Label2: TLabel;
    EditNomeJogador: TEdit;
    procedure SpeedButtonSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButtonNovoClick(Sender: TObject);
    procedure SpeedButtonEditarClick(Sender: TObject);
    procedure SpeedButtonSalvarClick(Sender: TObject);
    procedure SpeedButtonCancelarClick(Sender: TObject);
    procedure SpeedButtonExcluirClick(Sender: TObject);
  private
    { Private declarations }
    Procedure LimparCampos;
    Procedure MostrarListagem;
    Procedure EscoderListagem;
    Procedure AtualizarLista;
  public
    { Public declarations }
  end;

var
  FormCadastroJogadores: TFormCadastroJogadores;

implementation

{$R *.dfm}
uses UMenuPrincipal, UDataModuloGeral;
procedure TFormCadastroJogadores.AtualizarLista;
begin
  DataModuleGeral.FDQueryJogadores.Close;
  DataModuleGeral.FDQueryJogadores.Open;
end;

procedure TFormCadastroJogadores.EscoderListagem;
begin
  TabSheetCadastroJogadores.TabVisible:= True;
  TabSheetListagemJogadores.TabVisible:= False;
end;

procedure TFormCadastroJogadores.FormShow(Sender: TObject);
begin
  MostrarListagem;
  AtualizarLista;
end;

procedure TFormCadastroJogadores.SpeedButtonSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFormCadastroJogadores.LimparCampos;
begin
  EditCodigoJogador.Text:= '0';
  EditNomeJogador.Text:= '';
end;

procedure TFormCadastroJogadores.MostrarListagem;
begin
  TabSheetCadastroJogadores.TabVisible:= False;
  TabSheetListagemJogadores.TabVisible:= True;
end;

procedure TFormCadastroJogadores.SpeedButtonCancelarClick(Sender: TObject);
begin
  MostrarListagem;
end;

procedure TFormCadastroJogadores.SpeedButtonEditarClick(Sender: TObject);
begin
  EscoderListagem;
  EditCodigoJogador.Text:= IntToStr(DBGridListagemJogadores.Fields[0].AsInteger);
  EditNomeJogador.Text:= DBGridListagemJogadores.Fields[1].AsString;
  EditNomeJogador.SetFocus;
end;

procedure TFormCadastroJogadores.SpeedButtonExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Tem certeza que deseka excluír o item selecionado','Excluír Jogador',MB_ICONQUESTION + MB_YESNO + MB_SYSTEMMODAL) = ID_YES then
  begin
    if not FormMenuPrincipal.FDTransaction.Active then
      FormMenuPrincipal.FDTransaction.StartTransaction;
    with TFDQuery.Create(Self) do
    try
      Connection:= FormMenuPrincipal.FDConnection;
      Transaction:= FormMenuPrincipal.FDTransaction;
      Close;
      SQL.Clear;
      SQL.Add('Delete from JOGADORES where CODIGO = :CODIGO');
      ParamByName('CODIGO').AsInteger:= DBGridListagemJogadores.Fields[0].AsInteger;
      ExecSQL;
      FormMenuPrincipal.FDTransaction.Commit;
    finally
      free;
    end;
    AtualizarLista;
  end;
end;

procedure TFormCadastroJogadores.SpeedButtonNovoClick(Sender: TObject);
begin
  EscoderListagem;
  LimparCampos;
  EditNomeJogador.SetFocus;
end;

procedure TFormCadastroJogadores.SpeedButtonSalvarClick(Sender: TObject);
begin
  if not FormMenuPrincipal.FDTransaction.Active then
    FormMenuPrincipal.FDTransaction.StartTransaction;
  with TFDQuery.Create(Self) do
  Try
    Connection:= FormMenuPrincipal.FDConnection;
    Transaction:= FormMenuPrincipal.FDTransaction;
    Close;
    SQL.Clear;
    SQL.Add('Update or Insert into JOGADORES (CODIGO, NOME) Values (:CODIGO, :NOME)');
    ParamByName('CODIGO').AsInteger:= StrToInt(EditCodigoJogador.Text);
    ParamByName('NOME').AsString:= EditNomeJogador.Text;
    ExecSQL;
    FormMenuPrincipal.FDTransaction.Commit;
  Finally
    Free;
  End;
  LimparCampos;
  AtualizarLista;
  MostrarListagem;
end;

end.
