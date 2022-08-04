program delphiUtils;
uses
  System.StartUpCopy,
  FMX.Forms,
  uDBConnect in 'uDBConnect.pas',
  uMainForm in 'uMainForm.pas' {mainForm},
  test.uDBConnect in '..\tests\test.uDBConnect.pas' {testUDBconnect},
  uFilesystem in 'uFilesystem.pas',
  test.uFilesystem in '..\tests\test.uFilesystem.pas' {testUFilesystem},
  uTabs in 'uTabs.pas',
  test.uTabs in '..\tests\test.uTabs.pas' {testUTabs},
  uConfig in 'uConfig.pas',
  test.uConfig in '..\tests\test.uConfig.pas' {TestConfig};

{$R *.res}
begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.CreateForm(TmainForm, mainForm);
  Application.CreateForm(TtestUDBconnect, testUDBconnect);
  Application.CreateForm(TtestUFilesystem, testUFilesystem);
  Application.CreateForm(TtestUTabs, testUTabs);
  Application.CreateForm(TTestConfig, TestConfig);
  Application.Run;
end.
