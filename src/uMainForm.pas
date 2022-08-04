unit uMainForm;

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
  FMX.Memo,
  FMX.Layouts;

type
  TmainForm = class(TForm)
    GridLayout1: TGridLayout;
    BtnTestUDBConnection: TMemo;
    BtnTestUFilesystem: TMemo;
    BtnTestUTabs: TMemo;
    BtnTestUConfig: TMemo;
    procedure BtnTestUDBConnectionClick(Sender: TObject);
    procedure BtnTestUFilesystemClick(Sender: TObject);
    procedure BtnTestUTabsClick(Sender: TObject);
    procedure BtnTestUConfigClick(Sender: TObject);
    private
      { Private declarations }
    public
      { Public declarations }
  end;

var
  MainForm: TmainForm;

implementation
uses
  Test.UConfig,
  Test.UTabs,
  Test.UDBConnect,
  Test.UFilesystem;
{$R *.fmx}

procedure TmainForm.BtnTestUConfigClick(Sender: TObject);
begin
  Test.UConfig.TestConfig.Show;
end;

procedure TmainForm.BtnTestUDBConnectionClick(Sender: TObject);
begin
  Test.UDBConnect.TestUDBconnect.Show;
end;

procedure TmainForm.BtnTestUFilesystemClick(Sender: TObject);
begin

  Test.UFilesystem.TestUFilesystem.Show;
end;

procedure TmainForm.BtnTestUTabsClick(Sender: TObject);
begin
  Test.UTabs.TestUTabs.Show;
end;

end.
