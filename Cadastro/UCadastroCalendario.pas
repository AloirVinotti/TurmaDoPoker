unit UCadastroCalendario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Grids, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.DBGrids, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFormCalendario = class(TForm)
    PageControlGeralCadastroCalendario: TPageControl;
    TabSheetListagemTorneios: TTabSheet;
    Panel1: TPanel;
    SpeedButtonEditar: TSpeedButton;
    SpeedButtonSair: TSpeedButton;
    DBGridListagemTorneio: TDBGrid;
    TabSheetCadastroCalendario: TTabSheet;
    Panel9: TPanel;
    SpeedButtonEditarData: TSpeedButton;
    SpeedButtonExcluirData: TSpeedButton;
    StringGridCalendario: TStringGrid;
    Panel8: TPanel;
    SpeedButtonAdicionarData: TSpeedButton;
    LabelPontuacaoRetirada: TLabel;
    LabelLocal: TLabel;
    EditLocal: TEdit;
    Panel2: TPanel;
    SpeedButtonSalvar: TSpeedButton;
    SpeedButtonCancelar: TSpeedButton;
    DateTimePickerDataJogo: TDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure SpeedButtonCancelarClick(Sender: TObject);
    procedure SpeedButtonAdicionarDataClick(Sender: TObject);
    procedure SpeedButtonEditarDataClick(Sender: TObject);
    procedure SpeedButtonExcluirDataClick(Sender: TObject);
    procedure DBGridListagemTorneioCellClick(Column: TColumn);
    procedure SpeedButtonEditarClick(Sender: TObject);
    procedure SpeedButtonSairClick(Sender: TObject);
    procedure SpeedButtonSalvarClick(Sender: TObject);
  private
    { Private declarations }
    CodigoTorneio: Integer;
    Procedure MontaTitulos;
    Procedure PegaDados;
  public
    { Public declarations }
  end;

var
  FormCalendario: TFormCalendario;

implementation

{$R *.dfm}

uses UDataModuloGeral, UMenuPrincipal;

procedure TFormCalendario.DBGridListagemTorneioCellClick(Column: TColumn);
begin
  CodigoTorneio:= DBGridListagemTorneio.Fields[0].AsInteger;
end;

procedure TFormCalendario.FormShow(Sender: TObject);
begin
  DataModuleGeral.FDQueryTorneios.Close;
  DataModuleGeral.FDQueryTorneios.Open;
  DateTimePickerDataJogo.Date:= Date;
  PageControlGeralCadastroCalendario.TabIndex:= 0;
  CodigoTorneio:= -1;
end;

procedure TFormCalendario.MontaTitulos;
var
  I:Integer;
begin
  for i:= 1 to StringGridCalendario.RowCount-1 do
    StringGridCalendario.Rows[i].Clear;
  StringGridCalendario.RowCount := 2;

  with StringGridCalendario do
  begin
    ColWidths[0]:=80;
    Cols[0].Text:= 'Data';
    ColWidths[1]:=300;
    Cols[1].Text:= 'Local';
  end;
end;

procedure TFormCalendario.PegaDados;
var
  I: Integer;
begin
  with TFDQuery.Create(Self) do
  try
    Connection:= FormMenuPrincipal.FDConnection;
    Transaction:= FormMenuPrincipal.FDTransaction;
    Close;
    SQL.Clear;
    SQL.Add('Select * from CALENDARIO where TORNEIO = :TORNEIO');
    SQL.Add('Order By DATA_JOGO');
    ParamByName('TORNEIO').AsInteger:= CodigoTorneio;
    Open;
    if (RecordCount > 0) then
    begin
      I:= 1;
      with StringGridCalendario do
      begin
        while not eof do
        begin
          Cells[0,I]:= DateToStr(FieldByName('DATA_JOGO').AsDateTime);
          Cells[1,I]:= FieldByName('LOCAL_JOGO').AsString;
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
  PageControlGeralCadastroCalendario.TabIndex:= 1;
end;

procedure TFormCalendario.SpeedButtonAdicionarDataClick(Sender: TObject);
var
  I:Integer;
  Inserir: Boolean;
begin
  I:= 1;
  Inserir:= True;
  with StringGridCalendario do
  begin
    while I <= RowCount -1 do
    begin
      if (Cells[0,i] = '') and (Inserir)  then
      begin
        Cells[0,I] := DateToStr(DateTimePickerDataJogo.Date);
        Cells[1,i] := EditLocal.Text;
        I := RowCount;
        Inserir:= False;
      end
      else
      begin
        if (Cells[0,i] = DateToStr(DateTimePickerDataJogo.Date)) and (Inserir) then
        begin
          Cells[0,I] := DateToStr(DateTimePickerDataJogo.Date);
          Cells[1,i] := EditLocal.Text;
          Inserir:= False;
        end;
      end;
      if Cells[0,RowCount-1] <> '' then
        RowCount := RowCount + 1;
      inc(i);
    end;
    Row := RowCount-1;
  end;
  EditLocal.Text:= '';
  DateTimePickerDataJogo.SetFocus;
end;

procedure TFormCalendario.SpeedButtonCancelarClick(Sender: TObject);
begin
  PageControlGeralCadastroCalendario.TabIndex:= 0;
end;

procedure TFormCalendario.SpeedButtonEditarClick(Sender: TObject);
begin
  MontaTitulos;
  if (CodigoTorneio <> -1) then
  begin
    PegaDados;
  end
  else
  begin
    ShowMessage('Você deve selecionar um torneio para editar!');
  end;
end;

procedure TFormCalendario.SpeedButtonEditarDataClick(Sender: TObject);
begin
  with StringGridCalendario do
  begin
    DateTimePickerDataJogo.Date := StrToDate(Cells[0, StringGridCalendario.Row]);
    EditLocal.Text           := Cells[1, StringGridCalendario.Row];
  end;
  DateTimePickerDataJogo.SetFocus;
end;

procedure TFormCalendario.SpeedButtonExcluirDataClick(Sender: TObject);
var
  I: Integer;
begin
  if Application.MessageBox('Tem certeza que deseja excluir o item selecionado?', 'Exclusão de Pontos', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = IDYES then
  begin
    with StringGridCalendario do
    begin
      for I:= Row to (RowCount-1) do
      begin
        Cells[0,I]  := Cells[0, I+1];
        Cells[1,I]  := Cells[1, I+1];
      end;
      if (RowCount >= 2) and (Cells[0,1] <> '') then
        RowCount:= RowCount - 1;
    end;
  end;
end;

procedure TFormCalendario.SpeedButtonSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFormCalendario.SpeedButtonSalvarClick(Sender: TObject);
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
    SQL.Add('Update or Insert into CALENDARIO (TORNEIO, DATA_JOGO, LOCAL_JOGO)');
    SQL.Add('Values (:TORNEIO, :DATA_JOGO, :LOCAL_JOGO)');
    with StringGridCalendario do
    begin
      for i := 1 to RowCount-1 do
      begin
        if cells[0,i] <> '' then
        begin
          ParamByName('TORNEIO').AsInteger:= CodigoTorneio;
          ParamByName('DATA_JOGO').AsDate:= StrToDate(Cells[0,I]);
          ParamByName('LOCAL_JOGO').AsString:= Cells[1,I];
          ExecSQL;
        end;
      end;
    end;
    FormMenuPrincipal.FDTransaction.Commit;
  Finally
    Free;
  End;
  PageControlGeralCadastroCalendario.TabIndex:= 0;
end;

end.
