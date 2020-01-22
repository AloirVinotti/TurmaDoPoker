unit UMensalidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFormMensalidade = class(TForm)
    PageControlGeralMensalidade: TPageControl;
    TabSheetListagemTorneios: TTabSheet;
    Panel1: TPanel;
    SpeedButtonEditar: TSpeedButton;
    SpeedButtonSair: TSpeedButton;
    DBGridListagemTorneio: TDBGrid;
    TabSheetMensalidades: TTabSheet;
    Panel2: TPanel;
    SpeedButtonSalvar: TSpeedButton;
    SpeedButtonCancelar: TSpeedButton;
    DBGridMensalidade: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure SpeedButtonEditarClick(Sender: TObject);
    procedure DBGridListagemTorneioCellClick(Column: TColumn);
    procedure SpeedButtonSalvarClick(Sender: TObject);
    procedure SpeedButtonCancelarClick(Sender: TObject);
    procedure SpeedButtonSairClick(Sender: TObject);
  private
    { Private declarations }
    CodigoTorneio: Integer;
  public
    { Public declarations }
  end;

var
  FormMensalidade: TFormMensalidade;

implementation

{$R *.dfm}

uses UDataModuloGeral, UMenuPrincipal;

procedure TFormMensalidade.DBGridListagemTorneioCellClick(Column: TColumn);
begin
  CodigoTorneio:= DBGridListagemTorneio.Fields[0].AsInteger;
end;

procedure TFormMensalidade.FormShow(Sender: TObject);
begin
  DataModuleGeral.FDQueryTorneios.Close;
  DataModuleGeral.FDQueryTorneios.Open;
  PageControlGeralMensalidade.TabIndex:= 0;
  CodigoTorneio:= -1;
end;

procedure TFormMensalidade.SpeedButtonCancelarClick(Sender: TObject);
begin
  PageControlGeralMensalidade.TabIndex:= 0;
end;

procedure TFormMensalidade.SpeedButtonEditarClick(Sender: TObject);
begin
  if (CodigoTorneio <> -1) then
  begin
    DataModuleGeral.FDQueryTorneioJogadores.Close;
    DataModuleGeral.FDQueryTorneioJogadores.SQL.Clear;
    DataModuleGeral.FDQueryTorneioJogadores.SQL.Add('Select * from V_TORNEIOS_JOGADORES where CODIGO_TORNEIO > 0');
    DataModuleGeral.FDQueryTorneioJogadores.SQL.Add('AND CODIGO_TORNEIO = :CODIGO_TORNEIO');
    DataModuleGeral.FDQueryTorneioJogadores.SQL.Add('order by CODIGO_JOGADORE');
    DataModuleGeral.FDQueryTorneioJogadores.ParamByName('CODIGO_TORNEIO').AsInteger:= CodigoTorneio;
    DataModuleGeral.FDQueryTorneioJogadores.Open;
    if (DataModuleGeral.FDQueryTorneioJogadores.RecordCount > 0) then
    begin
      while not DataModuleGeral.FDQueryTorneioJogadores.Eof do
      begin
        DataModuleGeral.FDTableMesalidade.Close;
        DataModuleGeral.FDTableMesalidade.Filter:= '';
        DataModuleGeral.FDTableMesalidade.Filter:= 'TORNEIO = ' + QuotedStr(IntToStr(CodigoTorneio));
        DataModuleGeral.FDTableMesalidade.Filter:= 'JOGADOR = ' + QuotedStr(IntToStr(DataModuleGeral.FDQueryTorneioJogadoresCODIGO_JOGADORE.AsInteger));
        DataModuleGeral.FDTableMesalidade.Filtered:= True;
        DataModuleGeral.FDTableMesalidade.Open;
        if (DataModuleGeral.FDTableMesalidade.RecordCount = 0) then
        begin
          DataModuleGeral.FDTableMesalidade.Insert;
          DataModuleGeral.FDTableMesalidadeTORNEIO.AsInteger:= CodigoTorneio;
          DataModuleGeral.FDTableMesalidadeJOGADOR.AsInteger:= DataModuleGeral.FDQueryTorneioJogadoresCODIGO_JOGADORE.AsInteger;
          DataModuleGeral.FDTableMesalidadeJANEIRO.AsFloat:= 0;
          DataModuleGeral.FDTableMesalidadeFEVEREIRO.AsFloat:= 0;
          DataModuleGeral.FDTableMesalidadeMARCO.AsFloat:= 0;
          DataModuleGeral.FDTableMesalidadeABRIL.AsFloat:= 0;
          DataModuleGeral.FDTableMesalidadeMAIO.AsFloat:= 0;
          DataModuleGeral.FDTableMesalidadeJUNHO.AsFloat:= 0;
          DataModuleGeral.FDTableMesalidadeJULHO.AsFloat:= 0;
          DataModuleGeral.FDTableMesalidadeAGOSTO.AsFloat:= 0;
          DataModuleGeral.FDTableMesalidadeSETEMBRO.AsFloat:= 0;
          DataModuleGeral.FDTableMesalidadeOUTUBRO.AsFloat:= 0;
          DataModuleGeral.FDTableMesalidadeNOVEMBRO.AsFloat:= 0;
          DataModuleGeral.FDTableMesalidadeDEZEMBRO.AsFloat:= 0;
          DataModuleGeral.FDTableMesalidade.Post;
          if not FormMenuPrincipal.FDTransaction.Active then
            FormMenuPrincipal.FDTransaction.StartTransaction;
          FormMenuPrincipal.FDTransaction.CommitRetaining;
        end;
        DataModuleGeral.FDQueryTorneioJogadores.Next;
      end;
    end;
    DataModuleGeral.FDTableMesalidade.Close;
    DataModuleGeral.FDTableMesalidade.Filter:= '';
    DataModuleGeral.FDTableMesalidade.Filtered:= True;;
    DataModuleGeral.FDTableMesalidade.Open;
    DataModuleGeral.FDTableMesalidade.Edit;
    PageControlGeralMensalidade.TabIndex:= 1;
  end
  else
  begin
    ShowMessage('Você deve selecionar um torneio para editar!');
  end;
end;

procedure TFormMensalidade.SpeedButtonSairClick(Sender: TObject);
begin
  close;
end;

procedure TFormMensalidade.SpeedButtonSalvarClick(Sender: TObject);
begin
  DataModuleGeral.FDTableMesalidade.Post;
  if not FormMenuPrincipal.FDTransaction.Active then
    FormMenuPrincipal.FDTransaction.StartTransaction;
  FormMenuPrincipal.FDTransaction.CommitRetaining;
  PageControlGeralMensalidade.TabIndex:= 0;
end;

end.
