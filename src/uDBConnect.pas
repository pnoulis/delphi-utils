unit uDBConnect;

interface

 procedure connectDB(conn: TObject; const iniSection, iniPath: string);

implementation

 uses
  FireDAC.Comp.Client, Data.Win.ADODB,
  System.IniFiles, System.SysUtils, System.Classes,
  System.Generics.Collections;

 type
  TConfig = TDictionary<string, string>;

 const
  CONFIG_DEFAULT_PATH = '\..\..\..\config\config.ini';

 procedure ensureFile(const path: string; const accessMode: byte);
  begin
   var
    LFile: file;

   if (accessMode < fmOpenRead) or (accessMode > fmOpenReadWrite) then
    raise Exception.CreateFmt('Unrecognized access mode: %d', [accessMode]);

   if not FileExists(path) then
    raise Exception.Create('Missing file: ' + path);

   AssignFile(LFile, path);
   FileMode := accessMode;

   try
    Reset(LFile);
   except
    case accessMode of
    fmOpenRead:
     raise Exception.Create('Missing read permissions: ' + path);
    fmOpenWrite:
     raise Exception.Create('Missing write permissions: ' + path);
    fmOpenReadWrite:
     raise Exception.Create('Missing read & write permissions: ' + path);
    end;
   end;
   CloseFile(LFile);
  end;

 procedure readIni(const section, path: string; const config: TConfig);
  begin
   var
    ini: TIniFile := nil;
   var
    keys: TStringList := nil;

   try
    ini := TIniFile.Create(path);
    keys := TStringList.Create;
    ini.ReadSection(section, keys);
    for var key in keys do
     config.add(key, ini.ReadString(section, key, ''));
   finally
    FreeAndNil(ini);
    FreeAndNil(keys);
   end;
  end;

 procedure configureConnection(conn: TObject; const config: TConfig);
  begin
   if conn is TFDConnection then
    with conn as TFDConnection do
     begin
      DriverName := config['DriverID'];
      params.add('Server=' + config['Server']);
      params.add('Database=' + config['Database']);
      params.add('User_Name=' + config['User_Name']);
      params.add('OSAuthent=' + config['OSAuthent']);
      params.add('Password=' + config['Password']);
      LoginPrompt := false;
      Connected := true;
     end
   else if conn is TADOConnection then
   else
    raise Exception.Create('Unrecognized delphi connection type: ' +
       conn.ClassName);

  end;

 procedure connectDB(conn: TObject; const iniSection, iniPath: string);
  begin
   var
    config: TConfig := nil;

   try
    config := TConfig.Create;
    try
     ensureFile(iniPath, fmOpenRead);
     readIni(iniSection, iniPath, config);
     configureConnection(conn, config);
    except
     on E: Exception do
      raise Exception.Create('Failed to connect to DB: ' + E.Message);
    end;
   finally
    FreeAndNil(config);
   end;

  end;

end.
