unit uConfig;

interface
uses
  {Own}
  {Own Libs}
  {3rd Libs}
  {System}
  System.SysUtils,
  System.Generics.Collections;

function GetINI(const Path, Section: string; Keys: array of string)
    : TDictionary<string, string>;

procedure ReadINI(const Path, Section: string; Keys: array of string;
    const Pairs: TDictionary<string, string>);

implementation
uses
  {Own}
  UFilesystem,
  {System}
  System.IniFiles;

procedure ReadINI(const Path, Section: string; Keys: array of string;
    const Pairs: TDictionary<string, string>);
begin
  // Check file and appropriate file access permissions
  EnsureFile(Path, FmOpenRead);

  const Config = TIniFile.Create(Path);
  try
    // Check Section exists
    if not Config.SectionExists(Section) then
      raise Exception.CreateFmt('section %s missing in file: %s',
          [Section, Path]);

    for var Key in Keys do
    begin
      // Check Key exists
      if not Config.ValueExists(Section, Key) then
        raise Exception.CreateFmt('key %s missing at section %s in file %s',
            [Key, Section, Path]);

      // add key and value pair to result dictionary
      Pairs.Add(Key, Config.ReadString(Section, Key, ''));
    end;

  finally
    Config.Free;
  end;
end;

function GetINI(const Path, Section: string; Keys: array of string)
    : TDictionary<string, string>;
begin
  // Check file and appropriate file access permissions
  EnsureFile(Path, FmOpenRead);

  const Config = TIniFile.Create(Path);
  try

    Result := TDictionary<string, string>.Create;
    Result.Capacity := Length(Keys);

    // Check Section exists
    if not Config.SectionExists(Section) then
      raise Exception.CreateFmt('section %s missing in file: %s',
          [Section, Path]);

    try // gather all key - value pairs

      for var Key in Keys do
      begin
        // Check Key exists
        if not Config.ValueExists(Section, Key) then
          raise Exception.CreateFmt('key %s missing at section %s in file %s',
              [Key, Section, Path]);

        // add key and value pair to result dictionary
        Result.Add(Key, Config.ReadString(Section, Key, ''));
      end;

    except
      Result.Free;
      raise;
    end;

  finally
    Config.Free;
  end;

end;
end.
