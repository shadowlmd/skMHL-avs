{
===============================================================================

 skMHLos.pas - part of skMHL Library by sergey korowkin (2:6033/27@fidonet),
               port to *nix based OS by Andrew V. Sichevoi (2:6028/9@fidonet)

 Unit for correct work skMHL Library under *nix based OS.
 Version : v0.1beta24-avs2
 License : GNU GPL v2.0
 Compiler: FreePascal Compiler v1.0.10
 Author  : Andrew V. Sichevoi

===============================================================================
}

unit skMHLos;

interface

const
{$IFDEF UNIX}
 ExtMSG = '.msg';
{$ELSE}
 ExtMSG = '.MSG';
{$ENDIF}

 Mask   = AllFilesMask;
 Slash  = DirectorySeparator;

 ejJHR  = 'jhr';
 ejJDX  = 'jdx';
 ejJDT  = 'jdt';
 ejJLR  = 'jlr';

 esSQD  = 'sqd';
 esSQI  = 'sqi';

function ParsePath(sPath: String): String;

implementation

{$IFDEF UNIX}
uses
 SysUtils;
{$ENDIF}

function ParsePath(sPath: String): String;
 begin
 {$IFDEF UNIX}
  if ((sPath[1] = '~') and (sPath[2] = Slash)) then
   begin
    Delete(sPath, 1, 2);
    sPath:=IncludeTrailingPathDelimiter(GetUserDir) + sPath;
   end else
  if ((sPath[1] = '.') and (sPath[2] = Slash)) then
   begin
    Delete(sPath, 1, 2);
    sPath:=IncludeTrailingPathDelimiter(GetCurrentDir) + sPath;
   end;
 {$ENDIF}
  ParsePath:=sPath;
 end;

end.
