unit UEliminacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFormEliminacao = class(TForm)
    Panel2: TPanel;
    SpeedButtonConfirmar: TSpeedButton;
    SpeedButtonCancelar: TSpeedButton;
    Panel1: TPanel;
    SpeedButtonCima: TSpeedButton;
    SpeedButtonBaixo: TSpeedButton;
    ListViewJogadores: TListView;
    ListViewJogadoresEliminados: TListView;
    SpeedButtonConfirmarEliminacao: TSpeedButton;
    procedure SpeedButtonCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButtonCimaClick(Sender: TObject);
    procedure SpeedButtonBaixoClick(Sender: TObject);
    procedure SpeedButtonConfirmarClick(Sender: TObject);
    procedure SpeedButtonConfirmarEliminacaoClick(Sender: TObject);
  private
    { Private declarations }
    procedure AjustarNovasPosicoes(operacao:string; index: integer);
    procedure EliminarJogador(codigoJogador:integer);
    procedure GravarNovaPosicaoEliminacao;

  public
    { Public declarations }
    eliminar: boolean;
  end;

var
  FormEliminacao: TFormEliminacao;

implementation

{$R *.dfm}
uses UMenuPrincipal;

procedure TFormEliminacao.AjustarNovasPosicoes(operacao: string; index:integer);
var
  ItemNovo: TListItem;
  I: Integer;
begin
   ListViewJogadores.Clear;
   for I := 0 to ListViewJogadoresEliminados.Items.Count-1 do
   begin
       if (operacao = '-') and (index - 1 = i) then
       begin
         ItemNovo:= ListViewJogadores.Items.Add;
         ItemNovo.Caption:= ListViewJogadoresEliminados.Items[i+1].Caption;
         ItemNovo.SubItems.Add(ListViewJogadoresEliminados.Items[i+1].SubItems[0]);
       end
       else
       if (operacao = '+') and (index = i) then
       begin
         ItemNovo:= ListViewJogadores.Items.Add;
         ItemNovo.Caption:= ListViewJogadoresEliminados.Items[i+1].Caption;
         ItemNovo.SubItems.Add(ListViewJogadoresEliminados.Items[i+1].SubItems[0]);
         ItemNovo:= ListViewJogadores.Items.Add;
         ItemNovo.Caption:= ListViewJogadoresEliminados.Items[i].Caption;
         ItemNovo.SubItems.Add(ListViewJogadoresEliminados.Items[i].SubItems[0]);
       end;
     if (operacao = '+') and (index + 1 = i) then
     begin
       Continue;
     end;
     if (index <> i) then
     begin
       ItemNovo:= ListViewJogadores.Items.Add;
       ItemNovo.Caption:= ListViewJogadoresEliminados.Items[i].Caption;
       ItemNovo.SubItems.Add(ListViewJogadoresEliminados.Items[i].SubItems[0]);
     end ;

   end;
   ListViewJogadoresEliminados.Clear;
   ListViewJogadoresEliminados.Items:= ListViewJogadores.Items;
end;


procedure TFormEliminacao.EliminarJogador(codigoJogador: integer);
begin
  if not FormMenuPrincipal.FDTransaction.Active then
    FormMenuPrincipal.FDTransaction.StartTransaction;
  with TFDQuery.Create(Self) do
  try
    Connection:= FormMenuPrincipal.FDConnection;
    Transaction:= FormMenuPrincipal.FDTransaction;
    Close;
    SQL.Clear;
    SQL.Add('Update V_JOGO_DIA_AUX set ELIMINADO = :ELIMINADO');
    SQL.Add('where TORNEIO = :TORNEIO and CODIGO_JOGADOR = :CODIGO_JOGADOR');
    ParamByName('TORNEIO').AsInteger:= FormMenuPrincipal.CodigoTorneio;
    ParamByName('CODIGO_JOGADOR').AsInteger:= codigoJogador;
    ParamByName('ELIMINADO').AsString:= 'S';
    ExecSQL;
  finally
    free;
  end;
end;

procedure TFormEliminacao.FormShow(Sender: TObject);
var
  Item: TListItem;
begin
  with TFDQuery.Create(Self) do
  try
    Connection:= FormMenuPrincipal.FDConnection;
    Transaction:= FormMenuPrincipal.FDTransaction;
    Close;
    SQL.Clear;
    SQL.Add('Select * from V_JOGO_DIA_AUX where TORNEIO = :TORNEIO');
    ParamByName('TORNEIO').AsInteger:= FormMenuPrincipal.CodigoTorneio;
    Open;
    if (RecordCount > 0) then
    begin
      ListViewJogadores.Clear;
      while not eof do
      begin
        Item:= ListViewJogadores.Items.Add;
        Item.Caption:= IntToStr(FieldByName('CODIGO_JOGADOR').AsInteger);
        Item.SubItems.Add(FieldByName('NOME_JOGADOR').AsString);
        next;
      end;
    end;
  finally
    free;
  end;
  eliminar:= false;
end;

procedure TFormEliminacao.GravarNovaPosicaoEliminacao;
var
  I: Integer;
begin
  for I := 0 to ListViewJogadoresEliminados.Items.Count - 1 do
  begin
    if not FormMenuPrincipal.FDTransaction.Active then
      FormMenuPrincipal.FDTransaction.StartTransaction;
    with TFDQuery.Create(Self) do
    try
      Connection:= FormMenuPrincipal.FDConnection;
      Transaction:= FormMenuPrincipal.FDTransaction;
      Close;
      SQL.Clear;
      SQL.Add('Update V_JOGO_DIA_AUX set ELIMINACAO_POSICAO = :ELIMINACAO_POSICAO');
      SQL.Add('where TORNEIO = :TORNEIO and CODIGO_JOGADOR = :CODIGO_JOGADOR');
      ParamByName('TORNEIO').AsInteger:= FormMenuPrincipal.CodigoTorneio;
      ParamByName('CODIGO_JOGADOR').AsInteger:= StrToInt(ListViewJogadoresEliminados.Items[I].Caption);
      ParamByName('ELIMINACAO_POSICAO').AsInteger:= I;
      ExecSQL;
    finally
      free;
    end;
  end;
end;

procedure TFormEliminacao.SpeedButtonBaixoClick(Sender: TObject);
begin
  if (ListViewJogadoresEliminados.Selected <> nil) then
  begin
    if (ListViewJogadoresEliminados.Selected.Index <> ListViewJogadoresEliminados.Items.Count-1) then
    begin
      AjustarNovasPosicoes('+', ListViewJogadoresEliminados.Selected.Index);
    end;
  end;
end;

procedure TFormEliminacao.SpeedButtonCancelarClick(Sender: TObject);
begin
  FormMenuPrincipal.FDTransaction.RollbackRetaining;
  Close;
end;

procedure TFormEliminacao.SpeedButtonCimaClick(Sender: TObject);
begin
  if (ListViewJogadoresEliminados.Selected <> nil) then
  begin
    if (ListViewJogadoresEliminados.Selected.Index <> 0) then
    begin
      AjustarNovasPosicoes('-', ListViewJogadoresEliminados.Selected.Index);
    end;
  end;
end;
procedure TFormEliminacao.SpeedButtonConfirmarClick(Sender: TObject);
var
  I: Integer;
  Item: TListItem;
  selecionado: boolean;
begin
  selecionado:= false;
  ListViewJogadoresEliminados.Clear;
  for I := 0 to ListViewJogadores.Items.Count -1 do
  begin
    if (ListViewJogadores.Items[i].Checked) then
    begin
      Item:= ListViewJogadoresEliminados.Items.Add;
      Item.Caption:= ListViewJogadores.Items[i].Caption;
      Item.SubItems.Add(ListViewJogadores.Items[i].SubItems[0]);
      EliminarJogador(StrToInt(ListViewJogadores.Items[i].Caption));
      selecionado:= true;
    end;
  end;
  if (selecionado) then
  begin
    if (ListViewJogadoresEliminados.Items.Count = 1) then
    begin
      SpeedButtonConfirmarEliminacaoClick(self);
    end;
    ListViewJogadoresEliminados.BringToFront;
    SpeedButtonCima.Visible:= true;
    SpeedButtonBaixo.Visible:= True;
    SpeedButtonConfirmarEliminacao.Visible:= true;
    SpeedButtonConfirmar.Visible:= false;
  end
  else
  begin
    ShowMessage('Nenhum jogador selecionado!');
  end;
end;

procedure TFormEliminacao.SpeedButtonConfirmarEliminacaoClick(Sender: TObject);
begin
  GravarNovaPosicaoEliminacao;
  FormMenuPrincipal.FDTransaction.CommitRetaining;
  eliminar:= true;
  Close;
end;

end.
