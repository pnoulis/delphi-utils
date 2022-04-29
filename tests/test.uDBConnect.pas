unit test.uDBConnect;

{
 Test uDBConnect:
 1. throws error if the configuration file to read from is not existent
 2. throws error if user has lacking permissions to rwx the file
 3. throws error if the section of the ini file does not exist
 4. throws error if the connection has not been setup
 5. Successfully sets up a connection to a database
}
interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, FMX.Layouts,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client;

type
  TtestUDBconnect = class(TForm)
    Layout1: TLayout;
    btnTest1: TMemo;
    StyleBook1: TStyleBook;
    btnTest2: TMemo;
    btnTest3: TMemo;
    connection: TFDConnection;
    procedure btnTest1Click(Sender: TObject);
    procedure btnTest2Click(Sender: TObject);
    procedure btnTest3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  testUDBconnect: TtestUDBconnect;

procedure test1;
procedure test2;
procedure test3;
procedure test4;

implementation
uses uDBConnect;

{$R *.fmx}

procedure test1;
begin
 showMessage('test #1');
end;

procedure test2;
begin
 showMessage('test #2');
end;

procedure test3;
begin
 showMessage('test #3');
end;

procedure test4;
begin
 showMessage('test #4');
end;

procedure test5;
begin
 showMessage('test #5');
end;

procedure TtestUDBconnect.btnTest1Click(Sender: TObject);
begin
test1;
end;

procedure TtestUDBconnect.btnTest2Click(Sender: TObject);
begin
test2;
end;

procedure TtestUDBconnect.btnTest3Click(Sender: TObject);
begin
test3;
end;

end.
