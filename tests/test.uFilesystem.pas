unit test.uFilesystem;

interface
uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Layouts,
  FMX.Memo.Types,
  FMX.Controls.Presentation,
  FMX.ScrollBox,
  FMX.Memo;

type
  TtestUFilesystem = class(TForm)
    Layout1: TLayout;
    Memo1: TMemo;
    EnsureFileTest1: TMemo;
    EnsureFileTest2: TMemo;
    EnsureFileTest3: TMemo;
    procedure Memo1Click(Sender: TObject);
    procedure EnsureFileTest1Click(Sender: TObject);
    procedure EnsureFileTest2Click(Sender: TObject);
    procedure EnsureFileTest3Click(Sender: TObject);
    private
      { Private declarations }
    public
      { Public declarations }
  end;

var
  TestUFilesystem: TtestUFilesystem;

implementation
uses
  FMX.DialogService.Sync,
  System.IOUtils,
  uFilesystem;

type
  Dialog = TDialogServiceSync;
{$R *.fmx}

procedure TtestUFilesystem.EnsureFileTest1Click(Sender: TObject);
begin
  const FilePath = 'tests\test-files\config.ini';
  try
    EnsureFile(FilePath, FmOpenRead);
    ShowMessage('file found: ' + TPath.GetFullPath(FilePath));
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

procedure TtestUFilesystem.EnsureFileTest2Click(Sender: TObject);
begin

  const FilePath = 'tests\test-files\config.ini';
  try
    EnsureFile(FilePath, FmOpenWrite);
    ShowMessage('user''s permissions match the ones requested');
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

procedure TtestUFilesystem.EnsureFileTest3Click(Sender: TObject);
begin
  const FilePath = 'tests\test-files\config.ini';
  const WrongAccessMode = 5;
  try
    EnsureFile(FilePath, WrongAccessMode);
    ShowMessage('access mode is recognized');
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

procedure TtestUFilesystem.Memo1Click(Sender: TObject);
begin
  var
  Input := [''];
  Dialog.InputQuery('add amount', ['project name'], Input);
  uFilesystem.AnchorProjectRoot(Input[0]);
  ShowMessage('changed project root:' + TDirectory.GetCurrentDirectory);
end;

begin
  uFilesystem.AnchorProjectRoot('delphi-utils');
end.
