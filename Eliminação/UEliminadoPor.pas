unit UEliminadoPor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFormEliminadoPor = class(TForm)
    Panel2: TPanel;
    SpeedButtonConfirmar: TSpeedButton;
    ListViewJogadores: TListView;
    SpeedButtonCancelar: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure SpeedButtonConfirmarClick(Sender: TObject);
    procedure SpeedButtonCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    codigoJogadoresEliminou: string;
  end;

var
  FormEliminadoPor: TFormEliminadoPor;

implementation

{$R *.dfm}
uses UMenuPrincipal;

procedure TFormEliminadoPor.FormShow(Sender: TObject);
var
  Item: TListItem;
begin
  with TFDQuery.Create(Self) do
  try
    Connection:= FormMenuPrincipal.FDConnection;
    Transaction:= FormMenuPrincipal.FDTransaction;
    Close;
    SQL.Clear;
    SQL.Add('Select * from V_JOGO_DIA_AUX where TORNEIO = :TORNEIO and ELIMINADO = :ELIMINADO');
    ParamByName('TORNEIO').AsInteger:= FormMenuPrincipal.CodigoTorneio;
    ParamByName('ELIMINADO').AsString:= 'N';
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
end;

procedure TFormEliminadoPor.SpeedButtonCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFormEliminadoPor.SpeedButtonConfirmarClick(Sender: TObject);
var
  I, qtdadeJogadores, Pontos: Integer;
  Selecionou: boolean;
begin
  qtdadeJogadores:= 0;
  Selecionou:= False;
  codigoJogadoresEliminou:= '';
  for I:= 0 to (ListViewJogadores.Items.Count-1) do
  begin
    if ListViewJogadores.Items[I].Checked then
    begin
      Inc(qtdadeJogadores);
      Selecionou:= True;
    end;
  end;
  if (Selecionou) then
  begin
    Pontos:= Trunc(FormMenuPrincipal.PontosRetirada / qtdadeJogadores);
    for I:= 0 to (ListViewJogadores.Items.Count-1) do
    begin
      if ListViewJogadores.Items[I].Checked then
      begin
        codigoJogadoresEliminou :=  codigoJogadoresEliminou + ListViewJogadores.Items[I].Caption + ';';
        if not FormMenuPrincipal.FDTransaction.Active then
          FormMenuPrincipal.FDTransaction.StartTransaction;
        with TFDQuery.Create(Self) do
        try
          Connection:= FormMenuPrincipal.FDConnection;
          Transaction:= FormMenuPrincipal.FDTransaction;
          Close;
          SQL.Clear;
          SQL.Add('Update V_JOGO_DIA_AUX set PONTOS_ELIMINACAO = PONTOS_ELIMINACAO + :PONTOS');
          SQL.Add('where TORNEIO = :TORNEIO and CODIGO_JOGADOR = :CODIGO_JOGADOR');
          ParamByName('TORNEIO').AsInteger:= FormMenuPrincipal.CodigoTorneio;
          ParamByName('CODIGO_JOGADOR').AsInteger:= StrToInt(ListViewJogadores.Items[I].Caption);
          ParamByName('PONTOS').AsInteger:= Pontos;
          ExecSQL;
          FormMenuPrincipal.FDTransaction.CommitRetaining;
        finally
          free;
        end;
      end;
    end;
    Close;
  end;
end;

end.
