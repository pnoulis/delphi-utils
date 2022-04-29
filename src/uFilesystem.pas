unit uFilesystem;

interface
 {
   getProjectRoot uses matchFilenameInPath to locate the
   project root
 }
 function getProjectRoot(const projectName: string): string;
 {
   anchorProjectRoot sets the current directory to the project root
   if a project name has provided and getProjectRoot manages to locate it
   if it fails it throws an exception
 }
 procedure anchorProjectRoot(const projectName: string);

implementation
uses
System.sysUtils,
System.IOUtils;

 {
   filename is compared against each directory in the current dir path
   up to root
 }
 function matchFilenameInPath(const path, filename: string): string;
  begin
   try
    if TPath.getFilename(path) = filename then
     exit(path);
    result := matchFilenameInPath(TDirectory.getParent(path), filename);
   except
    result := '';
   end;
  end;

 function getProjectRoot(const projectName: string): string;
  begin
   result := matchFilenameInPath(TDirectory.getCurrentDirectory, projectName);
  end;

 procedure anchorProjectRoot(const projectName: string);
  begin
  const projectRoot = getProjectRoot(projectName);
  try
   if projectRoot = '' then
   raise EFileNotFoundException.Create('Project root not found: ' + projectName);
   TDirectory.SetCurrentDirectory(projectRoot);
  except
  raise;
  end;
  end;

end.
