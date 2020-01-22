unit UCadastroTorneios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFormCadastroDeTorneios = class(TForm)
    PageControlGeralCadastroTorneios: TPageControl;
    TabSheetListagemTorneios: TTabSheet;
    TabSheetCadastroTorneios: TTabSheet;
    Panel1: TPanel;
    SpeedButtonNovo: TSpeedButton;
    SpeedButtonEditar: TSpeedButton;
    SpeedButtonExcluir: TSpeedButton;
    SpeedButtonSair: TSpeedButton;
    DBGridListagemJogadores: TDBGrid;
    Panel2: TPanel;
    SpeedButtonSalvar: TSpeedButton;
    SpeedButtonCancelar: TSpeedButton;
    PageControlInformacoesTorneio: TPageControl;
    TabSheetBlinds: TTabSheet;
    TabSheetJogadores: TTabSheet;
    TabSheetPontuacao: TTabSheet;
    TabSheetPremiacao: TTabSheet;
    TabSheetGeral: TTabSheet;
    Panel3: TPanel;
    Label6: TLabel;
    EditSmallBlind: TEdit;
    Label7: TLabel;
    EditBigBlind: TEdit;
    Label8: TLabel;
    EditAnte: TEdit;
    DateTimePickerTempo: TDateTimePicker;
    Label9: TLabel;
    DateTimePickerBreak: TDateTimePicker;
    Label10: TLabel;
    StringGridListagemBlind: TStringGrid;
    SpeedButtonAdicionarBlinds: TSpeedButton;
    Panel4: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    EditNivel: TEdit;
    Label11: TLabel;
    ListViewJogadores: TListView;
    Panel5: TPanel;
    SpeedButtonAdicionarJogadores: TSpeedButton;
    SpeedButtonMarcarTodosAdicionar: TSpeedButton;
    SpeedButtonDesmarcarTodosAdicionar: TSpeedButton;
    ListViewJogadoresTorneio: TListView;
    Panel6: TPanel;
    Label12: TLabel;
    Panel7: TPanel;
    SpeedButtonExcluirJogador: TSpeedButton;
    Panel8: TPanel;
    Label13: TLabel;
    SpeedButtonAdicionarPontos: TSpeedButton;
    Label18: TLabel;
    EditPontos: TEdit;
    EditPosicaoPontuacao: TEdit;
    StringGridPontuacao: TStringGrid;
    LabelPontuacaoRetirada: TLabel;
    EditPontoRetirada: TEdit;
    LabelPontuacaoPresenca: TLabel;
    EditPontosPresenca: TEdit;
    Panel9: TPanel;
    SpeedButtonEditarPontos: TSpeedButton;
    SpeedButtonExcluirPontos: TSpeedButton;
    Panel10: TPanel;
    SpeedButtonAdicionarPremio: TSpeedButton;
    StringGridListagemPremio: TStringGrid;
    Panel11: TPanel;
    SpeedButtonEditarPremio: TSpeedButton;
    SpeedButtonExcluirPremio: TSpeedButton;
    RadioGroupTipoPremio: TRadioGroup;
    Panel12: TPanel;
    EditValorPremio: TEdit;
    Label14: TLabel;
    EditPosicaoPremio: TEdit;
    Label15: TLabel;
    GroupBoxRelatorios: TGroupBox;
    CheckBoxRelatorioMensalidade: TCheckBox;
    CheckBoxRelatorioJogoDia: TCheckBox;
    CheckBoxRelatorioPremiacao: TCheckBox;
    CheckBoxRelatorioPontuacaoGeral: TCheckBox;
    CheckBoxRelatorioCalendario: TCheckBox;
    GroupBoxGeral: TGroupBox;
    Label1: TLabel;
    EditCodigoTorneio: TEdit;
    Label2: TLabel;
    EditNomeTorneio: TEdit;
    GroupBoxBuyIn: TGroupBox;
    Label3: TLabel;
    EditBuyInValor: TEdit;
    Label4: TLabel;
    EditBuyInQuantidade: TEdit;
    GroupBoxReBuy: TGroupBox;
    CheckBoxRe_Buy: TCheckBox;
    LabelReBuy: TLabel;
    EditReBuyValor: TEdit;
    LabelReBuyQuantidade: TLabel;
    EditReBuyQuantidade: TEdit;
    RadioGroupLimiteRe_Buy: TRadioGroup;
    LabelReBuyLimite: TLabel;
    EditReBuyLimite: TEdit;
    GroupBoxAddOn: TGroupBox;
    EditAddOnQuantidade: TEdit;
    LabelAddOnQuantidade: TLabel;
    EditAddOnValor: TEdit;
    LabelAddOn: TLabel;
    CheckBoxAddOn: TCheckBox;
    GroupBoxOutros: TGroupBox;
    Label5: TLabel;
    EditJogadoresQuantidade: TEdit;
    CheckBoxPontuacao: TCheckBox;
    CheckBoxJogadores: TCheckBox;
    CheckBoxPremiacao: TCheckBox;
    Label16: TLabel;
    EditPontosRetiradaDupla: TEdit;
    Label17: TLabel;
    EditPontosRetiradaMultipla: TEdit;
    CheckBoxHoraInicio: TCheckBox;
    DateTimePickerHoraInicio: TDateTimePicker;
    Label19: TLabel;
    EditCaminhoPastaSom: TEdit;
    Label20: TLabel;
    procedure CheckBoxRe_BuyClick(Sender: TObject);
    procedure SpeedButtonNovoClick(Sender: TObject);
    procedure SpeedButtonEditarClick(Sender: TObject);
    procedure CheckBoxAddOnClick(Sender: TObject);
    procedure CheckBoxPontuacaoClick(Sender: TObject);
    procedure CheckBoxJogadoresClick(Sender: TObject);
    procedure CheckBoxPremiacaoClick(Sender: TObject);
    procedure SpeedButtonAdicionarBlindsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditSmallBlindKeyPress(Sender: TObject; var Key: Char);
    procedure EditBigBlindKeyPress(Sender: TObject; var Key: Char);
    procedure EditAnteKeyPress(Sender: TObject; var Key: Char);
    procedure DateTimePickerTempoKeyPress(Sender: TObject; var Key: Char);
    procedure DateTimePickerBreakKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure EditNomeTorneioKeyPress(Sender: TObject; var Key: Char);
    procedure EditBuyInValorKeyPress(Sender: TObject; var Key: Char);
    procedure EditBuyInQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure CheckBoxRe_BuyKeyPress(Sender: TObject; var Key: Char);
    procedure EditReBuyValorKeyPress(Sender: TObject; var Key: Char);
    procedure EditReBuyQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EditReBuyLimiteKeyPress(Sender: TObject; var Key: Char);
    procedure CheckBoxAddOnKeyPress(Sender: TObject; var Key: Char);
    procedure EditAddOnValorKeyPress(Sender: TObject; var Key: Char);
    procedure EditAddOnQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EditJogadoresQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure CheckBoxPontuacaoKeyPress(Sender: TObject; var Key: Char);
    procedure EditPontoRetiradaKeyPress(Sender: TObject; var Key: Char);
    procedure EditPontosPresencaKeyPress(Sender: TObject; var Key: Char);
    procedure CheckBoxJogadoresKeyPress(Sender: TObject; var Key: Char);
    procedure CheckBoxPremiacaoKeyPress(Sender: TObject; var Key: Char);
    procedure PageControlInformacoesTorneioChange(Sender: TObject);
    procedure SpeedButtonMarcarTodosAdicionarClick(Sender: TObject);
    procedure SpeedButtonDesmarcarTodosAdicionarClick(Sender: TObject);
    procedure SpeedButtonMarcarTodosDeletarClick(Sender: TObject);
    procedure SpeedButtonDesmarcarTodosDeletarClick(Sender: TObject);
    procedure SpeedButtonAdicionarJogadoresClick(Sender: TObject);
    procedure SpeedButtonExcluirJogadorClick(Sender: TObject);
    procedure SpeedButtonAdicionarPontosClick(Sender: TObject);
    procedure SpeedButtonEditarPontosClick(Sender: TObject);
    procedure SpeedButtonExcluirPontosClick(Sender: TObject);
    procedure SpeedButtonAdicionarPremioClick(Sender: TObject);
    procedure SpeedButtonEditarPremioClick(Sender: TObject);
    procedure SpeedButtonExcluirPremioClick(Sender: TObject);
    procedure SpeedButtonSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButtonSalvarClick(Sender: TObject);
    procedure DBGridListagemJogadoresCellClick(Column: TColumn);
    procedure EditBuyInValorExit(Sender: TObject);
    procedure EditReBuyValorExit(Sender: TObject);
    procedure EditAddOnValorExit(Sender: TObject);
    procedure SpeedButtonCancelarClick(Sender: TObject);
    procedure EditPontosRetiradaDuplaKeyPress(Sender: TObject; var Key: Char);
    procedure EditPontosRetiradaMultiplaKeyPress(Sender: TObject;
      var Key: Char);
    procedure CheckBoxHoraInicioClick(Sender: TObject);
    procedure CheckBoxHoraInicioKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    IndexAbaAtiva, CodigoTorneio: Integer;
    RecebeValo: real;
    Procedure MontaTitulos;
    Procedure LimparCamposGeral;
    Procedure LimparCamposBlinds;
    Procedure LimparCamposPontos;
    Procedure LimparCamposPremio;
    Procedure LimparCamposRelatorio;
    Procedure MontarListaJogadores;
    Procedure MontarListaJogadoresTorneio(Codigo:Integer;Nome:String);
    Procedure MostrarListagem;
    Procedure EscoderListagem;
    Procedure AtualizarLista;
    Procedure AjustaNumeracao;
    Procedure PegaDados;
  public
    { Public declarations }
  end;

var
  FormCadastroDeTorneios: TFormCadastroDeTorneios;

implementation

{$R *.dfm}

uses UMenuPrincipal, UDataModuloGeral;

procedure TFormCadastroDeTorneios.AjustaNumeracao;
begin
  EditNivel.Text:= '1';
  EditPosicaoPontuacao.Text:= '1';
  EditPosicaoPremio.Text:= '1';
end;

procedure TFormCadastroDeTorneios.AtualizarLista;
begin
  DataModuleGeral.FDQueryTorneios.Close;
  DataModuleGeral.FDQueryTorneios.Open;
end;

procedure TFormCadastroDeTorneios.CheckBoxAddOnClick(Sender: TObject);
begin
//  LabelAddOn.Visible:= CheckBoxAddOn.Checked;
  EditAddOnValor.Enabled:= CheckBoxAddOn.Checked;
//  LabelAddOnQuantidade.Visible:= CheckBoxAddOn.Checked;
  EditAddOnQuantidade.Enabled:= CheckBoxAddOn.Checked;
  if (CheckBoxAddOn.Checked = False) then
  begin
    EditAddOnValor.Color:= clInactiveCaption;
    EditAddOnQuantidade.Color:= clInactiveCaption;
  end
  else
  begin
    EditAddOnValor.Color:= clWindow;
    EditAddOnQuantidade.Color:= clWindow;
  end;
end;

procedure TFormCadastroDeTorneios.CheckBoxAddOnKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
  Begin
    SelectNext(Sender as tWinControl, True, True );
    Key := #0;
  end;
end;

procedure TFormCadastroDeTorneios.CheckBoxHoraInicioClick(Sender: TObject);
begin
  DateTimePickerHoraInicio.Visible:= CheckBoxHoraInicio.Checked;
end;

procedure TFormCadastroDeTorneios.CheckBoxHoraInicioKeyPress(
  Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    SelectNext(Sender as tWinControl, True, True );
    Key := #0;
  end;
end;

procedure TFormCadastroDeTorneios.CheckBoxJogadoresClick(Sender: TObject);
begin
  TabSheetJogadores.TabVisible:= CheckBoxJogadores.Checked;
end;

procedure TFormCadastroDeTorneios.CheckBoxJogadoresKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
  Begin
    SelectNext(Sender as tWinControl, True, True );
    Key := #0;
  end;
end;

procedure TFormCadastroDeTorneios.CheckBoxPontuacaoClick(Sender: TObject);
begin
  TabSheetPontuacao.TabVisible:= CheckBoxPontuacao.Checked;
end;

procedure TFormCadastroDeTorneios.CheckBoxPontuacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
  Begin
    SelectNext(Sender as tWinControl, True, True );
    Key := #0;
  end;
end;

procedure TFormCadastroDeTorneios.CheckBoxPremiacaoClick(Sender: TObject);
begin
  TabSheetPremiacao.TabVisible:= CheckBoxPremiacao.Checked;
end;

procedure TFormCadastroDeTorneios.CheckBoxPremiacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
  Begin
    SelectNext(Sender as tWinControl, True, True );
    Key := #0;
  end;
end;

procedure TFormCadastroDeTorneios.CheckBoxRe_BuyClick(Sender: TObject);
begin
//  LabelReBuy.Visible:= CheckBoxRe_Buy.Checked;
  EditReBuyValor.Enabled:= CheckBoxRe_Buy.Checked;
//  LabelReBuyQuantidade.Visible:= CheckBoxRe_Buy.Checked;
  EditReBuyQuantidade.Enabled:= CheckBoxRe_Buy.Checked;
  RadioGroupLimiteRe_Buy.Enabled:= CheckBoxRe_Buy.Checked;
//  LabelReBuyLimite.Visible:= CheckBoxRe_Buy.Checked;
  EditReBuyLimite.Enabled:= CheckBoxRe_Buy.Checked;
  if (CheckBoxRe_Buy.Checked = False) then
  begin
    EditReBuyValor.Color:= clInactiveCaption;
    EditReBuyQuantidade.Color:= clInactiveCaption;
    EditReBuyLimite.Color:= clInactiveCaption;
  end
  else
  begin
    EditReBuyValor.Color:= clWindow;
    EditReBuyQuantidade.Color:= clWindow;
    EditReBuyLimite.Color:= clWindow;
  end;
end;

procedure TFormCadastroDeTorneios.CheckBoxRe_BuyKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
  Begin
    SelectNext(Sender as tWinControl, True, True );
    Key := #0;
  end;
end;

procedure TFormCadastroDeTorneios.DateTimePickerBreakKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
  Begin
    SelectNext(Sender as tWinControl, True, True );
    Key := #0;
  end;
end;

procedure TFormCadastroDeTorneios.DateTimePickerTempoKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
  Begin
    SelectNext(Sender as tWinControl, True, True );
    Key := #0;
  end;
end;

procedure TFormCadastroDeTorneios.DBGridListagemJogadoresCellClick(
  Column: TColumn);
begin
  CodigoTorneio:= DBGridListagemJogadores.Fields[0].AsInteger;
end;

procedure TFormCadastroDeTorneios.EditAddOnQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
  Begin
    SelectNext(Sender as tWinControl, True, True );
    Key := #0;
  end;
end;

procedure TFormCadastroDeTorneios.EditAddOnValorExit(Sender: TObject);
begin
  RecebeValo:= StrToFloat(StringReplace(EditAddOnValor.Text,'R$ ','',[rfReplaceAll,rfIgnoreCase]));
  EditAddOnValor.Text:= FloatToStrF(RecebeValo,ffCurrency,12,2);
end;

procedure TFormCadastroDeTorneios.EditAddOnValorKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
  Begin
    SelectNext(Sender as tWinControl, True, True );
    Key := #0;
  end;
end;

procedure TFormCadastroDeTorneios.EditAnteKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
  Begin
    SelectNext(Sender as tWinControl, True, True );
    Key := #0;
  end;
end;

procedure TFormCadastroDeTorneios.EditBigBlindKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
  Begin
    SelectNext(Sender as tWinControl, True, True );
    Key := #0;
  end;
end;

procedure TFormCadastroDeTorneios.EditBuyInQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
  Begin
    SelectNext(Sender as tWinControl, True, True );
    Key := #0;
  end;
end;

procedure TFormCadastroDeTorneios.EditBuyInValorExit(Sender: TObject);
begin
  RecebeValo:= StrToFloat(StringReplace(EditBuyInValor.Text,'R$ ','',[rfReplaceAll,rfIgnoreCase]));
  EditBuyInValor.Text:= FloatToStrF(RecebeValo,ffCurrency,12,2);
end;

procedure TFormCadastroDeTorneios.EditBuyInValorKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
  Begin
    SelectNext(Sender as tWinControl, True, True );
    Key := #0;
  end;
end;

procedure TFormCadastroDeTorneios.EditJogadoresQuantidadeKeyPress(
  Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    SelectNext(Sender as tWinControl, True, True );
    Key := #0;
  end;
end;

procedure TFormCadastroDeTorneios.EditNomeTorneioKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
  Begin
    SelectNext(Sender as tWinControl, True, True );
    Key := #0;
  end;
end;

procedure TFormCadastroDeTorneios.EditPontoRetiradaKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
  Begin
    SelectNext(Sender as tWinControl, True, True );
    Key := #0;
  end;
end;

procedure TFormCadastroDeTorneios.EditPontosPresencaKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
  Begin
    SelectNext(Sender as tWinControl, True, True );
    Key := #0;
  end;
end;

procedure TFormCadastroDeTorneios.EditPontosRetiradaDuplaKeyPress(
  Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    SelectNext(Sender as tWinControl, True, True );
    Key := #0;
  end;
end;

procedure TFormCadastroDeTorneios.EditPontosRetiradaMultiplaKeyPress(
  Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    SelectNext(Sender as tWinControl, True, True );
    Key := #0;
  end;
end;

procedure TFormCadastroDeTorneios.EditReBuyLimiteKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
  Begin
    SelectNext(Sender as tWinControl, True, True );
    Key := #0;
  end;
end;

procedure TFormCadastroDeTorneios.EditReBuyQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
  Begin
    SelectNext(Sender as tWinControl, True, True );
    Key := #0;
  end;
end;

procedure TFormCadastroDeTorneios.EditReBuyValorExit(Sender: TObject);
begin
  RecebeValo:= StrToFloat(StringReplace(EditReBuyValor.Text,'R$ ','',[rfReplaceAll,rfIgnoreCase]));
  EditReBuyValor.Text:= FloatToStrF(RecebeValo,ffCurrency,12,2);
end;

procedure TFormCadastroDeTorneios.EditReBuyValorKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
  Begin
    SelectNext(Sender as tWinControl, True, True );
    Key := #0;
  end;
end;

procedure TFormCadastroDeTorneios.EditSmallBlindKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
  Begin
    SelectNext(Sender as tWinControl, True, True );
    Key := #0;
  end;
end;

procedure TFormCadastroDeTorneios.EscoderListagem;
begin
  TabSheetCadastroTorneios.TabVisible:= True;
  TabSheetListagemTorneios.TabVisible:= False;
end;

procedure TFormCadastroDeTorneios.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((key = vk_f2) and (IndexAbaAtiva = 1)) then
  begin
    SpeedButtonAdicionarBlindsClick(Self);
  end
  else
  if ((Key = vk_f2) and (IndexAbaAtiva = 2)) then
  begin
    SpeedButtonAdicionarJogadoresClick(Self);
  end
  else
  if ((Key = vk_f2) and (IndexAbaAtiva = 3)) then
  begin
    SpeedButtonAdicionarPontosClick(Self);
  end
  else
  if ((Key = vk_f2) and (IndexAbaAtiva = 4)) then
  begin
    SpeedButtonAdicionarPremioClick(Self);
  end;
end;

procedure TFormCadastroDeTorneios.FormShow(Sender: TObject);
begin
  MontarListaJogadores;
  MostrarListagem;
  AtualizarLista;
  CodigoTorneio:= -1;
end;

procedure TFormCadastroDeTorneios.LimparCamposBlinds;
begin
  EditSmallBlind.Text:= '0';
  EditBigBlind.Text:= '0';
  EditAnte.Text:= '0';
  DateTimePickerTempo.Time:= StrToTime('00:00:00');
  DateTimePickerBreak.Time:= StrToTime('00:00:00');
end;

procedure TFormCadastroDeTorneios.LimparCamposGeral;
begin
  EditCodigoTorneio.Text          := '0';
  EditNomeTorneio.Text            := '';
  EditBuyInValor.Text             := '0';
  EditBuyInQuantidade.Text        := '0';
  EditReBuyValor.Text             := '0';
  EditReBuyQuantidade.Text        := '0';
  EditReBuyLimite.Text            := '0';
  EditAddOnValor.Text             := '0';
  EditAddOnQuantidade.Text        := '0';
  EditJogadoresQuantidade.Text    := '0';
  RadioGroupLimiteRe_Buy.ItemIndex:= 0;
  DateTimePickerHoraInicio.Time:= StrToTime('00:00:00');
  EditCaminhoPastaSom.Text:= '';
end;

procedure TFormCadastroDeTorneios.LimparCamposPontos;
begin
  EditPontos.Text:= '0';
  EditPosicaoPontuacao.Text:= '1';
  EditPontoRetirada.Text:= '0';
  EditPontosPresenca.Text:= '0';
  EditPontosRetiradaDupla.Text:='0';
  EditPontosRetiradaMultipla.Text:='0';
end;

procedure TFormCadastroDeTorneios.LimparCamposPremio;
begin
  EditPosicaoPremio.Text:= '1';
  EditValorPremio.Text:= '';
  RadioGroupTipoPremio.ItemIndex:= 0;
end;

procedure TFormCadastroDeTorneios.LimparCamposRelatorio;
begin
  CheckBoxRelatorioMensalidade.Checked:= false;
  CheckBoxRelatorioJogoDia.Checked:= false;
  CheckBoxRelatorioPremiacao.Checked:= false;
  CheckBoxRelatorioPontuacaoGeral.Checked:= false;
  CheckBoxRelatorioCalendario.Checked:= false;
end;

procedure TFormCadastroDeTorneios.MontarListaJogadores;
var
  Item: TListItem;
begin
  ListViewJogadores.Clear;
  DataModuleGeral.FDQueryJogadores.Close;
  DataModuleGeral.FDQueryJogadores.Open;
  if (  DataModuleGeral.FDQueryJogadores.RecordCount > 0) then
  begin
    while not DataModuleGeral.FDQueryJogadores.Eof do
    begin
      Item:= ListViewJogadores.Items.Add;
      Item.Caption:= IntToStr(DataModuleGeral.FDQueryJogadores.FieldByName('CODIGO').AsInteger);
      Item.SubItems.Add(DataModuleGeral.FDQueryJogadores.FieldByName('NOME').AsString);
      DataModuleGeral.FDQueryJogadores.Next;
    end;
  end;
end;

procedure TFormCadastroDeTorneios.MontarListaJogadoresTorneio(Codigo: Integer;
  Nome: String);
var
  Item: TListItem;
  I:Integer;
begin
  for I:= 0 to (ListViewJogadoresTorneio.Items.Count-1) do
  begin
    if (ListViewJogadoresTorneio.Items[I].Caption = IntToStr(Codigo)) then
    begin
      Exit;
    end;
  end;
  Item:= ListViewJogadoresTorneio.Items.Add;
  Item.Caption:= IntToStr(Codigo);
  Item.SubItems.Add(Nome);
end;

procedure TFormCadastroDeTorneios.MontaTitulos;
var
  i:Integer;
begin
  for i:= 1 to StringGridListagemBlind.RowCount-1 do
    StringGridListagemBlind.Rows[i].Clear;
  StringGridListagemBlind.RowCount := 2;

  with StringGridListagemBlind do
  begin
    ColWidths[0]:=30;
    Cols[0].Text:= 'Nível';
    ColWidths[1]:=50;
    Cols[1].Text:= 'Small';
    ColWidths[2]:=50;
    Cols[2].Text:= 'Big';
    ColWidths[3]:=50;
    Cols[3].Text:= 'Ante';
    ColWidths[4]:=80;
    Cols[4].Text:= 'Tempo';
    ColWidths[5]:=80;
    Cols[5].Text:= 'Break';
  end;

  for i:= 1 to StringGridPontuacao.RowCount-1 do
    StringGridPontuacao.Rows[i].Clear;
  StringGridPontuacao.RowCount := 2;

  with StringGridPontuacao do
  begin
    ColWidths[0]:=50;
    Cols[0].Text:= 'Posição';
    ColWidths[1]:=50;
    Cols[1].Text:= 'Pontos';
  end;

  for i:= 1 to StringGridListagemPremio.RowCount-1 do
    StringGridListagemPremio.Rows[i].Clear;
  StringGridListagemPremio.RowCount := 2;

  with StringGridListagemPremio do
  begin
    ColWidths[0]:=50;
    Cols[0].Text:= 'Posição';
    ColWidths[1]:=80;
    Cols[1].Text:= 'Valor Prêmio';
  end;
end;

procedure TFormCadastroDeTorneios.MostrarListagem;
begin
  TabSheetCadastroTorneios.TabVisible:= False;
  TabSheetListagemTorneios.TabVisible:= True;
end;

procedure TFormCadastroDeTorneios.PageControlInformacoesTorneioChange(
  Sender: TObject);
begin
  if (PageControlInformacoesTorneio.TabIndex = 1) then
  begin
    EditSmallBlind.SetFocus;
  end;
  IndexAbaAtiva:= PageControlInformacoesTorneio.TabIndex;
end;

procedure TFormCadastroDeTorneios.PegaDados;
var
  I:Integer;
begin
  MontaTitulos;
  with TFDQuery.Create(Self) do
  try
    Connection:= FormMenuPrincipal.FDConnection;
    Transaction:= FormMenuPrincipal.FDTransaction;
    Close;
    SQL.Clear;
    SQL.Add('Select * from TORNEIOS where CODIGO = :CODIGO');
    ParamByName('CODIGO').AsInteger:= CodigoTorneio;
    Open;
    if (RecordCount > 0) then
    begin
      EditCodigoTorneio.Text:= IntToStr(FieldByName('CODIGO').AsInteger);
      EditNomeTorneio.Text:= FieldByName('NOME').AsString;
      EditBuyInValor.Text:= FloatToStrF(FieldByName('BUY_IN_VALOR').AsFloat,ffCurrency,12,2);
      EditBuyInQuantidade.Text:= IntToStr(FieldByName('BUY_IN_QUANTIDADE').AsInteger);
      if (FieldByName('RE_BUY').AsString = 'S') then
      begin
        CheckBoxRe_Buy.Checked:= True;
      end
      else
      begin
        CheckBoxRe_Buy.Checked:= False;
      end;
      EditReBuyValor.Text:= FloatToStrF(FieldByName('RE_BUY_VALOR').AsFloat,ffCurrency,12,2);
      EditReBuyQuantidade.Text:= IntToStr(FieldByName('RE_BUY_QUANTIDADE').AsInteger);
      if (FieldByName('RE_BUY_LIMITE_TIPO').AsString = 'J') then
      begin
        RadioGroupLimiteRe_Buy.ItemIndex:= 0;
      end
      else
      begin
        RadioGroupLimiteRe_Buy.ItemIndex:= 1;
      end;
      EditReBuyLimite.Text:= IntToStr(FieldByName('RE_BUY_LIMITE').AsInteger);
      if (FieldByName('ADD_ON').AsString = 'S') then
      begin
        CheckBoxAddOn.Checked:= True;
      end
      else
      begin
        CheckBoxAddOn.Checked:= False;
      end;
      EditAddOnValor.Text:= FloatToStrF(FieldByName('ADD_ON_VALOR').AsFloat,ffCurrency,12,2);
      EditAddOnQuantidade.Text:= IntToStr(FieldByName('ADD_ON_QUANTIDADE').AsInteger);
      EditJogadoresQuantidade.Text:= IntToStr(FieldByName('JOGADORES_QUANTIDADE').AsInteger);
      if (FieldByName('PONTUACAO').AsString = 'S') then
      begin
        CheckBoxPontuacao.Checked:= True;
      end
      else
      begin
        CheckBoxPontuacao.Checked:= False;
      end;
      EditPontoRetirada.Text:= FloatToStrF(FieldByName('PONTUACAO_RETIRADA_JOGADOR').AsFloat,ffNumber,12,2);
      EditPontosPresenca.Text:= FloatToStrF(FieldByName('PONTUACAO_PRESENCA').AsFloat,ffNumber,12,2);
      EditPontosRetiradaDupla.Text:= FloatToStrF(FieldByName('PONTUACAO_RETIRADA_DUPLA').AsFloat,ffNumber,12,2);
      EditPontosRetiradaMultipla.Text:= FloatToStrF(FieldByName('PONTUACAO_RETIRADA_MULTIPLA').AsFloat,ffNumber,12,2);
      if (FieldByName('PREMIACAO').AsString = 'S') then
      begin
        CheckBoxPremiacao.Checked:= True;
      end
      else
      begin
        CheckBoxPremiacao.Checked:= False;
      end;
      if (FieldByName('JOGADORES').AsString = 'S') then
      begin
        CheckBoxJogadores.Checked:= True;
      end
      else
      begin
        CheckBoxJogadores.Checked:= False;
      end;
      if (FieldByName('POSSUI_HORA_INICIO').AsString = 'S') then
      begin
        DateTimePickerHoraInicio.Time:= FieldByName('HORA_INICIO').AsDateTime;
        CheckBoxHoraInicio.Checked:= True;
      end
      else
      begin
        DateTimePickerHoraInicio.Time:= StrToTime('00:00:00');
        CheckBoxHoraInicio.Checked:= false;
      end;
      EditCaminhoPastaSom.Text:= FieldByName('CAMINHO_PASTA_SOM').AsString;
    end;
  finally
    free;
  end;
  {Pega Dados Blinds}
  with TFDQuery.Create(Self) do
  try
    Connection:= FormMenuPrincipal.FDConnection;
    Transaction:= FormMenuPrincipal.FDTransaction;
    Close;
    SQL.Clear;
    SQL.Add('Select * from TORNEIOS_BLIND where CODIGO_TORNEIO = :CODIGO_TORNEIO');
    SQL.Add('Order By NIVEL');
    ParamByName('CODIGO_TORNEIO').AsInteger:= CodigoTorneio;
    Open;
    if (RecordCount > 0) then
    begin
      I:= 1;
      with StringGridListagemBlind do
      begin
        while not eof do
        begin
          EditNivel.Text:= '';
          EditNivel.Text:= IntToStr(FieldByName('NIVEL').AsInteger);
          Cells[0,I]:= IntToStr(FieldByName('NIVEL').AsInteger);
          Cells[1,I]:= IntToStr(FieldByName('SMALL_BLIND').AsInteger);
          Cells[2,I]:= IntToStr(FieldByName('BIG_BLIND').AsInteger);
          Cells[3,I]:= IntToStr(FieldByName('ANTE').AsInteger);
          Cells[4,I]:= TimeToStr(FieldByName('TEMPO_NIVEL').AsDateTime);
          Cells[5,I]:= TimeToStr(FieldByName('TEMPO_BREAK').AsDateTime);
          if Cells[0,RowCount-1] <> '' then
            RowCount := RowCount + 1;
          next;
          Inc(I);
        end;
      end;
    end;
  finally
    free;
  end;
  {Pega Dados Jogadores}
  with TFDQuery.Create(Self) do
  try
    Connection:= FormMenuPrincipal.FDConnection;
    Transaction:= FormMenuPrincipal.FDTransaction;
    Close;
    SQL.Clear;
    SQL.Add('Select * from V_TORNEIOS_JOGADORES where CODIGO_TORNEIO = :CODIGO_TORNEIO');
    SQL.Add('order by CODIGO_JOGADORE');
    ParamByName('CODIGO_TORNEIO').AsInteger:= CodigoTorneio;
    Open;
    if (RecordCount > 0) then
    begin
      ListViewJogadoresTorneio.Clear;
      while not eof do
      begin
        MontarListaJogadoresTorneio(FieldByName('CODIGO_JOGADORE').AsInteger,FieldByName('NOME').AsString);
        next;
      end;
    end;
  finally
    free;
  end;
  {Pega Dados Pontuação}
  with TFDQuery.Create(Self) do
  try
    Connection:= FormMenuPrincipal.FDConnection;
    Transaction:= FormMenuPrincipal.FDTransaction;
    Close;
    SQL.Clear;
    SQL.Add('Select * from TORNEIOS_PONTUACAO where CODIGO_TORNEIO = :CODIGO_TORNEIO');
    SQL.Add('Order By POSICAO');
    ParamByName('CODIGO_TORNEIO').AsInteger:= CodigoTorneio;
    Open;
    if (RecordCount > 0) then
    begin
      I:= 1;
      with StringGridPontuacao do
      begin
        while not eof do
        begin
          EditPosicaoPontuacao.Text:= '';
          EditPosicaoPontuacao.Text:= IntToStr(FieldByName('POSICAO').AsInteger);
          Cells[0,I]:= IntToStr(FieldByName('POSICAO').AsInteger);
          Cells[1,I]:= FloatToStrF(FieldByName('PONTOS').AsFloat,ffNumber,12,2);
          if Cells[0,RowCount-1] <> '' then
            RowCount := RowCount + 1;
          next;
          Inc(I);
        end;
      end;
    end;
  finally
    Free;
  end;
  {Pega Dados Premiação}
  with TFDQuery.Create(Self) do
  try
    Connection:= FormMenuPrincipal.FDConnection;
    Transaction:= FormMenuPrincipal.FDTransaction;
    Close;
    SQL.Clear;
    SQL.Add('Select * from TORNEIOS_PREMIACAO where CODIGO_TORNEIO = :CODIGO_TORNEIO');
    SQL.Add('Order By POSICAO');
    ParamByName('CODIGO_TORNEIO').AsInteger:= CodigoTorneio;
    Open;
    if (RecordCount > 0) then
    begin
      I:= 1;
      with StringGridListagemPremio do
      begin
        while not eof do
        begin
          EditPosicaoPremio.Text:= '';
          EditPosicaoPremio.Text:= IntToStr(FieldByName('POSICAO').AsInteger);
          Cells[0,I]:= IntToStr(FieldByName('POSICAO').AsInteger);
          Cells[1,I]:= FloatToStrF(FieldByName('VALOR_PREMIO').AsFloat,ffNumber,12,2);
          if Cells[0,RowCount-1] <> '' then
            RowCount := RowCount + 1;
          next;
          Inc(I);
        end;
      end;
    end;
  finally
    Free;
  end;
  {Pega dados Relatorio}
  with TFDQuery.Create(Self) do
  try
    Connection:= FormMenuPrincipal.FDConnection;
    Transaction:= FormMenuPrincipal.FDTransaction;
    Close;
    SQL.Clear;
    SQL.Add('Select * from TORNEIOS_RELATORIOS where CODIGO_TORNEIO = :CODIGO_TORNEIO');
    ParamByName('CODIGO_TORNEIO').AsInteger:= CodigoTorneio;
    Open;
    if (RecordCount > 0) then
    begin
      if (FieldByName('MENSALIDADE').AsInteger = 1) then
      begin
        CheckBoxRelatorioMensalidade.Checked:=  true;
      end
      else
      begin
        CheckBoxRelatorioMensalidade.Checked:=  false;
      end;
      if (FieldByName('JOGO_DIA').AsInteger = 1) then
      begin
        CheckBoxRelatorioJogoDia.Checked:= true;
      end
      else
      begin
        CheckBoxRelatorioJogoDia.Checked:= false;
      end;
      if (FieldByName('PREMIACAO').AsInteger = 1) then
      begin
        CheckBoxRelatorioPremiacao.Checked:= true;
      end
      else
      begin
        CheckBoxRelatorioPremiacao.Checked:= false;
      end;
      if (FieldByName('PONTUACAO_GERAL').AsInteger = 1) then
      begin
        CheckBoxRelatorioPontuacaoGeral.Checked:= true;
      end
      else
      begin
        CheckBoxRelatorioPontuacaoGeral.Checked:= false;
      end;
      if (FieldByName('CALENDARIO').AsInteger = 1) then
      begin
        CheckBoxRelatorioCalendario.Checked:= true;
      end
      else
      begin
        CheckBoxRelatorioCalendario.Checked:= false;
      end;
    end;
  finally
    free;
  end;
end;

procedure TFormCadastroDeTorneios.SpeedButton1Click(Sender: TObject);
begin
  with StringGridListagemBlind do
  begin
    EditNivel.Text           := Cells[0, StringGridListagemBlind.Row];
    EditSmallBlind.Text      := Cells[1, StringGridListagemBlind.Row];
    EditBigBlind.Text        := Cells[2, StringGridListagemBlind.Row];
    EditAnte.Text            := Cells[3, StringGridListagemBlind.Row];
    DateTimePickerTempo.Time := StrToTime(Cells[4, StringGridListagemBlind.Row]);
    DateTimePickerBreak.Time := StrToTime(Cells[5, StringGridListagemBlind.Row]);
  end;
end;

procedure TFormCadastroDeTorneios.SpeedButton2Click(Sender: TObject);
var
  I:Integer;
begin
  LimparCamposBlinds;
  if Application.MessageBox('Tem certeza que deseja excluir o item selecionado?', 'Exclusão de Blinds', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = IDYES then
  begin
    with StringGridListagemBlind do
    begin
      for I:= Row to (RowCount-1) do
      begin
        Cells[0,I]  := Cells[0, I+1];
        Cells[1,I]  := Cells[1, I+1];
        Cells[2,I]  := Cells[2, I+1];
        Cells[3,I]  := Cells[3, I+1];
        Cells[4,I]  := Cells[4, I+1];
        Cells[5,I]  := Cells[5, I+1];
        Cells[6,I]  := Cells[6, I+1];
      end;
      if (RowCount >= 2) and (Cells[0,1] <> '') then
        RowCount:= RowCount - 1;
      {Arrumar o nível}
      I:=1;
      while (Cells[0,I] <> '') do
      begin
        Cells[0,I]:= IntToStr(I);
        Inc(I);
      end;
      EditNivel.Text:= IntToStr(I);
    end;
  end;
  EditSmallBlind.SetFocus;
end;

procedure TFormCadastroDeTorneios.SpeedButtonAdicionarBlindsClick(
  Sender: TObject);
var
  I, Nivel:Integer;
  Inserir: Boolean;
begin
  I:= 1;
  Nivel:= 1;
  Inserir:= True;
  with StringGridListagemBlind do
  begin
    while I <= RowCount -1 do
    begin
      if (Cells[0,i] = '') and (Inserir)  then
      begin
        Cells[0,I] := EditNivel.Text;
        Cells[1,i] := EditSmallBlind.Text;
        Cells[2,i] := EditBigBlind.Text;
        Cells[3,i] := EditAnte.Text;
        Cells[4,i] := TimeToStr(DateTimePickerTempo.Time);
        Cells[5,i] := TimeToStr(DateTimePickerBreak.Time);
        I := RowCount;
        Inserir:= False;
      end
      else
      begin
        if (Cells[0,i] = EditNivel.Text) and (Inserir) then
        begin
        Cells[0,I] := EditNivel.Text;
        Cells[1,i] := EditSmallBlind.Text;
        Cells[2,i] := EditBigBlind.Text;
        Cells[3,i] := EditAnte.Text;
        Cells[4,i] := TimeToStr(DateTimePickerTempo.Time);
        Cells[5,i] := TimeToStr(DateTimePickerBreak.Time);
        Inserir:= False;
        Dec(Nivel);
        end;
      end;

      if Cells[0,RowCount-1] <> '' then
        RowCount := RowCount + 1;
      inc(i);
      Inc(Nivel);
    end;
    Row := RowCount-1;
  end;
  LimparCamposBlinds;
  EditNivel.Text:= IntToStr(Nivel);
  EditSmallBlind.SetFocus;
end;

procedure TFormCadastroDeTorneios.SpeedButtonAdicionarJogadoresClick(
  Sender: TObject);
var
  I, CodigoJogador: Integer;
  NomeJogador: String;
begin
  for I:= 0 to (ListViewJogadores.Items.Count-1) do
  begin
    if ListViewJogadores.Items[I].Checked then
    begin
      CodigoJogador:= StrToInt(ListViewJogadores.Items[I].Caption);
      NomeJogador:= ListViewJogadores.Items[I].SubItems[0];
      MontarListaJogadoresTorneio(CodigoJogador, NomeJogador);
    end;
  end;
end;

procedure TFormCadastroDeTorneios.SpeedButtonAdicionarPontosClick(
  Sender: TObject);
var
  I, Posicao: Integer;
  Inserir: Boolean;
begin
  I:= 1;
  Posicao:= 1;
  Inserir:= True;
  with StringGridPontuacao do
  begin
    while I <= RowCount -1 do
    begin
      if (Cells[0,i] = '') and (Inserir)  then
      begin
        Cells[0,I] := EditPosicaoPontuacao.Text;
        Cells[1,i] := EditPontos.Text;
        I := RowCount;
        Inserir:= False;
      end
      else
      begin
        if (Cells[0,i] = EditPosicaoPontuacao.Text) and (Inserir) then
        begin
        Cells[0,I] := EditPosicaoPontuacao.Text;
        Cells[1,i] := EditPontos.Text;
        Inserir:= False;
        Dec(Posicao);
        end;
      end;
      if Cells[0,RowCount-1] <> '' then
        RowCount := RowCount + 1;
      inc(i);
      Inc(Posicao);
    end;
    Row := RowCount-1;
  end;
  EditPontos.Text:= '';
  EditPosicaoPontuacao.Text:= IntToStr(Posicao);
  EditPontos.SetFocus;
end;

procedure TFormCadastroDeTorneios.SpeedButtonAdicionarPremioClick(
  Sender: TObject);
var
  I, Posicao: Integer;
  Inserir: Boolean;
begin
  I:= 1;
  Posicao:= 1;
  Inserir:= True;
  with StringGridListagemPremio do
  begin
    while I <= RowCount -1 do
    begin
      if (Cells[0,i] = '') and (Inserir)  then
      begin
        Cells[0,I] := EditPosicaoPremio.Text;
        Cells[1,i] := EditValorPremio.Text;
        I := RowCount;
        Inserir:= False;
      end
      else
      begin
        if (Cells[0,i] = EditPosicaoPremio.Text) and (Inserir) then
        begin
        Cells[0,I] := EditPosicaoPremio.Text;
        Cells[1,i] := EditValorPremio.Text;
        Inserir:= False;
        Dec(Posicao);
        end;
      end;
      if Cells[0,RowCount-1] <> '' then
        RowCount := RowCount + 1;
      inc(i);
      Inc(Posicao);
    end;
    Row := RowCount-1;
  end;
  EditValorPremio.Text:= '';
  EditPosicaoPremio.Text:= IntToStr(Posicao);
  EditValorPremio.SetFocus;
end;

procedure TFormCadastroDeTorneios.SpeedButtonCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFormCadastroDeTorneios.SpeedButtonDesmarcarTodosAdicionarClick(
  Sender: TObject);
var
  I:Integer;
begin
  for I:= 0 to (ListViewJogadores.Items.Count-1) do
    ListViewJogadores.Items[I].Checked:= False;
end;

procedure TFormCadastroDeTorneios.SpeedButtonDesmarcarTodosDeletarClick(
  Sender: TObject);
var
  I:Integer;
begin
  for I:= 0 to (ListViewJogadoresTorneio.Items.Count-1) do
    ListViewJogadoresTorneio.Items[I].Checked:= False;
end;

procedure TFormCadastroDeTorneios.SpeedButtonEditarClick(Sender: TObject);
begin
  MontaTitulos;
  LimparCamposGeral;
  LimparCamposBlinds;
  LimparCamposPontos;
  LimparCamposPremio;
  LimparCamposRelatorio;
  AjustaNumeracao;
  PegaDados;
  if (CodigoTorneio <> -1) then
  begin
    CheckBoxRe_BuyClick(Self);
    CheckBoxAddOnClick(Self);
    CheckBoxPontuacaoClick(Self);
    CheckBoxJogadoresClick(Self);
    CheckBoxPremiacaoClick(Self);
    EscoderListagem;
    PageControlInformacoesTorneio.TabIndex:= 0;
    EditNomeTorneio.SetFocus;
  end
  else
  begin
    ShowMessage('Você deve selecionar um torneio para editar!');
  end;

end;

procedure TFormCadastroDeTorneios.SpeedButtonEditarPontosClick(Sender: TObject);
begin
  with StringGridPontuacao do
  begin
    EditPosicaoPontuacao.Text := Cells[0, StringGridPontuacao.Row];
    EditPontos.Text           := Cells[1, StringGridPontuacao.Row];
  end;
  EditPontos.SetFocus;
end;

procedure TFormCadastroDeTorneios.SpeedButtonEditarPremioClick(Sender: TObject);
begin
  with StringGridListagemPremio do
  begin
    EditPosicaoPremio.Text := Cells[0, StringGridListagemPremio.Row];
    EditValorPremio.Text   := Cells[1, StringGridListagemPremio.Row];
  end;
  EditPontos.SetFocus;
end;

procedure TFormCadastroDeTorneios.SpeedButtonExcluirJogadorClick(
  Sender: TObject);
begin
  if Application.MessageBox('Tem certeza que deseja excluir o jogador selecionado?', 'Exclusão de Jogador do Torneio', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = IDYES then
  begin
    ListViewJogadoresTorneio.DeleteSelected;
  end;
end;

procedure TFormCadastroDeTorneios.SpeedButtonExcluirPontosClick(
  Sender: TObject);
var
  I: Integer;
begin
  if Application.MessageBox('Tem certeza que deseja excluir o item selecionado?', 'Exclusão de Pontos', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = IDYES then
  begin
    with StringGridPontuacao do
    begin
      for I:= Row to (RowCount-1) do
      begin
        Cells[0,I]  := Cells[0, I+1];
        Cells[1,I]  := Cells[1, I+1];
      end;
      if (RowCount >= 2) and (Cells[0,1] <> '') then
        RowCount:= RowCount - 1;
      {Arrumar o nível}
      I:=1;
      while (Cells[0,I] <> '') do
      begin
        Cells[0,I]:= IntToStr(I);
        Inc(I);
      end;
      EditPosicaoPontuacao.Text:= IntToStr(I);
    end;
  end;
  EditPontos.SetFocus;
end;

procedure TFormCadastroDeTorneios.SpeedButtonExcluirPremioClick(
  Sender: TObject);
var
  I:Integer;
begin
  if Application.MessageBox('Tem certeza que deseja excluir o item selecionado?', 'Exclusão de Prêmio', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = IDYES then
  begin
    with StringGridListagemPremio do
    begin
      for I:= Row to (RowCount-1) do
      begin
        Cells[0,I]  := Cells[0, I+1];
        Cells[1,I]  := Cells[1, I+1];
      end;
      if (RowCount >= 2) and (Cells[0,1] <> '') then
        RowCount:= RowCount - 1;
      {Arrumar o nível}
      I:=1;
      while (Cells[0,I] <> '') do
      begin
        Cells[0,I]:= IntToStr(I);
        Inc(I);
      end;
      EditPosicaoPremio.Text:= IntToStr(I);
    end;
  end;
  EditValorPremio.SetFocus;
end;

procedure TFormCadastroDeTorneios.SpeedButtonMarcarTodosAdicionarClick(
  Sender: TObject);
var
  I:Integer;
begin
  for I:= 0 to (ListViewJogadores.Items.Count-1) do
    ListViewJogadores.Items[I].Checked:= True;
end;

procedure TFormCadastroDeTorneios.SpeedButtonMarcarTodosDeletarClick(
  Sender: TObject);
var
  I:Integer;
begin
  for I:= 0 to (ListViewJogadoresTorneio.Items.Count-1) do
    ListViewJogadoresTorneio.Items[I].Checked:= True;
end;

procedure TFormCadastroDeTorneios.SpeedButtonNovoClick(Sender: TObject);
begin
  MontaTitulos;
  LimparCamposGeral;
  LimparCamposBlinds;
  LimparCamposPontos;
  LimparCamposPremio;
  CheckBoxRe_BuyClick(Self);
  CheckBoxAddOnClick(Self);
  CheckBoxPontuacaoClick(Self);
  CheckBoxJogadoresClick(Self);
  CheckBoxPremiacaoClick(Self);
  AjustaNumeracao;
  EscoderListagem;
  PageControlInformacoesTorneio.TabIndex:= 0;
  EditNomeTorneio.SetFocus;
  EditBuyInValorExit(Self);
  EditReBuyValorExit(Self);
  EditAddOnValorExit(Self);
  LimparCamposRelatorio;
end;

procedure TFormCadastroDeTorneios.SpeedButtonSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFormCadastroDeTorneios.SpeedButtonSalvarClick(Sender: TObject);
var
  I:Integer;
begin
  if not FormMenuPrincipal.FDTransaction.Active then
    FormMenuPrincipal.FDTransaction.StartTransaction;
  with TFDQuery.Create(Self) do
  Try
    Connection:= FormMenuPrincipal.FDConnection;
    Transaction:= FormMenuPrincipal.FDTransaction;
    Close;
    SQL.Clear;
    SQL.Add('Update or Insert into TORNEIOS (CODIGO, NOME, BUY_IN_VALOR, BUY_IN_QUANTIDADE, RE_BUY, RE_BUY_VALOR,');
    SQL.Add('RE_BUY_QUANTIDADE, RE_BUY_LIMITE_TIPO, RE_BUY_LIMITE, ADD_ON, ADD_ON_VALOR, ADD_ON_QUANTIDADE,');
    SQL.Add('JOGADORES_QUANTIDADE, PONTUACAO, PONTUACAO_RETIRADA_JOGADOR, PONTUACAO_PRESENCA, PREMIACAO, JOGADORES,');
    SQL.Add('PONTUACAO_RETIRADA_DUPLA, PONTUACAO_RETIRADA_MULTIPLA, POSSUI_HORA_INICIO, HORA_INICIO, CAMINHO_PASTA_SOM)');
    SQL.Add(' Values (:CODIGO, :NOME, :BUY_IN_VALOR, :BUY_IN_QUANTIDADE, :RE_BUY, :RE_BUY_VALOR,');
    SQL.Add(':RE_BUY_QUANTIDADE, :RE_BUY_LIMITE_TIPO, :RE_BUY_LIMITE, :ADD_ON, :ADD_ON_VALOR, :ADD_ON_QUANTIDADE,');
    SQL.Add(':JOGADORES_QUANTIDADE, :PONTUACAO, :PONTUACAO_RETIRADA_JOGADOR, :PONTUACAO_PRESENCA, :PREMIACAO, :JOGADORES,');
    SQL.Add(':PONTUACAO_RETIRADA_DUPLA, :PONTUACAO_RETIRADA_MULTIPLA, :POSSUI_HORA_INICIO, :HORA_INICIO, :CAMINHO_PASTA_SOM) returning CODIGO');
    ParamByName('CODIGO').AsInteger:= StrToInt(EditCodigoTorneio.Text);
    ParamByName('NOME').AsString:= EditNomeTorneio.Text;
    ParamByName('BUY_IN_VALOR').AsFloat:= StrToFloat(StringReplace(EditBuyInValor.Text,'R$ ','',[rfReplaceAll,rfIgnoreCase]));
    ParamByName('BUY_IN_QUANTIDADE').AsInteger:= StrToInt(EditBuyInQuantidade.Text);
    if (CheckBoxRe_Buy.Checked) then
    begin
      ParamByName('RE_BUY').AsString:= 'S';
      ParamByName('RE_BUY_VALOR').AsFloat:= StrToFloat(StringReplace(EditReBuyValor.Text,'R$ ','',[rfReplaceAll,rfIgnoreCase]));
      ParamByName('RE_BUY_QUANTIDADE').AsInteger:= StrToInt(EditReBuyQuantidade.Text);
      if (RadioGroupLimiteRe_Buy.ItemIndex = 0) then
      begin
        ParamByName('RE_BUY_LIMITE_TIPO').AsString:= 'J';
      end
      else
      begin
        ParamByName('RE_BUY_LIMITE_TIPO').AsString:= 'N';
      end;
      ParamByName('RE_BUY_LIMITE').AsInteger:= StrToInt(EditReBuyLimite.Text);
    end
    else
    begin
      ParamByName('RE_BUY').AsString:= 'N';
      ParamByName('RE_BUY_VALOR').AsFloat:= 0;
      ParamByName('RE_BUY_QUANTIDADE').AsInteger:= 0;
      ParamByName('RE_BUY_LIMITE_TIPO').AsString:= 'J';
      ParamByName('RE_BUY_LIMITE').AsInteger:= 0;
    end;
    if (CheckBoxAddOn.Checked) then
    begin
      ParamByName('ADD_ON').AsString:= 'S';
      ParamByName('ADD_ON_VALOR').AsFloat:= StrToFloat(StringReplace(EditAddOnValor.Text,'R$ ','',[rfReplaceAll,rfIgnoreCase]));
      ParamByName('ADD_ON_QUANTIDADE').AsInteger:= StrToInt(EditAddOnQuantidade.Text);
    end
    else
    begin
      ParamByName('ADD_ON').AsString:= 'N';
      ParamByName('ADD_ON_VALOR').AsFloat:= 0;
      ParamByName('ADD_ON_QUANTIDADE').AsInteger:= 0;
    end;
    ParamByName('JOGADORES_QUANTIDADE').AsInteger:= StrToInt(EditJogadoresQuantidade.Text);
    if (CheckBoxPontuacao.Checked) then
    begin
      ParamByName('PONTUACAO').AsString:= 'S';
      ParamByName('PONTUACAO_RETIRADA_JOGADOR').AsFloat:= StrToFloat(EditPontoRetirada.Text);
      ParamByName('PONTUACAO_PRESENCA').AsFloat:= StrToFloat(EditPontosPresenca.Text);
      ParamByName('PONTUACAO_RETIRADA_DUPLA').AsFloat:= StrToFloat(EditPontosRetiradaDupla.Text);
      ParamByName('PONTUACAO_RETIRADA_MULTIPLA').AsFloat:= StrToFloat(EditPontosRetiradaMultipla.Text);
    end
    else
    begin
      ParamByName('PONTUACAO').AsString:= 'N';
      ParamByName('PONTUACAO_RETIRADA_JOGADOR').AsFloat:= 0;
      ParamByName('PONTUACAO_PRESENCA').AsFloat:= 0;
    end;
    if (CheckBoxPremiacao.Checked) then
    begin
      ParamByName('PREMIACAO').AsString:= 'S';
    end
    else
    begin
      ParamByName('PREMIACAO').AsString:= 'N';
    end;
    if (CheckBoxJogadores.Checked) then
    begin
      ParamByName('JOGADORES').AsString:= 'S';
    end
    else
    begin
      ParamByName('JOGADORES').AsString:= 'N';
    end;
    if (CheckBoxHoraInicio.Checked) then
    begin
      ParamByName('POSSUI_HORA_INICIO').AsString:= 'S';
      ParamByName('HORA_INICIO').AsTime:= DateTimePickerHoraInicio.Time;
    end
    else
    begin
      ParamByName('POSSUI_HORA_INICIO').AsString:= 'N';
      ParamByName('HORA_INICIO').AsTime:= StrToTime('00:00:00');
    end;
    ParamByName('CAMINHO_PASTA_SOM').AsString:= EditCaminhoPastaSom.Text;
    Open;
    FormMenuPrincipal.FDTransaction.Commit;
    CodigoTorneio:= FieldByName('CODIGO').AsInteger;
  Finally
    Free;
  End;
  {Gravar os Níveis de Blinds}
  if not FormMenuPrincipal.FDTransaction.Active then
    FormMenuPrincipal.FDTransaction.StartTransaction;
  with TFDQuery.Create(Self) do
  Try
    Connection:= FormMenuPrincipal.FDConnection;
    Transaction:= FormMenuPrincipal.FDTransaction;
    Close;
    SQL.Clear;
    SQL.Add('Delete from TORNEIOS_BLIND where CODIGO_TORNEIO = :CODIGO_TORNEIO');
    ParamByName('CODIGO_TORNEIO').AsInteger:= CodigoTorneio;
    ExecSQL;
    FormMenuPrincipal.FDTransaction.Commit;
  Finally
    free;
  End;
  if not FormMenuPrincipal.FDTransaction.Active then
    FormMenuPrincipal.FDTransaction.StartTransaction;
  with TFDQuery.Create(Self) do
  Try
    Connection:= FormMenuPrincipal.FDConnection;
    Transaction:= FormMenuPrincipal.FDTransaction;
    Close;
    SQL.Clear;
    SQL.Add('Update or Insert into TORNEIOS_BLIND (CODIGO_TORNEIO, NIVEL, SMALL_BLIND, BIG_BLIND, ANTE,');
    SQL.Add('TEMPO_NIVEL, TEMPO_BREAK)');
    SQL.Add('Values (:CODIGO_TORNEIO, :NIVEL, :SMALL_BLIND, :BIG_BLIND, :ANTE,');
    SQL.Add(':TEMPO_NIVEL, :TEMPO_BREAK)');
    with StringGridListagemBlind do
    begin
      for i := 1 to RowCount-1 do
      begin
        if cells[0,i] <> '' then
        begin
          ParamByName('CODIGO_TORNEIO').AsInteger:= CodigoTorneio;
          ParamByName('NIVEL').AsInteger:= StrToInt(Cells[0,I]);
          ParamByName('SMALL_BLIND').AsInteger:= StrToInt(Cells[1,I]);
          ParamByName('BIG_BLIND').AsInteger:= StrToInt(Cells[2,I]);
          ParamByName('ANTE').AsInteger:= StrToInt(Cells[3,I]);
          ParamByName('TEMPO_NIVEL').AsTime:= StrToTime(Cells[4,I]);
          ParamByName('TEMPO_BREAK').AsTime:= StrToTime(Cells[5,I]);
          ExecSQL;
        end;
      end;
    end;
    FormMenuPrincipal.FDTransaction.Commit;
  Finally
    Free;
  End;
  {Grava Jogadores}
  if (CheckBoxJogadores.Checked) then
  begin
    if not FormMenuPrincipal.FDTransaction.Active then
      FormMenuPrincipal.FDTransaction.StartTransaction;
    with TFDQuery.Create(Self) do
    Try
      Connection:= FormMenuPrincipal.FDConnection;
      Transaction:= FormMenuPrincipal.FDTransaction;
      Close;
      SQL.Clear;
      SQL.Add('Delete from TORNEIOS_JOGADORES where CODIGO_TORNEIO = :CODIGO_TORNEIO');
      ParamByName('CODIGO_TORNEIO').AsInteger:= CodigoTorneio;
      ExecSQL;
      FormMenuPrincipal.FDTransaction.Commit;
    Finally
      free;
    End;
    if not FormMenuPrincipal.FDTransaction.Active then
      FormMenuPrincipal.FDTransaction.StartTransaction;
    with TFDQuery.Create(Self) do
    Try
      Connection:= FormMenuPrincipal.FDConnection;
      Transaction:= FormMenuPrincipal.FDTransaction;
      Close;
      SQL.Clear;
      SQL.Add('Update or Insert into TORNEIOS_JOGADORES (CODIGO_TORNEIO, CODIGO_JOGADORE)');
      SQL.Add('Values (:CODIGO_TORNEIO, :CODIGO_JOGADORE)');
      for i := 0 to ListViewJogadoresTorneio.Items.Count -1 do
      begin
        ParamByName('CODIGO_TORNEIO').AsInteger:= CodigoTorneio;
        ParamByName('CODIGO_JOGADORE').AsInteger:= StrToInt(ListViewJogadoresTorneio.Items[I].Caption);
        ExecSQL;
      end;
      FormMenuPrincipal.FDTransaction.Commit;
    Finally
      Free;
    End;
  end;
  {Gravar Pontuação}
  if (CheckBoxPontuacao.Checked) then
  begin
    if not FormMenuPrincipal.FDTransaction.Active then
      FormMenuPrincipal.FDTransaction.StartTransaction;
    with TFDQuery.Create(Self) do
    Try
      Connection:= FormMenuPrincipal.FDConnection;
      Transaction:= FormMenuPrincipal.FDTransaction;
      Close;
      SQL.Clear;
      SQL.Add('Delete from TORNEIOS_PONTUACAO where CODIGO_TORNEIO = :CODIGO_TORNEIO');
      ParamByName('CODIGO_TORNEIO').AsInteger:= CodigoTorneio;
      ExecSQL;
      FormMenuPrincipal.FDTransaction.Commit;
    Finally
      free;
    End;
    if not FormMenuPrincipal.FDTransaction.Active then
      FormMenuPrincipal.FDTransaction.StartTransaction;
    with TFDQuery.Create(Self) do
    Try
      Connection:= FormMenuPrincipal.FDConnection;
      Transaction:= FormMenuPrincipal.FDTransaction;
      Close;
      SQL.Clear;
      SQL.Add('Update or Insert into TORNEIOS_PONTUACAO (CODIGO_TORNEIO, POSICAO, PONTOS)');
      SQL.Add('Values (:CODIGO_TORNEIO, :POSICAO, :PONTOS)');
      with StringGridPontuacao do
      begin
        for i := 1 to RowCount-1 do
        begin
          if cells[0,i] <> '' then
          begin
            ParamByName('CODIGO_TORNEIO').AsInteger:= CodigoTorneio;
            ParamByName('POSICAO').AsInteger:= StrToInt(Cells[0,I]);
            ParamByName('PONTOS').AsFloat:= StrToFloat(Cells[1,I]);
            ExecSQL;
          end;
        end;
      end;
      FormMenuPrincipal.FDTransaction.Commit;
    Finally
      Free;
    End;
  end;
  {Gravar Premiação}
  if (CheckBoxPremiacao.Checked) then
  begin
    if not FormMenuPrincipal.FDTransaction.Active then
      FormMenuPrincipal.FDTransaction.StartTransaction;
    with TFDQuery.Create(Self) do
    Try
      Connection:= FormMenuPrincipal.FDConnection;
      Transaction:= FormMenuPrincipal.FDTransaction;
      Close;
      SQL.Clear;
      SQL.Add('Delete from TORNEIOS_PREMIACAO where CODIGO_TORNEIO = :CODIGO_TORNEIO');
      ParamByName('CODIGO_TORNEIO').AsInteger:= CodigoTorneio;
      ExecSQL;
      FormMenuPrincipal.FDTransaction.Commit;
    Finally
      free;
    End;
    if not FormMenuPrincipal.FDTransaction.Active then
      FormMenuPrincipal.FDTransaction.StartTransaction;
    with TFDQuery.Create(Self) do
    Try
      Connection:= FormMenuPrincipal.FDConnection;
      Transaction:= FormMenuPrincipal.FDTransaction;
      Close;
      SQL.Clear;
      SQL.Add('Update or Insert into TORNEIOS_PREMIACAO (CODIGO_TORNEIO, POSICAO, VALOR_PREMIO)');
      SQL.Add('Values (:CODIGO_TORNEIO, :POSICAO, :VALOR_PREMIO)');
      with StringGridListagemPremio do
      begin
        for i := 1 to RowCount-1 do
        begin
          if cells[0,i] <> '' then
          begin
            ParamByName('CODIGO_TORNEIO').AsInteger:= CodigoTorneio;
            ParamByName('POSICAO').AsInteger:= StrToInt(Cells[0,I]);
            ParamByName('VALOR_PREMIO').AsFloat:= StrToFloat(Cells[1,I]);
            ExecSQL;
          end;
        end;
      end;
      FormMenuPrincipal.FDTransaction.Commit;
    Finally
      Free;
    End;
  end;
  {Gravar Relatórios}
  if not FormMenuPrincipal.FDTransaction.Active then
    FormMenuPrincipal.FDTransaction.StartTransaction;
  with TFDQuery.Create(Self) do
  Try
    Connection:= FormMenuPrincipal.FDConnection;
    Transaction:= FormMenuPrincipal.FDTransaction;
    Close;
    SQL.Clear;
    SQL.Add('Update or Insert into TORNEIOS_RELATORIOS (CODIGO_TORNEIO, MENSALIDADE, JOGO_DIA, PREMIACAO, PONTUACAO_GERAL, CALENDARIO)');
    SQL.Add('Values (:CODIGO_TORNEIO, :MENSALIDADE, :JOGO_DIA, :PREMIACAO, :PONTUACAO_GERAL, :CALENDARIO)');
    ParamByName('CODIGO_TORNEIO').AsInteger:= CodigoTorneio;
    ParamByName('MENSALIDADE').AsBoolean:= CheckBoxRelatorioMensalidade.Checked;
    ParamByName('JOGO_DIA').AsBoolean:= CheckBoxRelatorioJogoDia.Checked;
    ParamByName('PREMIACAO').AsBoolean:= CheckBoxRelatorioPremiacao.Checked;
    ParamByName('PONTUACAO_GERAL').AsBoolean:= CheckBoxRelatorioPontuacaoGeral.Checked;
    ParamByName('CALENDARIO').AsBoolean:= CheckBoxRelatorioCalendario.Checked;
    ExecSQL;
    FormMenuPrincipal.FDTransaction.Commit;
  Finally
    Free;
  End;
  LimparCamposGeral;
  LimparCamposBlinds;
  LimparCamposPontos;
  LimparCamposPremio;
  LimparCamposRelatorio;
  AtualizarLista;
  MostrarListagem;
end;

end.
