unit UMenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Buttons, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Comp.Client, Data.DB, IniFiles, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, FireDAC.Phys.IBBase, FireDAC.Phys.FB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Samples.Gauges, DateUtils, Vcl.ComCtrls, RLXLSFilter,
  RLFilters, RLPDFFilter, RLConsts, MMSystem, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TFormMenuPrincipal = class(TForm)
    PanelMenuLateral: TPanel;
    SpeedButtonCadastroJogadores: TSpeedButton;
    SpeedButtonCadastroTorneios: TSpeedButton;
    SpeedButtonCalendarioJogos: TSpeedButton;
    SpeedButtonMensalidade: TSpeedButton;
    SpeedButtonPontuacaoGeral: TSpeedButton;
    SpeedButtonJogoDoDia: TSpeedButton;
    SpeedButtonValoresPremiacao: TSpeedButton;
    PanelGeral: TPanel;
    FDConnection: TFDConnection;
    FDTransaction: TFDTransaction;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    PanelListagemTorneios: TPanel;
    DBGridListagemJogadores: TDBGrid;
    SpeedButtonCarregarTorneio: TSpeedButton;
    PanelJogo: TPanel;
    Panel1: TPanel;
    PanelOutro: TPanel;
    PanelBlinds: TPanel;
    PanelInformacoesTempo: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Label2: TLabel;
    LabelBlinds: TLabel;
    Label4: TLabel;
    LabelAnte: TLabel;
    PanelTempoJogo: TPanel;
    Label1: TLabel;
    LabelTempoTotal: TLabel;
    PanelTempoBreack: TPanel;
    Label3: TLabel;
    LabelTempoBreak: TLabel;
    PanelNivel: TPanel;
    Label6: TLabel;
    LabelNivel: TLabel;
    Panel3: TPanel;
    LabelTempo: TLabel;
    GaugeTempo: TGauge;
    TimerTempo: TTimer;
    PanelBotoesAcoes: TPanel;
    SpeedButtonIniciar: TSpeedButton;
    SpeedButtonParar: TSpeedButton;
    SpeedButtonRecomecar: TSpeedButton;
    SpeedButtonVoltarBlind: TSpeedButton;
    SpeedButtonAvancarBlind: TSpeedButton;
    StringGridListagemBlind: TStringGrid;
    PanelListegemJogadores: TPanel;
    Panel4: TPanel;
    LabelProximoBlind: TLabel;
    Label9: TLabel;
    TimerTempoJogo: TTimer;
    SpeedButtonSair: TSpeedButton;
    ListViewJogadoresNoJogo: TListView;
    ListViewPosicaoFinal: TListView;
    PDF: TRLPDFFilter;
    XLS: TRLXLSFilter;
    SpeedButtonRelatorio: TSpeedButton;
    TimerBreak: TTimer;
    Label5: TLabel;
    Label7: TLabel;
    LabelProximoAnte: TLabel;
    SpeedButtonMarcarTodos: TSpeedButton;
    SpeedButtonDesmarcarTodos: TSpeedButton;
    SpeedButtonEliminacao: TSpeedButton;
    SpeedButtonPontoExtra: TSpeedButton;
    SpeedButtonConfiguracoes: TSpeedButton;
    TimerIniciarJogoAutomaticamente: TTimer;
    FDQueryEliminacao: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButtonCadastroJogadoresClick(Sender: TObject);
    procedure SpeedButtonCadastroTorneiosClick(Sender: TObject);
    procedure SpeedButtonCarregarTorneioClick(Sender: TObject);
    procedure SpeedButtonIniciarClick(Sender: TObject);
    procedure TimerTempoTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButtonPararClick(Sender: TObject);
    procedure SpeedButtonRecomecarClick(Sender: TObject);
    procedure SpeedButtonAvancarBlindClick(Sender: TObject);
    procedure SpeedButtonVoltarBlindClick(Sender: TObject);
    procedure TimerTempoJogoTimer(Sender: TObject);
    procedure SpeedButtonSairClick(Sender: TObject);
    procedure SpeedButtonMarcarTodosClick(Sender: TObject);
    procedure SpeedButtonDesmarcarTodosClick(Sender: TObject);
    procedure SpeedButtonEliminacaoClick(Sender: TObject);
    procedure SpeedButtonCalendarioJogosClick(Sender: TObject);
    procedure SpeedButtonMensalidadeClick(Sender: TObject);
    procedure SpeedButtonPontuacaoGeralClick(Sender: TObject);
    procedure SpeedButtonJogoDoDiaClick(Sender: TObject);
    procedure SpeedButtonValoresPremiacaoClick(Sender: TObject);
    procedure SpeedButtonRelatorioClick(Sender: TObject);
    procedure TimerBreakTimer(Sender: TObject);
    procedure SpeedButtonPontoExtraClick(Sender: TObject);
    procedure ListViewJogadoresNoJogoItemChecked(Sender: TObject;
      Item: TListItem);
    procedure SpeedButtonConfiguracoesClick(Sender: TObject);
    procedure TimerIniciarJogoAutomaticamenteTimer(Sender: TObject);

  private
    { Private declarations }
    NivelTorneio, PontosPresenca, TempoGaug: Integer;
    HoraEliminacao, HoraInicio: TTime;
    Procedure MontarTitulo;
    Procedure PegaDadosTorneioBlinds(Nivel:Integer);
    Procedure PegaJogadoresTorneio;
    Procedure MontarListaJogadoresEliminados;
    Procedure AtualizaPosicaoJogadoresEliminados(Operacao:String);
    Procedure LimparTabelaAuxiliar;
    Procedure TirarJogadorDaTabelaAuxiliar(codigoJogador:Integer);
    Procedure InserirJogadorTabelaAuxiliar(codigoJogador, pontoEliminacao, addOn, reBuy, pontoExtra:integer; eliminado:string);
    Procedure InserirJogadorJogoDia(codigoJogador, posicaoJogador, pontosEliminacao, addOn, reBuy, pontosExtra: integer; naoCompareceu: boolean);
    Procedure EliminarJogador(codigoEliminou: integer);
    Procedure LimparJogadoreEliminadoS;
    Procedure RemoverJogadorJogo(codigoJogador: integer);

    Function BuscaPosicaoJogador:Integer;
    Function BuscarValorPontos: Integer;
  public
    { Public declarations }
    CodigoTorneio, PontosRetirada: Integer;
    DataJogo: TDate;
    Function RetiraCaracter(Caracter,Texto:String):String;
  end;

var
  FormMenuPrincipal: TFormMenuPrincipal;

implementation

{$R *.dfm}

uses UCadastroJogares, UCadastroTorneios, UDataModuloGeral, UEliminadoPor, UCadastroCalendario,
     UMensalidade, UPontuacaoGeral, UPontosDia, UPremiacao, UFiltroRelatorio, UPontuacaoExtra,
     UEliminacao, UConfiguracoes, UUtil;


function TFormMenuPrincipal.BuscaPosicaoJogador: Integer;
var
  posicao: Integer;
  I: Integer;
begin
  posicao:= 0;
  for I := 0 to ListViewJogadoresNoJogo.Items.Count-1 do
  begin
    if (ListViewJogadoresNoJogo.Items[i].Checked) then
    begin
      Inc(posicao);
    end;
  end;
  Result:= posicao;
end;

function TFormMenuPrincipal.BuscarValorPontos: Integer;
begin
  Result:= 0;
  with TFDQuery.Create(Self) do
  try
    Connection:= FormMenuPrincipal.FDConnection;
    Transaction:= FormMenuPrincipal.FDTransaction;
    Close;
    SQL.Clear;
    SQL.Add('Select Count(*) QtdEliminado from V_JOGO_DIA_AUX where TORNEIO = :TORNEIO and ELIMINADO = :ELIMINADO');
    ParamByName('TORNEIO').AsInteger:= FormMenuPrincipal.CodigoTorneio;
    ParamByName('ELIMINADO').AsString:= 'S';
    Open;
    if (RecordCount > 0) then
    begin
      Result:= FieldByName('QtdEliminado').AsInteger;
    end;
  finally
    free;
  end;
end;

procedure TFormMenuPrincipal.EliminarJogador(codigoEliminou: integer);
var
  posicao: integer;
begin
  with FDQueryEliminacao do
  begin
    FDQueryEliminacao.Connection:= FormMenuPrincipal.FDConnection;
    FDQueryEliminacao.Transaction:= FormMenuPrincipal.FDTransaction;
    FDQueryEliminacao.Close;
    FDQueryEliminacao.SQL.Clear;
    FDQueryEliminacao.SQL.Add('Select * from V_JOGO_DIA_AUX where TORNEIO = :TORNEIO and ELIMINADO = :ELIMINADO');
    FDQueryEliminacao.SQL.Add('ORDER BY ELIMINACAO_POSICAO');
    FDQueryEliminacao.ParamByName('TORNEIO').AsInteger:= FormMenuPrincipal.CodigoTorneio;
    FDQueryEliminacao.ParamByName('ELIMINADO').AsString:= 'S';
    FDQueryEliminacao.Open;
    if (FDQueryEliminacao.RecordCount > 0) then
    begin
      while not FDQueryEliminacao.eof do
      begin
        {Gravando quel elimou quem}
        if not FormMenuPrincipal.FDTransaction.Active then
          FormMenuPrincipal.FDTransaction.StartTransaction;
        with TFDQuery.Create(Self) do
        try
          Connection:= FormMenuPrincipal.FDConnection;
          Transaction:= FormMenuPrincipal.FDTransaction;
          Close;
          SQL.Clear;
          SQL.Add('Insert into ELIMINADO_POR (TORNEIO, DATA_JOGO, JOGADOR_ELIMADO, JOGADOR_ELIMINOU)');
          SQL.Add('values');
          SQL.Add('(:TORNEIO, :DATA_JOGO, :JOGADOR_ELIMADO, :JOGADOR_ELIMINOU)');
          ParamByName('TORNEIO').AsInteger:= FormMenuPrincipal.CodigoTorneio;
          ParamByName('DATA_JOGO').AsDate:= FormMenuPrincipal.DataJogo;
          ParamByName('JOGADOR_ELIMADO').AsInteger:= FDQueryEliminacao.FieldByName('CODIGO_JOGADOR').AsInteger;
          ParamByName('JOGADOR_ELIMINOU').AsInteger:= codigoEliminou;
          ExecSQL;
          FormMenuPrincipal.FDTransaction.CommitRetaining;
        finally
          free;
        end;

        posicao:= BuscaPosicaoJogador;
        {Inserir na tabela Jogo_Dia}
        InserirJogadorJogoDia(
          FDQueryEliminacao.FieldByName('CODIGO_JOGADOR').AsInteger,
          posicao,
          FDQueryEliminacao.FieldByName('PONTOS_ELIMINACAO').AsInteger,
          FDQueryEliminacao.FieldByName('ADD_ON').AsInteger,
          FDQueryEliminacao.FieldByName('RE_BUY').AsInteger,
          FDQueryEliminacao.FieldByName('PONTO_EXTRA').AsInteger,
          False
        );
        {Remover da tabela Jogo_Dia_Aux}
        TirarJogadorDaTabelaAuxiliar(FDQueryEliminacao.FieldByName('CODIGO_JOGADOR').AsInteger);
        FDQueryEliminacao.next;
      end;
    end;
  end;
end;

procedure TFormMenuPrincipal.FormCreate(Sender: TObject);
var
  Ini: TIniFile;
begin
  {Ler Ini da configuração de banco}
  if FileExists(ExtractFilePath(ParamStr(0)) + '\Poker.ini') then
  begin
    Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\Poker.ini');
    FDConnection.Params.Clear;
    FDConnection.DriverName := 'FB';
    FDConnection.Params.Add('Database='  + ini.ReadString('Poker', 'Database', ''));
    FDConnection.Params.Add('User_name= SYSDBA');
    FDConnection.Params.Add('Password= masterkey');
    FDConnection.Params.Add('Protocol= TCPIP');
    FDConnection.Params.Add('Server='    + ini.ReadString('Poker', 'Server', ''));
    FDConnection.Connected := True;
    ini.Free;
  end;
end;

procedure TFormMenuPrincipal.FormShow(Sender: TObject);
begin
  DataModuleGeral.FDQueryTorneios.Close;
  DataModuleGeral.FDQueryTorneios.Open;
end;

procedure TFormMenuPrincipal.InserirJogadorJogoDia(codigoJogador,
  posicaoJogador, pontosEliminacao, addOn, reBuy, pontosExtra: integer; naoCompareceu: boolean);
begin
if not FDTransaction.Active then
    FDTransaction.StartTransaction;
  with TFDQuery.Create(Self) do
  try
    Connection:= FDConnection;
    Transaction:= FDTransaction;
    Close;
    SQL.Clear;
    SQL.Add('Insert into JOGO_DIA (TORNEIO, CODIGO_JOGADOR, DATA_JOGO, POSICAO, PONTOS_ELIMINACAO, ADD_ON, RE_BUY, COMPARECEU_PONTOS, TEMPO_ELIMINACAO, PONTO_EXTRA)');
    SQL.Add('values');
    SQL.Add('(:TORNEIO, :CODIGO_JOGADOR, :DATA_JOGO, :POSICAO, :PONTOS_ELIMINACAO, :ADD_ON, :RE_BUY, :COMPARECEU_PONTOS, :TEMPO_ELIMINACAO, :PONTO_EXTRA)');
    ParamByName('TORNEIO').AsInteger:= CodigoTorneio;
    ParamByName('CODIGO_JOGADOR').AsInteger:= codigoJogador;
    ParamByName('DATA_JOGO').AsDate:= DataJogo;
    ParamByName('POSICAO').AsInteger:= posicaoJogador;
    ParamByName('PONTOS_ELIMINACAO').AsInteger:= pontosEliminacao;
    ParamByName('ADD_ON').AsInteger:= addOn;
    ParamByName('RE_BUY').AsInteger:= reBuy;
    if (naoCompareceu) then
    begin
    ParamByName('COMPARECEU_PONTOS').AsInteger:= 0;
      ParamByName('TEMPO_ELIMINACAO').IsNull;
    end
    else
    begin
      ParamByName('COMPARECEU_PONTOS').AsInteger:= PontosPresenca;
      ParamByName('TEMPO_ELIMINACAO').AsTime:= HoraEliminacao;
    end;
    ParamByName('PONTO_EXTRA').AsInteger:= pontosExtra;
    ExecSQL;
    FDTransaction.CommitRetaining;
  finally
    Free;
  end;
end;

procedure TFormMenuPrincipal.InserirJogadorTabelaAuxiliar(codigoJogador, pontoEliminacao, addOn, reBuy, pontoExtra:integer; eliminado:string);
begin
  if not FDTransaction.Active then
    FDTransaction.StartTransaction;
  with TFDQuery.Create(Self) do
  try
    Connection:= FDConnection;
    Transaction:= FDTransaction;
    Close;
    SQL.Clear;
    SQL.Add('Insert into JOGO_DIA_AUX (TORNEIO, CODIGO_JOGADOR, PONTOS_ELIMINACAO, ADD_ON,RE_BUY, PONTO_EXTRA, ELIMINADO,');
    SQL.Add('ELIMINACAO_POSICAO)');
    SQL.Add('values');
    SQL.Add('(:TORNEIO, :CODIGO_JOGADOR, :PONTOS_ELIMINACAO, :ADD_ON,:RE_BUY, :PONTO_EXTRA, :ELIMINADO, :ELIMINACAO_POSICAO)');
    ParamByName('TORNEIO').AsInteger:= CodigoTorneio;
    ParamByName('CODIGO_JOGADOR').AsInteger:= codigoJogador;
    ParamByName('PONTOS_ELIMINACAO').AsInteger:= pontoEliminacao;
    ParamByName('ADD_ON').AsInteger:= addOn;
    ParamByName('RE_BUY').AsInteger:= reBuy;
    ParamByName('PONTO_EXTRA').AsInteger:= pontoExtra;
    ParamByName('ELIMINADO').AsString:= eliminado;
    ParamByName('ELIMINACAO_POSICAO').AsInteger:= 0;
    ExecSQL;
    FDTransaction.CommitRetaining;
  finally
    free;
  end;
end;

procedure TFormMenuPrincipal.LimparJogadoreEliminadoS;
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
    SQL.Add('where TORNEIO = :TORNEIO');
    ParamByName('TORNEIO').AsInteger:= FormMenuPrincipal.CodigoTorneio;
    ParamByName('ELIMINADO').AsString:= 'N';
    ExecSQL;
    FDTransaction.CommitRetaining;
  finally
    free;
  end;
end;

procedure TFormMenuPrincipal.LimparTabelaAuxiliar;
begin
  if not FDTransaction.Active then
    FDTransaction.StartTransaction;
  with TFDQuery.Create(Self) do
  try
    Connection:= FDConnection;
    Transaction:= FDTransaction;
    Close;
    SQL.Clear;
    SQL.Add('Delete from JOGO_DIA_AUX');
    ExecSQL;
    FDTransaction.CommitRetaining
  finally
    free;
  end;
end;

procedure TFormMenuPrincipal.ListViewJogadoresNoJogoItemChecked(Sender: TObject;
  Item: TListItem);
begin
  if (Item.Caption <> '') then
  begin
    if (Item.Checked) then
    begin
      //Inc(QuantidadeJogadores);
      InserirJogadorTabelaAuxiliar(StrToInt(Item.Caption),
        StrToInt(Item.SubItems[1]),
        StrToInt(Item.SubItems[2]),
        StrToInt(Item.SubItems[3]),
        StrToInt(Item.SubItems[4]),
        'N');
        AtualizaPosicaoJogadoresEliminados('+');
    end
    else
    begin
      //Dec(QuantidadeJogadores);
      TirarJogadorDaTabelaAuxiliar(StrToInt(Item.Caption));
      AtualizaPosicaoJogadoresEliminados('-');
    end;
  end;
end;

procedure TFormMenuPrincipal.MontarListaJogadoresEliminados;
var
  Item: TListItem;
begin
  ListViewPosicaoFinal.Clear;
  with TFDQuery.Create(Self) do
  try
    Connection:= FDConnection;
    Transaction:= FDTransaction;
    Close;
    SQL.Clear;
    SQL.Add('Select * from V_JOGO_DIA where TORNEIO = :TORNEIO and DATA_JOGO = :DATA_JOGO ORDER BY POSICAO');
    ParamByName('TORNEIO').AsInteger:= CodigoTorneio;
    ParamByName('DATA_JOGO').AsDate:= DataJogo;
    Open;
    if (RecordCount > 0) then
    begin
      while (not eof) do
      begin
        Item:= ListViewPosicaoFinal.Items.Add;
        Item.Caption:= IntToStr(FieldByName('POSICAO').AsInteger);
        Item.SubItems.Add(IntToStr(FieldByName('CODIGO_JOGADOR').AsInteger));
        Item.SubItems.Add(FieldByName('NOME_JOGADOR').AsString);
        Item.SubItems.Add(IntToStr(FieldByName('PONTOS_POSICAO').AsInteger));
        Item.SubItems.Add(IntToStr(FieldByName('PONTOS_ELIMINACAO').AsInteger));
        Item.SubItems.Add(IntToStr(FieldByName('PONTO_EXTRA').AsInteger));
        RemoverJogadorJogo(FieldByName('CODIGO_JOGADOR').AsInteger);
        Next;
      end;
    end;
  finally
    Free;
  end;
end;

procedure TFormMenuPrincipal.MontarTitulo;
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

end;

procedure TFormMenuPrincipal.PegaDadosTorneioBlinds(Nivel: Integer);
begin
  LabelBlinds.Caption:= '';
  LabelAnte.Caption:= '';
  LabelProximoBlind.Caption:= '';
  LabelProximoAnte.Caption:= '';
  LabelTempo.Caption:= '';
  LabelNivel.Caption:= '';
  with StringGridListagemBlind do
  begin
    if (Cells[0,Nivel] <> '') then
    begin
      LabelBlinds.Caption:= Cells[1, Nivel]+' / '+ Cells[2, Nivel];
      LabelAnte.Caption:= Cells[3, Nivel];
      if Cells[1, Nivel+1] <> '' then
      begin
        LabelProximoBlind.Caption:= Cells[1, Nivel+1]+' / '+ Cells[2, Nivel+1];
        LabelProximoAnte.Caption:= Cells[3,Nivel+1];
      end;
      LabelTempo.Caption:= Cells[4, Nivel];
      LabelNivel.Caption:= Cells[0,Nivel];
      LabelTempoBreak.Caption:= Cells[5, Nivel];
      TempoGaug:= DecomporTempo(StrToTime(LabelTempo.Caption));
      GaugeTempo.MaxValue:= TempoGaug;
      GaugeTempo.Progress:= 0;
    end
    else
    begin
      Dec(NivelTorneio);
      Dec(Nivel);
      LabelBlinds.Caption:= Cells[1, Nivel]+' / '+ Cells[2, Nivel];
      LabelAnte.Caption:= Cells[3, Nivel];
      if Cells[1, Nivel+1] <> '' then
      begin
        LabelProximoBlind.Caption:= Cells[1, Nivel+1]+' / '+ Cells[2, Nivel+1];
        LabelProximoAnte.Caption:= Cells[3,Nivel+1];
      end;
      LabelTempo.Caption:= Cells[4, Nivel];
      LabelNivel.Caption:= Cells[0,Nivel];
      LabelTempoBreak.Caption:= Cells[5, Nivel];
      TempoGaug:= DecomporTempo(StrToTime(LabelTempo.Caption));
      GaugeTempo.MaxValue:= TempoGaug;
      GaugeTempo.Progress:= 0;
    end;
  end;
end;

procedure TFormMenuPrincipal.PegaJogadoresTorneio;
var
  Item: TListItem;
begin
  with TFDQuery.Create(Self) do
  try
    Connection:= FDConnection;
    Transaction:= FDTransaction;
    Close;
    SQL.Clear;
    SQL.Add('Select * from V_TORNEIOS_JOGADORES where CODIGO_TORNEIO = :CODIGO_TORNEIO');
    ParamByName('CODIGO_TORNEIO').AsInteger:= CodigoTorneio;
    Open;
    if (RecordCount > 0 ) then
    begin
      //ListViewJogadores.Clear;
      ListViewJogadoresNoJogo.Clear;
      while not eof do
      begin
        Item:= ListViewJogadoresNoJogo.Items.Add;
        Item.Caption:= IntToStr(FieldByName('CODIGO_JOGADORE').AsInteger);
        Item.SubItems.Add(FieldByName('NOME').AsString);
        Item.SubItems.Add('0');//Eliminação
        Item.SubItems.Add('0');//Add-On
        Item.SubItems.Add('0');//Re-buy
        Item.SubItems.Add('0');//Ponto Extra
        next;
      end;
    end;
  finally
    free;
  end;
end;

procedure TFormMenuPrincipal.RemoverJogadorJogo(codigoJogador: integer);
var
  I: Integer;
begin
  for I := 0 to ListViewJogadoresNoJogo.Items.Count - 1 do
  begin
    if (ListViewJogadoresNoJogo.Items[i].Caption = IntToStr(codigoJogador)) then
    begin
      ListViewJogadoresNoJogo.Items[i].Delete;
      Break;
    end;
  end;
end;

function TFormMenuPrincipal.RetiraCaracter(Caracter, Texto: String): String;
begin
  while (Pos(Caracter,Texto) > 0) do
  begin
    Texto[pos(Caracter, Texto)]:= ' ';
  end;
  Result:= Texto;
end;

procedure TFormMenuPrincipal.SpeedButtonAvancarBlindClick(Sender: TObject);
begin
  if (TimerTempo.Enabled = True) then
  begin
    ShowMessage('Jogo já iniciado, deve-se para o jogo para mudar o nível!');
  end
  else
  begin
    Inc(NivelTorneio);
    PegaDadosTorneioBlinds(NivelTorneio);
  end;
end;

procedure TFormMenuPrincipal.SpeedButtonCadastroJogadoresClick(Sender: TObject);
begin
  with TFormCadastroJogadores.Create(Self) do
  try
    ShowModal;
  finally
    free;
  end;
end;

procedure TFormMenuPrincipal.SpeedButtonCadastroTorneiosClick(Sender: TObject);
begin
  with TFormCadastroDeTorneios.Create(Self) do
  try
    ShowModal;
  finally
    free;
  end;
  DataModuleGeral.FDQueryTorneios.Close;
  DataModuleGeral.FDQueryTorneios.Open;
end;

procedure TFormMenuPrincipal.SpeedButtonCalendarioJogosClick(Sender: TObject);
begin
  with TFormCalendario.Create(Self) do
  try
    ShowModal;
  finally
    free;
  end;
end;

procedure TFormMenuPrincipal.SpeedButtonCarregarTorneioClick(Sender: TObject);
var
  TamanhoPanelJogo, I: Integer;
  TamanhoCentral: Real;
begin
  PanelListagemTorneios.Visible:= False;
  PanelJogo.Visible:= True;

  TamanhoPanelJogo:= PanelJogo.Width;
  TamanhoCentral:= Trunc(TamanhoPanelJogo * (50/100));
  PanelOutro.Width:= Trunc(TamanhoCentral/2)-10;
  PanelBlinds.Width:= Trunc(TamanhoCentral/2)+50;

  TamanhoPanelJogo:= PanelInformacoesTempo.Width;
  TamanhoCentral:= Trunc(TamanhoPanelJogo * (80/100));
  PanelTempoJogo.Width:= Trunc(TamanhoCentral/2);
  PanelTempoBreack.Width:= Trunc(TamanhoCentral/2);

  CodigoTorneio:= DBGridListagemJogadores.Fields[0].AsInteger;
  PontosRetirada:= DataModuleGeral.FDQueryTorneiosPONTUACAO_RETIRADA_JOGADOR.AsInteger;
  PontosPresenca:= DataModuleGeral.FDQueryTorneiosPONTUACAO_PRESENCA.AsInteger;
  NivelTorneio:= 1;

  MontarTitulo;
  with TFDQuery.Create(Self) do
  try
    Connection:= FDConnection;
    Transaction:= FDTransaction;
    Close;
    SQL.Clear;
    SQL.Add('Select * from TORNEIOS_BLIND where CODIGO_TORNEIO = :CODIGO_TORNEIO');
    SQL.Add('Order By CODIGO_TORNEIO, NIVEL');
    ParamByName('CODIGO_TORNEIO').AsInteger:= CodigoTorneio;
    Open;
    if (RecordCount > 0) then
    begin
      with StringGridListagemBlind do
      begin
        I:= 1;
        while not eof do
        begin
          if (Cells[0,i] = '') then
          begin
            Cells[0,I] := IntToStr(FieldByName('NIVEL').AsInteger);
            Cells[1,i] := IntToStr(FieldByName('SMALL_BLIND').AsInteger);
            Cells[2,i] := IntToStr(FieldByName('BIG_BLIND').AsInteger);
            Cells[3,i] := IntToStr(FieldByName('ANTE').AsInteger);
            Cells[4,i] := TimeToStr(FieldByName('TEMPO_NIVEL').AsDateTime);
            Cells[5,i] := TimeToStr(FieldByName('TEMPO_BREAK').AsDateTime);
            RowCount := RowCount + 1;
          end;
          inc(i);
          next;
        end;
      end;
    end;
  finally
    free;
  end;
  LabelTempoTotal.Caption:= '00:00:00';
  PegaDadosTorneioBlinds(NivelTorneio);
  if (DataModuleGeral.FDQueryTorneiosJOGADORES.Value = 'S') then
  begin
    PanelListegemJogadores.Visible:= True;
    ListViewPosicaoFinal.Visible:= True;
    PegaJogadoresTorneio;
  end
  else
  begin
    PanelListegemJogadores.Visible:= False;
    ListViewPosicaoFinal.Visible:= False;
  end;
  if (DataModuleGeral.FDQueryTorneiosPOSSUI_HORA_INICIO.AsString = 'S') then
  begin
    TimerIniciarJogoAutomaticamente.Enabled:= true;
    HoraInicio:= DataModuleGeral.FDQueryTorneiosHORA_INICIO.AsDateTime;
  end;
  LimparTabelaAuxiliar;
  DataJogo:= Date;

end;

procedure TFormMenuPrincipal.SpeedButtonConfiguracoesClick(Sender: TObject);
begin
  with TFormConfiguracoes.Create(Self) do
  try
    ShowModal;
  finally
    free;
  end;
end;

procedure TFormMenuPrincipal.SpeedButtonDesmarcarTodosClick(Sender: TObject);
var
  I:Integer;
begin
  for I:= 0 to (ListViewJogadoresNoJogo.Items.Count-1) do
    ListViewJogadoresNoJogo.Items[I].Checked:= false;
end;

procedure TFormMenuPrincipal.SpeedButtonEliminacaoClick(Sender: TObject);
var
   I, contador:Integer;
  codJogadoresEliminou: string;
  temEliminacao: boolean;
  stringListCodigoJogador: TStringList;
begin
  temEliminacao:= false;
  for I := 0 to ListViewJogadoresNoJogo.Items.Count-1 do
  begin
    if (ListViewJogadoresNoJogo.Items[i].Checked) then
    begin
      temEliminacao:= true;
      Break;
    end;
  end;

  if not(temEliminacao) then
  begin
    ShowMessage('não tem jogadores no jogo!');
    exit;
  end;

  with TFormEliminacao.Create(Self) do
  try
   ShowModal;
   temEliminacao:= eliminar;
  finally
   free;
  end;

  if (temEliminacao) then
  begin
     codJogadoresEliminou:= '';
     case (BuscarValorPontos) of
       0: Exit;
       1: PontosRetirada:= DataModuleGeral.FDQueryTorneiosPONTUACAO_RETIRADA_JOGADOR.AsInteger;
       2: PontosRetirada:= DataModuleGeral.FDQueryTorneiosPONTUACAO_RETIRADA_DUPLA.AsInteger;
       else
         PontosRetirada:= DataModuleGeral.FDQueryTorneiosPONTUACAO_RETIRADA_MULTIPLA.AsInteger;
     end;
    with TFormEliminadoPor.Create(Self) do
    try
      ShowModal;
      codJogadoresEliminou:= codigoJogadoresEliminou;
    finally
      free;
    end;
  end;
  if (codJogadoresEliminou <> '') then
  begin
    stringListCodigoJogador := TStringList.Create;
    try
      Split(';',codJogadoresEliminou, stringListCodigoJogador);
      for I := 0 to stringListCodigoJogador.Count -1 do
      begin
        EliminarJogador(StrToInt(stringListCodigoJogador[i]));
      end;
    finally
      stringListCodigoJogador.Free;
    end;

    contador:= BuscaPosicaoJogador;
    if (contador = 1) then
    begin
      with TFDQuery.Create(Self) do
      Try
        Connection:= FDConnection;
        Transaction:= FDTransaction;
        Close;
        SQL.Clear;
        SQL.Add('Select * from V_JOGO_DIA_AUX where TORNEIO = :TORNEIO ORDER BY CODIGO_JOGADOR');
        ParamByName('TORNEIO').AsInteger:= CodigoTorneio;
        Open;
        if (RecordCount > 0) then
        BEGIN
          InserirJogadorJogoDia(
            FieldByName('CODIGO_JOGADOR').AsInteger,
            contador,
            FieldByName('PONTOS_ELIMINACAO').AsInteger,
            FieldByName('ADD_ON').AsInteger,
            FieldByName('RE_BUY').AsInteger,
            FieldByName('PONTO_EXTRA').AsInteger ,
            False
          );
          TirarJogadorDaTabelaAuxiliar(FieldByName('PONTOS_ELIMINACAO').AsInteger);
          RemoverJogadorJogo(FieldByName('CODIGO_JOGADOR').AsInteger);
        END;
      Finally
        free;
      End;
    //gravar jogadores que não compareceram
    for I := 0 to ListViewJogadoresNoJogo.Items.Count - 1 do
    begin
      HoraEliminacao:= StrToTime('00:00:00');
      InserirJogadorJogoDia(
        StrToInt(ListViewJogadoresNoJogo.Items[i].Caption),
        0,0,0,0,0, True);
    end;
    end;
  end
  else
  begin
    LimparJogadoreEliminadoS;
  end;
end;

procedure TFormMenuPrincipal.SpeedButtonIniciarClick(Sender: TObject);
begin
  TimerIniciarJogoAutomaticamente.Enabled:= false;
  PanelMenuLateral.Visible:= false;
  TimerTempo.Enabled:= True;
  LabelTempo.Font.Color:= clBlack;
  TimerTempoJogo.Enabled:= True;
end;

procedure TFormMenuPrincipal.SpeedButtonJogoDoDiaClick(Sender: TObject);
begin
  with TFormPontosDia.Create(Self) do
  try
    ShowModal;
  finally
    free;
  end;
end;

procedure TFormMenuPrincipal.SpeedButtonMarcarTodosClick(Sender: TObject);
var
  I:Integer;
begin
  for I:= 0 to (ListViewJogadoresNoJogo.Items.Count-1) do
    ListViewJogadoresNoJogo.Items[I].Checked:= True;
end;

procedure TFormMenuPrincipal.SpeedButtonMensalidadeClick(Sender: TObject);
begin
  with TFormMensalidade.Create(Self) do
  try
    ShowModal
  finally
    free;
  end;
end;

procedure TFormMenuPrincipal.SpeedButtonPararClick(Sender: TObject);
begin
  PanelMenuLateral.Visible:= true;
  TimerTempo.Enabled:= False;
  LabelTempo.Font.Color:= clRed;
  TimerTempoJogo.Enabled:= False;
end;

procedure TFormMenuPrincipal.SpeedButtonPontoExtraClick(Sender: TObject);
begin
  if (ListViewJogadoresNoJogo.Selected = nil) then
  begin
    ShowMessage('Selecione um jogador!');
    exit;
  end;
  if (ListViewJogadoresNoJogo.Selected.Checked) then
  begin
    with TFormPontuacaoExtra.Create(Self) do
    try
      codigoJogador:= StrToInt(ListViewJogadoresNoJogo.Selected.Caption);
      pontoExtraJogador:= StrToInt(ListViewJogadoresNoJogo.Selected.SubItems[4]);
      LabelJogadorPontoExtra.Caption:= '';
      LabelJogadorPontoExtra.Caption:= ListViewJogadoresNoJogo.Selected.SubItems[0];
      LabelPontosExtra.Caption:= '';
      LabelPontosExtra.Caption:= IntToStr(pontoExtraJogador);
      ShowModal;
      ListViewJogadoresNoJogo.Selected.SubItems[4]:= IntToStr(pontoExtraJogador);
    finally
      free;
    end;
  end
  else
  begin
    if (not ListViewJogadoresNoJogo.Selected.Checked) then
    begin
      ShowMessage('Jogador não está no jogo!');
    end;
  end;
end;

procedure TFormMenuPrincipal.SpeedButtonPontuacaoGeralClick(Sender: TObject);
begin
  with TFormPontuacaoGeral.Create(Self) do
  try
    ShowModal
  finally
    free;
  end;
end;

procedure TFormMenuPrincipal.SpeedButtonRecomecarClick(Sender: TObject);
begin
  TimerTempo.Enabled:= False;
  NivelTorneio:= 1;
  PegaDadosTorneioBlinds(NivelTorneio);
  SpeedButtonIniciarClick(Self);
  TimerTempoJogo.Enabled:= False;
  LabelTempoTotal.Caption:= '00:00:00';
  TimerTempoJogo.Enabled:= True;
end;

procedure TFormMenuPrincipal.SpeedButtonRelatorioClick(Sender: TObject);
begin
  with TFormRelatorios.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TFormMenuPrincipal.SpeedButtonSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFormMenuPrincipal.SpeedButtonValoresPremiacaoClick(Sender: TObject);
begin
  with TFormPremiacao.Create(Self) do
  try
    ShowModal;
  finally
    free;
  end;
end;

procedure TFormMenuPrincipal.SpeedButtonVoltarBlindClick(Sender: TObject);
begin
  if (TimerTempo.Enabled = True) then
  begin
    ShowMessage('Jogo já iniciado, deve-se para o jogo para mudar o nível!');
  end
  else
  begin
    if (NivelTorneio > 1) then
    begin
      Dec(NivelTorneio);
      PegaDadosTorneioBlinds(NivelTorneio);
    end;
  end;
end;

procedure TFormMenuPrincipal.TimerBreakTimer(Sender: TObject);
var
  TempoBreak: String;
begin
  TempoBreak:=TimeToStr(StrToTime(LabelTempoBreak.Caption)-StrToTime('00:00:01'));
  LabelTempoBreak.Caption:= TempoBreak;
  if TempoBreak='00:00:00' then
  begin
    TimerBreak.Enabled:= False;
    SpeedButtonAvancarBlindClick(Self);
    TimerTempo.Enabled:= True;
    TimerTempoJogo.Enabled:= True;
  end;
  LabelTempoBreak.Caption:= TempoBreak;
end;

procedure TFormMenuPrincipal.TimerIniciarJogoAutomaticamenteTimer(
  Sender: TObject);
begin
  if (Time >= HoraInicio) and (Time <= IncMinute(HoraInicio,1)) then
  begin
    TimerIniciarJogoAutomaticamente.Enabled:= false;
    SpeedButtonIniciarClick(Self);
  end;
end;

procedure TFormMenuPrincipal.TimerTempoJogoTimer(Sender: TObject);
var
  TempoJogo: String;
begin
  TempoJogo:=TimeToStr(StrToTime(LabelTempoTotal.Caption)+StrToTime('00:00:01'));
  LabelTempoTotal.Caption:= TempoJogo;
end;

procedure TFormMenuPrincipal.TimerTempoTimer(Sender: TObject);
var
  Tempo: String;
  CaminhoPastaSom : PWideChar;
begin
  Tempo:=TimeToStr(StrToTime(LabelTempo.Caption)-StrToTime('00:00:01'));
  if (Tempo = '00:00:00') then
  begin
    TimerTempo.Enabled:= False;
    GaugeTempo.ForeColor:= clBlack;
    LabelTempo.Font.Color:= clBlack;
    if (LabelTempoBreak.Caption = '00:00:00') then
    begin
      SpeedButtonAvancarBlindClick(Self);
      Tempo:= LabelTempo.Caption;
      TimerTempo.Enabled:= True;
    end
    else
    begin
      TimerTempoJogo.Enabled:= False;
      TimerBreak.Enabled:= True;
    end;
  end
  else
  if Tempo = '00:01:00' then
  begin
    CaminhoPastaSom:=  PChar(DataModuleGeral.FDQueryTorneiosCAMINHO_PASTA_SOM.AsString+'beep-01.wav');
    sndPlaySound(CaminhoPastaSom,SND_ASYNC);
    GaugeTempo.ForeColor:= $004080FF;
    LabelTempo.Font.Color:= $004080FF;
  end
  else
  if StrToTime(Tempo) <= StrToTime('00:00:05') then
  begin
  CaminhoPastaSom:=  PChar(DataModuleGeral.FDQueryTorneiosCAMINHO_PASTA_SOM.AsString+'beep-07.wav');
   sndPlaySound(CaminhoPastaSom,SND_ASYNC);
   GaugeTempo.ForeColor:= clRed;
   LabelTempo.Font.Color:= clRed;
  end;
  LabelTempo.Caption:= Tempo;
  GaugeTempo.Progress:= GaugeTempo.Progress+1;
end;

procedure TFormMenuPrincipal.TirarJogadorDaTabelaAuxiliar(codigoJogador:Integer);
begin
  if not FDTransaction.Active then
    FDTransaction.StartTransaction;
  with TFDQuery.Create(Self) do
  try
    Connection:= FDConnection;
    Transaction:= FDTransaction;
    Close;
    SQL.Clear;
    SQL.Add('Delete from JOGO_DIA_AUX where TORNEIO = :TORNEIO and CODIGO_JOGADOR = :CODIGO_JOGADOR');
    ParamByName('TORNEIO').AsInteger:= CodigoTorneio;
    ParamByName('CODIGO_JOGADOR').AsInteger:= codigoJogador;
    ExecSQL;
    FDTransaction.CommitRetaining;
  finally
    Free;
  end;
  MontarListaJogadoresEliminados;
end;

procedure TFormMenuPrincipal.AtualizaPosicaoJogadoresEliminados(Operacao:String);
begin
  if (ListViewPosicaoFinal.Items.Count > 0) then
  begin  
    if not FDTransaction.Active then
      FDTransaction.StartTransaction;
    with TFDQuery.Create(Self) do
    try
      Connection:= FDConnection;
      Transaction:= FDTransaction;
      SQL.Clear;
      if (Operacao = '+') then
      begin
        SQL.Add('update JOGO_DIA set POSICAO = POSICAO +1 WHERE DATA_JOGO = :DATA_JOGO ORDER BY POSICAO DESC');
      end
      else
      if(Operacao = '-') then
      begin
        SQL.Add('update JOGO_DIA set POSICAO = POSICAO -1 WHERE DATA_JOGO = :DATA_JOGO ORDER BY POSICAO');
      end;
      ParamByName('DATA_JOGO').AsDate:= DataJogo;
      ExecSQL;
      FDTransaction.CommitRetaining;
    finally
      free;
    end;

    if (Operacao = '-') then
    begin
      if not FDTransaction.Active then
        FDTransaction.StartTransaction;
      with TFDQuery.Create(Self) do
      try
        Connection:= FDConnection;
        Transaction:= FDTransaction;
        SQL.Clear;
        SQL.Add('Delete from JOGO_DIA where POSICAO = 0');
        ExecSQL;
        FDTransaction.CommitRetaining;
      finally
        free;
      end;
    end;
    MontarListaJogadoresEliminados;
  end;
end;
initialization RLConsts.SetVersion(3,71,'B');
end.
