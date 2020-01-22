program Poker;

uses
  Vcl.Forms,
  UMenuPrincipal in 'UMenuPrincipal.pas' {FormMenuPrincipal},
  UCadastroJogares in 'Cadastro\UCadastroJogares.pas' {FormCadastroJogadores},
  UCadastroTorneios in 'Cadastro\UCadastroTorneios.pas' {FormCadastroDeTorneios},
  UDataModuloGeral in 'DataModulo\UDataModuloGeral.pas' {DataModuleGeral: TDataModule},
  UEliminadoPor in 'Elimina��o\UEliminadoPor.pas' {FormEliminadoPor},
  UCadastroCalendario in 'Cadastro\UCadastroCalendario.pas' {FormCalendario},
  UMensalidade in 'Mensalidade\UMensalidade.pas' {FormMensalidade},
  UPontuacaoGeral in 'Pontua��o\UPontuacaoGeral.pas' {FormPontuacaoGeral},
  UPontosDia in 'Pontua��o\UPontosDia.pas' {FormPontosDia},
  UPremiacao in 'Premia��o\UPremiacao.pas' {FormPremiacao},
  URelatorioMensalidade in 'Mensalidade\URelatorioMensalidade.pas' {FormRelatorioMensalidade},
  URelatorioCalendario in 'Cadastro\URelatorioCalendario.pas' {FormRelatorioCalendario},
  UFiltroRelatorio in 'Relatorio\UFiltroRelatorio.pas' {FormRelatorios},
  URelatorioPremiacao in 'Premia��o\URelatorioPremiacao.pas' {FormRelatorioPremiacao},
  URelatorioPontuacaoGeral in 'Pontua��o\URelatorioPontuacaoGeral.pas' {FormRelatorioPontuacaoGeral},
  URelatorioPontuacaoDia in 'Pontua��o\URelatorioPontuacaoDia.pas' {FormRelatorioJogoDia},
  UUtil in 'Utils\UUtil.pas',
  UPontuacaoExtra in 'Pontua��o\UPontuacaoExtra.pas' {FormPontuacaoExtra},
  UEliminacao in 'Elimina��o\UEliminacao.pas' {FormEliminacao},
  Vcl.Themes,
  Vcl.Styles,
  UConfiguracoes in 'Configura��o\UConfiguracoes.pas' {FormConfiguracoes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMenuPrincipal, FormMenuPrincipal);
  Application.CreateForm(TDataModuleGeral, DataModuleGeral);
  Application.CreateForm(TFormRelatorioCalendario, FormRelatorioCalendario);
  Application.CreateForm(TFormRelatorios, FormRelatorios);
  Application.CreateForm(TFormRelatorioPremiacao, FormRelatorioPremiacao);
  Application.CreateForm(TFormRelatorioPontuacaoGeral, FormRelatorioPontuacaoGeral);
  Application.CreateForm(TFormRelatorioJogoDia, FormRelatorioJogoDia);
  Application.Run;
end.
