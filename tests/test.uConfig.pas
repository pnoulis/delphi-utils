unit test.uConfig;

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
  FMX.Memo.Types,
  FMX.Controls.Presentation,
  FMX.ScrollBox,
  FMX.Memo;

type
  TTestConfig = class(TForm)
    GetINITest: TMemo;
    ReadINITest: TMemo;
    procedure GetINITestClick(Sender: TObject);
    procedure ReadINITestClick(Sender: TObject);
    private
    public
  end;

var
  TestConfig: TTestConfig;

implementation
uses
  uConfig,
  System.Generics.Collections;
{$R *.fmx}

procedure TTestConfig.GetINITestClick(Sender: TObject);
begin
  // getINI test 1
  const FilePath = 'tests/test-files/config.ini';
  const Section = 'CUSTOM';
  const Keys = ['smtpServer', 'two'];
  var Config: TDictionary<string, string>;

  try
    Config := GetIni(Filepath, Section, Keys);
    Config.Free;
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

procedure TTestConfig.ReadINITestClick(Sender: TObject);
begin
  const FilePath = 'tests/test-files/config.ini';
  const Section = 'CUSTOM';
  const Keys = ['smtpServer', 'two'];
  const Config = TDictionary<string, string>.Create;

  try
    try
      ReadINI(Filepath, Section, Keys, Config);
    except
      on E: Exception do
        ShowMessage(E.Message);
    end;
  finally
    Config.Free;
  end;
end;

end.
