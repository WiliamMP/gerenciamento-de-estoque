program Project3;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmControleEstoque},
  uCadastro in 'uCadastro.pas' {frmCadastro},
  uUpdate in 'uUpdate.pas' {frmUpdate},
  uConfig in 'uConfig.pas' {frmConfig};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmControleEstoque, frmControleEstoque);
  Application.CreateForm(TfrmConfig, frmConfig);
  Application.CreateForm(TfrmCadastro, frmCadastro);
  Application.CreateForm(TfrmUpdate, frmUpdate);
  Application.Run;
end.
