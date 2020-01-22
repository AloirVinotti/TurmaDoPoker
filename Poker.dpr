program Poker;

uses
  Vcl.Forms,
  UMenuPrincipal in 'UMenuPrincipal.pas' {FormMenuPrincipal},
  UCadastroJogares in 'Cadastro\UCadastroJogares.pas' {FormCadastroJogadores},
  UCadastroTorneios in 'Cadastro\UCadastroTorneios.pas' {FormCadastroDeTorneios},
  UDataModuloGeral in 'DataModulo\UDataModuloGeral.pas' {DataModuleGeral: TDataModule},
  UEliminadoPor in 'Eliminação\UEliminadoPor.pas' {FormEliminadoPor},
  UCadastroCalendario in 'Cadastro\UCadastroCalendario.pas' {FormCalendario},
  UMensalidade in 'Mensalidade\UMensalidade.pas' {FormMensalidade},
  UPontuacaoGeral in 'Pontuação\UPontuacaoGeral.pas' {FormPontuacaoGeral},
  UPontosDia in 'Pontuação\UPontosDia.pas' {FormPontosDia},
  UPremiacao in 'Premiação\UPremiacao.pas' {FormPremiacao},
  URelatorioMensalidade in 'Mensalidade\URelatorioMensalidade.pas' {FormRelatorioMensalidade},
  URelatorioCalendario in 'Cadastro\URelatorioCalendario.pas' {FormRelatorioCalendario},
  UFiltroRelatorio in 'Relatorio\UFiltroRelatorio.pas' {FormRelatorios},
  URelatorioPremiacao in 'Premiação\URelatorioPremiacao.pas' {FormRelatorioPremiacao},
  URelatorioPontuacaoGeral in 'Pontuação\URelatorioPontuacaoGeral.pas' {FormRelatorioPontuacaoGeral},
  URelatorioPontuacaoDia in 'Pontuação\URelatorioPontuacaoDia.pas' {FormRelatorioJogoDia},
  UUtil in 'Utils\UUtil.pas',
  UPontuacaoExtra in 'Pontuação\UPontuacaoExtra.pas' {FormPontuacaoExtra},
  UEliminacao in 'Eliminação\UEliminacao.pas' {FormEliminacao},
  Vcl.Themes,
  Vcl.Styles,
  UConfiguracoes in 'Configuração\UConfiguracoes.pas' {FormConfiguracoes};

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
