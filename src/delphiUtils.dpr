program delphiUtils;

uses
  System.StartUpCopy,
  FMX.Forms,
  uDBConnect in 'uDBConnect.pas',
  uMainForm in 'uMainForm.pas' {mainForm},
  test.uDBConnect in '..\tests\test.uDBConnect.pas' {testUDBconnect},
  uFilesystem in 'uFilesystem.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TmainForm, mainForm);
  Application.CreateForm(TtestUDBconnect, testUDBconnect);
  Application.Run;
end.
