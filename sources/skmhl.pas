{
===============================================================================

 skMHL.pas - part of skMHL Library by sergey korowkin (2:6033/27@fidonet),
             port to *nix based OS by Andrew V. Sichevoi (2:6028/9@fidonet)

 Base unit
 Version : v0.1beta24-avs2
 License : GNU GPL v2.0
 Compiler: FreePascal Compiler v1.0.10

===============================================================================
}

(*                                                    skMHL: tested by mab =)

 !!! �� ��������� �������� far calls - {$F+} � extended syntax - {$X+},
 !!! ����� skmhl ���p���� �� ����p����..

 sk's message handling library [started: 27/12/1998]
 version 0.1 beta 24.

 dedicated to tatyana medvedeva, 2:6033/28@fidonet, "ice-lock npd2000".

 (q) by sergey korowkin [sk], 1998-2001.

 some fixes (q) by michail a. baikov [mab], 1999-2000.
 some stuff (q) by Andrey Novikoff, 2000.

 2:6033/27@fidonet

 history

 0.1b24
   - �������������� ��������� � getstringpchar [14/01]
   - afterlastkludge ����p� �� ����p����� gettextsize, ���� �������
     ��� ��p�� ������� (JT/dupechk) [01/02]
   - delphi 5 compatible [16/02]
   - ��� ����� skComnTV, skComnD3 � �� � �� - ���� mhldi.inc, mhldc.inc
     (��� delphi) � mhltvi.inc, mhltvc.inc ��� VP/BP. ����������
     �������������, �� ��� delphi ����� �p������� � conditional defines:
     DELPHI [16/02]
   - ����� �� ����� ����� �������� InstallMHLcommon [16/02]
   - ������� ���p������ ���� [17/02]
   - ����p� jam ���-���� ���p�������, ���� jlr �� ���� [17/02]

 0.1b23
   - setfrom/setto/setsubj � msg: ����p� ��p����� ��p��� �� ������
     ������, ����� gpf �� ���� [09/11 - JT/elkin's_txt2pkt/Tossing]
   - JamSubBufferSize now $4000 [09/11 - JT/elkin's_txt2pkt/Tossing]
   - setfrom/setto/setsubj � sq: �� �� �����, ��� � � msg [09/11 - JT/elkin's_txt2pkt/Tossing]
   - StrToAddress H� ��p��� ������ �����p����� ���� '2:6033'
   - os2/w32 dll ����p����� ����p� vp 2.1.230

 0.1b22
   - GetRead/SetRead p������ ���p������� � sq [03/11 - JT/OnFire]

 0.1b21
   - AddressEqu added [13/09]
   - tmb.IsRead, tmb.SetRead [26/09 - JT/OnFire]
   - ������ �p�� � tfidomsgbase.getattribute [11/10 - JT/Scanning]

 0.1b20
   - GetHighWater, SetHighWater, SeekHighWater � ������ (JT) [27/07]
   - packed records (delphi3 ����� grunged sq ����),
     thanx to Anton Kochetkov (2:5011/42.79) [21/08]

 0.1b19
   - killmessage � jam'� �� ������ ����p���� true :) [26/06]
   - ���-�� ��� ���� ����� � delphi.. ����p�, �p���, �������.
     ��p����� ��������� FileExists'� � skcommon'� - �p���, �����������
     d3 ������, ����� ��� �������� TMBF... �p������ ������� ���������
     workaround, ����p� ��� ��p��� ;) [26/06]
   - ���� ���-������ ������ ���, ������ skmhlw32.dll ������, ���������
     �� �������, �� �� ������ (skmhlapifulltitle �p������ ��p������),
     � � ������ ���p���� ����, �� � ���� ��� ����� ������ �������p��.. [26/06]
   - ClearAddress improved :) [29/06]
   - ClearMessageBaseDateTime (DBeer! ;) [29/06]
   - �������������� �p��������� 0x01flags � msg ���p���� ���p�� [07/07]
   - ���-�� ��� � julian'���, word'��� � integer'��� [13/07]
   - ��p����� p��������� sq-��� ������ ���� ���p������. ����p� ��
     ������ �� end_frame � ��������� ���� � ������ p�� ��� ���p������
     (��. skmhlsq.pas) [14/07]

 0.1b18
   - ������ killmessage � jam'� =) (thanx2mab) [26/06]

 0.1b17:
   - skmhlapiDistinguishBaseFormat [11/05]
   - DoneNoDestroy V\skmhl.pas (���������� ��� thunk'�� ;) [14/05]
   - ���� � ��������� � ������ [10/06]
   - ������ ���p������ �� ������ seek[next|prev] ����� killmessage [10/06]
   - ���� ������� � ����������� ������ killmessage & continue :( [10/06]
   - ����� �������� � ���� (p��������, ����� etc =)))))) [10/06]
   - SeekNext ����� ����� TJamMessageBase.KillMessage :) [10/06]
   - ��p� ������ flush'�� � tjammessagebase.resetall =) [10/06]
   - � ��p������� � jam'� ������ ���� ��� ������ (thanx2mab) [10/06]

 0.1b16:
   - IsValidMessageBaseDateTime � skCommon [12/04]
   - p����� �� ������ skMHL � dll [22-24/04]
   - ��� ��p������� TMessageBase, �p��� ���� - � �p����� [25/04]
   - tmessagebase.GetStatus, .setmessagetextstream [25/04]
   - ������ ����p���p������, ����p���! ;-) [25/04]
   - ���p����� TMessageBaseMemoryStream � skComnTV. ������ �����
     ����������� ����p�� (virtualsize, ����� ������ �� 8kb, etc ;) [25/04]
   - skMHLversion/title/fulltitle -> �������, ���� �� ���� ��������
     � vskMHL [01/05]
   - p����� �� ���������� skMHL � p����� � dll �������� � ����� [03/05]
   - basepath ����p���p������ ���� :) [04/05]
   - p����� �� ������ skMHL � dll ���������. skMHL*.dll,
     VskMHL � ��������� [09/05]
   - ��������� ��������� ���� (���� "���" ����� ��� ������� =) [10/05]

 0.1b15:
   - ������������ ������ ���� �� ������� (nummsg/highmsg/sqidx.number) [03/04]
     (�� ������ ������ ������������ golded ����p� ��� �� ������ ;)

 0.1b14:
   - fixed ���� ��� � extractpathname ;) [29/03]
   - fexpand thunk added (delphi comp.) [29/03]
   - ����� � skcomntv �p� ���p���� (�p��� ���p����� � ��p�����) [31/03]
   - ���� � tsquishmessagebase.exist, ��-�� ��� �������� sq-���� =( [31/03]
   - OpenMessageBaseEx (skopen), ombLockedAttemptsExpired (skcommon) [31/03]
   - Delay � skCommon [31/03]

 0.1b13:
   - �� ������ _�����������_ .msg-���� (createdirectory � ��� ����� =)
     [04/01]
   - StringCRC32 � skcommon (����� ��� � JT =) [21/01]
   - bug � skcommon.DirectoryExists, thanx to Diman Petrov
   - ��� �p�����p� ��� p����� � msgbinarytimestamp by Andrey Novikoff,
     345:817/10. ������� ��� =) [04/02]
   - �p� p����� � msg ����p� ������� binary timestamps'�. �� �p��p�������
     �������� ��������� datewritten =) [datearrived ����p� �����
     �p�����������. p���.. ;)] [04/02]
   - ����p� �p��� �� ������ ���������� � getfrom/toaddress �p� �������
     ��p��� ��p��� ���� AREA:... ��� 01x0 � ������ (Vad Skakov, 2:5065/16)
     [04/02]
   - StrToAddressR - ����p� ����� ������������ ���-�� �p���
     base^.SetFromAddress(StrToAddressR('2:6033/27.0')^, ...); [18/02]
   - SetFromAndToAddress params changed (freshmsgid) [18/02]
   - SetBaseType - ������ ���� ������� SetFlag(). ����� ����������
     ��� ���p��, ��� � ����� ����� [18/02]
   - PutOrigin - useful stuff [18/02] =)
   - GetKludgePChar improved (inspirated by Vad Skakov, 2:5065/16) [21/02]
   - SetKludgePChar improved (inspirated by Vad Skakov, 2:5065/16) [21/02]
   - DeleteKludgePChar improved (inspirated by Vad Skakov, 2:5065/16) [21/02]
   - AfterLastKludge [21/02]
   - Dec(MaxLen) � GetKludgePChar [22/02]
   - TVirtualMessageBaseMHL (mhl streams -> base linker), skMHLvmb [24/02]
   - OpenMessageHeader (������������ ��� "�p�����p�" ���������� ���������:
     ������ ������ OpenMessage, ������ ����� ��������� �� �p���� (������
     ������). �� ��������� ������ closemessage!;) [24/02]
   - ��p��������� �p��������� ��� ������ skmhl, ����p� ����� ����������
     ������������� ����� ��������� ����� =) [24/02]
   - ���� ������ ��p�����.. [24/02]
   - �����p��� ^AFLAGS � skMHLmsg: SetAFLAG, GetAFLAG, ���������� �
     SetAttribute [24/02]
   - skcommon.ExplainStatus, ��� ��������� ������ ����p� � skcommon [24/02]
   - WriteMessageHeader. ATTENTION! writemessageheader ����� ������
     ��H��H�� ���������! ����� ��� �� �������p�������� ��������� �����
     �p������ � ���� ������: ���p���p, � �p��� ����! ������ ��������������
     ������ ��� ���������� �����-���� ����, �p�������� � ����p��� ����p�
     (��� ��� ����� ��� ���������� reply'�� ;) [28/02]
   - Get/SetReply* � jam/msg/sq. � ������ ���� ���� ������ ;) [28/02]
   - ���������, ��� writemessage � tjammessagebase ������ p������ �����
     openmessage.. 8-[ ] [28/02]
   - � sq ����p� realnumbering + ����p���� p����� [05/03]
   - IsRealMessageBaseDateTime � skcommon [08/03]
   - RenameFile � skcommon - ����� ��� � skmhlpck (�������� ���) [08/03]
   - repackindex � jam ���� ��p�����. [13/03]
   - ��p� ���� �� ����������� ������p�� �������� skmhl, ������� p���������
     � memorystream'���.. ����� �p������ � ������ ����p����. �����.. [13/03]
   - ��������� skMHLversion/skMHLtitle/skMHLfulltitle [15/03]
   - ���� ������ ������

 0.1b12:
   - ���p������� p������� � ����p����� � msg (������ � �������
     longint ������ word?!) [10/12]
   - ���p����� ��������� ��� � skmhlmsg � .GetToAddress [13/12]
   - ���p������ ��p�������� ��p��� � �������, ����� FMPT/TOPT ����
     ��p�� INTL (���� Diman Petrov, 2:5023/27.18) [13/12]

 0.1b11:
   - ���p������� ��p������ msgid ���� 'zia.cityline.ru' - bug �
     strtoaddress. ����p� ��p�� ��p������� ��p�� �p���p����� ��
     ���������� ���� �������� - ���� ���� �� ���� ������ �� ������
     � �������� ['0'..'9', ':', '/', '.'], �� ��p��� �� ��p�����... [21/11]
   - ��� ��������� Y2k fixes (thanx to mab) [06/12]

 0.1b10:
   - TAddress ����p� �� ����p� longint'�, � ����p� integer'� =)
   - Y2k compatibility, ��� ����� ������� � skCommon'�.. ����� ���
     ����� ���������, ��������� ����� ;) [18/08]
   - ASCIIZFIX [FromASCIIZ] � skCommon'�. ������ � ����� (�����?)
     strings'������� StrPas'� [18/08]
   - GetAttributesLine -- maScanned
   - �������-�� ��p����� p����� � lastread'��� [06/10]
   - ��� � TMessageBaseFileFind.StopSearch � ���p�� ��� Win32 =) [07/10]
   - ����p� ���������� ����p����� � ������� Delphi.
     �����p������� _������_ �� Delphi 3, �� � �� ����p�������..
     ��� ��� ���� ����� ����p����.
     ��� ���p�� ��� D3 ����� ������ skComnTV ���������� skComnD3.

 0.1b9:
   - ������ �����
   - ���������, ��������� �� ������ ������, �p��� �������� � squish
     (����� �����p������, skMHLsq.pas, TSquishMessageBase.WriteMessage)
   - ������ �� RTE#217, ��� �� ��� ������������
     skComnTV.TMessageBaseRamStream.Flush
   - ��������� ������������� ��������� � jam'� � hdrloc=-1
   - ����� KillMessage � jam'� ����� �� ����������� ������p��
     ��������� ���������

*)
unit skMHL;

{$IFDEF DELPHI}
 {$WARNINGS OFF}
 {$HINTS OFF}
{$ENDIF}

{$IFDEF FPC}
 {$WARNINGS OFF}
{$ENDIF} 

interface
uses
     skCommon;

const
 skMHLdllsuffix = '/DLL';

type
 PMessageBase = ^TMessageBase;
 TMessageBase = object
  constructor Init;
  destructor Done; virtual;

  function Open(const Path: String): Boolean; virtual;
  function Create(const Path: String): Boolean; virtual;
  function Exist(const Path: String): Boolean; virtual;
  procedure Close; virtual;
  function Exists(Message: Longint): Boolean; virtual;
  function Current: Longint; virtual;
  procedure Seek(Message: Longint); virtual;
  procedure SeekNext; virtual;
  procedure SeekPrev; virtual;
  function SeekFound: Boolean; virtual;
  function GetLocation: Longint; virtual;
  procedure SetLocation(Location: Longint); virtual;
  function OpenMessage: Boolean; virtual;
  function OpenMessageHeader: Boolean; virtual;
  function CloseMessage: Boolean; virtual;
  function GetHighest: Longint; virtual;
  function GetCount: Longint; virtual;
  function GetFrom: String; virtual;
  function GetTo: String; virtual;
  function GetSubject: String; virtual;
  procedure GetFromAddress(var Address: TAddress); virtual;
  procedure GetToAddress(var Address: TAddress); virtual;
  procedure GetFromAndToAddress(var FromAddress, ToAddress: TAddress); virtual;
  procedure SetFrom(const S: String); virtual;
  procedure SetTo(const S: String); virtual;
  procedure SetSubject(const S: String); virtual;
  procedure SetFromAddress(var Address: TAddress; const FreshMSGID: Boolean); virtual;
  procedure SetToAddress(var Address: TAddress); virtual;
  procedure SetFromAndToAddress(var FromAddress, ToAddress: TAddress; const FreshMSGID: Boolean); virtual;
  procedure GetStringPChar(Line: PChar; MaxLen: Word); virtual;
  procedure GetString(var Line: String); virtual;
  procedure PutStringPChar(Line: PChar); virtual;
  procedure PutString(const Line: String); virtual;
  function EndOfMessage: Boolean; virtual;
  procedure SetTextPos(Position: Longint); virtual;
  function GetTextPos: Longint; virtual;
  function GetTextSize: Longint; virtual;
  procedure TruncateText; virtual;
  procedure ReadText(var Buf; Count: Word); virtual;
  procedure WriteText(var Buf; Count: Word); virtual;
  function GetAttribute(Attribute: Longint): Boolean; virtual;
  procedure SetAttribute(Attribute: Longint; Enable: Boolean); virtual;
  procedure GetWrittenDateTime(var DateTime: TMessageBaseDateTime); virtual;
  procedure GetArrivedDateTime(var DateTime: TMessageBaseDateTime); virtual;
  procedure SetWrittenDateTime(var DateTime: TMessageBaseDateTime); virtual;
  procedure SetArrivedDateTime(var DateTime: TMessageBaseDateTime); virtual;
  function WriteMessage: Boolean; virtual;
  function WriteMessageHeader: Boolean; virtual;
  function GetKludgePChar(const Name, Destination: PChar; const MaxLen: Word): Boolean; virtual;
  function GetKludge(const Name: String; var Destination: String): Boolean; virtual;
  procedure SetKludgePChar(const Name, Value: PChar); virtual;
  procedure SetKludge(const Name, Value: String); virtual;
  procedure DeleteKludgePChar(const Name: PChar); virtual;
  procedure DeleteKludge(const Name: String); virtual;
  procedure AddKludgePChar(const Value: PChar); virtual;
  procedure AddKludge(const Value: String); virtual;
  function GetMessageTextStream: PMessageBaseStream; virtual;
  procedure SetFlag(const Flag: Longint; const Enable: Boolean); virtual;
  function GetFlag(const Flag: Longint): Boolean; virtual;
  procedure CheckFromAddress(const S: String; var Address: TAddress); virtual;
  procedure CheckToAddress(const S: String; var Address: TAddress); virtual;
  function CreateNewMessage: Boolean; virtual;
  function KillMessage: Boolean; virtual;
  function GetLastRead(const UserNumber: Longint): Longint; virtual;
  procedure SetLastRead(const UserNumber: Longint; const Value: Longint); virtual;
  procedure ResetDateTime;
  procedure SetBaseType(const BaseType: TBaseType); virtual;
  procedure PutOrigin(Address: TAddress; const Text: String); virtual;
  function AfterLastKludge: Longint; virtual;
  procedure SetMessageTextStream(const AMessageText: PMessageBaseStream); virtual;
  procedure SetStatus(const AStatus: Longint); virtual;
  function GetStatus: Longint; virtual;
  procedure SetOpened(const AOpened: Boolean); virtual;
  function GetOpened: Boolean; virtual;
  procedure SetCurrent(const ACurrentMessage: Longint); virtual;
  procedure SetBasePath(const ABasePath: String); virtual;
  function GetBasePath: String; virtual;
  function GetRead: Boolean; virtual;
  procedure SetRead(const Value: Boolean); virtual;
 public
  KludgeStart, KludgeEnd: Longint;
 private
  Status: Longint;
  Opened: Boolean;
  Flags: Longint;
  CurrentMessage: Longint;
  MessageText: PMessageBaseStream;
  BasePath: String;
 end;

procedure GetAttributesLine(B: PMessageBase; var S: String);
procedure GetDateTimeLine(var DT: TMessageBaseDateTime; var S: String);

function skMHLversion: String;
function skMHLtitle: String;
function skMHLfulltitle: String;

implementation

constructor TMessageBase.Init;
 begin
  Flags:=0;
  Status:=0;

  Opened:=False;

  MessageText:=nil;
 end;

destructor TMessageBase.Done;
 begin
 end;

function TMessageBase.Open(const Path: String): Boolean;
 begin
  Abstract;
 end;

function TMessageBase.Create(const Path: String): Boolean;
 begin
  Abstract;
 end;

function TMessageBase.Exist(const Path: String): Boolean;
 begin
  Abstract;
 end;

procedure TMessageBase.Close;
 begin
  Abstract;
 end;

function TMessageBase.Exists(Message: Longint): Boolean;
 begin
  Abstract;
 end;

function TMessageBase.Current: Longint;
 begin
  Current:=CurrentMessage;
 end;

procedure TMessageBase.Seek(Message: Longint);
 begin
  CurrentMessage:=Message - 1;

  SeekNext;
 end;

procedure TMessageBase.SeekNext;
 begin
  repeat
   Inc(CurrentMessage);

   if CurrentMessage > GetHighest then
    begin
     CurrentMessage:=0;

     Break;
    end;

   if Exists(CurrentMessage) then
    Break;
  until False;
 end;

procedure TMessageBase.SeekPrev;
 begin
  repeat
   Dec(CurrentMessage);

   if CurrentMessage < 1 then
    begin
     CurrentMessage:=0;

     Break;
    end;

   if Exists(CurrentMessage) then
    Break;
  until False;
 end;

function TMessageBase.SeekFound: Boolean;
 begin
  SeekFound:=CurrentMessage <> 0;
 end;

function TMessageBase.GetLocation: Longint;
 begin
  Abstract;
 end;

procedure TMessageBase.SetLocation(Location: Longint);
 begin
  Abstract;
 end;

function TMessageBase.OpenMessage: Boolean;
 begin
  Abstract;
 end;

function TMessageBase.OpenMessageHeader: Boolean;
 begin
  Abstract;
 end;

function TMessageBase.CloseMessage: Boolean;
 begin
  Abstract;
 end;

function TMessageBase.GetHighest: Longint;
 begin
  Abstract;
 end;

function TMessageBase.GetCount: Longint;
 begin
  Abstract;
 end;

function TMessageBase.GetFrom: String;
 begin
  Abstract;
 end;

function TMessageBase.GetTo: String;
 begin
  Abstract;
 end;

function TMessageBase.GetSubject: String;
 begin
  Abstract;
 end;

procedure TMessageBase.GetFromAddress(var Address: TAddress);
 var
  S: String;
  First: Boolean;
 begin
  SetTextPos(0);

  First:=True;

  while not EndOfMessage do
   begin
    GetString(S);

    if ((Length(S) = 0) or (S[1] <> #1)) and not First then
     Continue;

    First:=False;

    CheckFromAddress(S, Address);
   end;
 end;

procedure TMessageBase.GetToAddress(var Address: TAddress);
 var
  S: String;
  First: Boolean;
 begin
  SetTextPos(0);

  First:=True;

  while not EndOfMessage do
   begin
    GetString(S);

    if ((Length(S) = 0) or (S[1] <> #1)) and not First then
     Continue;

    First:=False;

    CheckToAddress(S, Address);
   end;
 end;

procedure TMessageBase.GetFromAndToAddress(var FromAddress, ToAddress: TAddress);
 var
  S: String;
  First: Boolean;
 begin
  SetTextPos(0);

  First:=True;

  while not EndOfMessage do
   begin
    GetString(S);

    if ((Length(S) = 0) or (S[1] <> #1)) and not First then
     Continue;

    First:=False;

    CheckFromAddress(S, FromAddress);
    CheckToAddress(S, ToAddress);
   end;
 end;

procedure TMessageBase.SetFrom(const S: String);
 begin
  Abstract;
 end;

procedure TMessageBase.SetTo(const S: String);
 begin
  Abstract;
 end;

procedure TMessageBase.SetSubject(const S: String);
 begin
  Abstract;
 end;

procedure TMessageBase.SetFromAddress(var Address: TAddress; const FreshMSGID: Boolean);
 var
  ToAddress: TAddress;
  S: String;
 begin
  if (not FreshMSGID) and GetKludge('MSGID:', S) then
   SetKludge('MSGID:', 'MSGID: ' + AddressToStrEx(Address) + ' ' + ExtractWord(3, S, [' ']))
  else
   SetKludge('MSGID:', 'MSGID: ' + AddressToStrEx(Address) + ' ' + GenerateMSGID);

  if GetFlag(afNetmail) then
   begin
    GetToAddress(ToAddress);

    SetKludge('INTL', 'INTL ' + AddressToStrPointless(ToAddress) + ' ' + AddressToStrPointless(Address));

    if Address.Point = 0 then
     DeleteKludge('FMPT')
    else
     SetKludge('FMPT', 'FMPT ' + LongToStr(Address.Point));
   end;
 end;

procedure TMessageBase.SetToAddress(var Address: TAddress);
 var
  FromAddress: TAddress;
 begin
  if GetFlag(afNetmail) then
   begin
    GetFromAddress(FromAddress);

    SetKludge('INTL', 'INTL ' + AddressToStrPointless(Address) + ' ' + AddressToStrPointless(FromAddress));

    if Address.Point = 0 then
     DeleteKludge('TOPT')
    else
     SetKludge('TOPT', 'TOPT ' + LongToStr(Address.Point));
   end;
 end;

procedure TMessageBase.SetFromAndToAddress(var FromAddress, ToAddress: TAddress; const FreshMSGID: Boolean);
 begin
  SetFromAddress(FromAddress, FreshMSGID);

  SetToAddress(ToAddress);
 end;

procedure TMessageBase.GetStringPChar(Line: PChar; MaxLen: Word);
 const
  BufferSize = 256;
 var
  Buffer: Array[1..BufferSize + 2] Of Char;
  SavePos, Size, StreamSize, K: Longint;
  LineSize: Longint;
 procedure PutBuffer;
  begin
   {s0t}
   if LineSize + Size > MaxLen then
    Size:=MaxLen - LineSize;
   {/s0t}

   if Size < 0 then
    Exit;

   Buffer[Size + 1]:=#0;

   ConcatASCIIZ(Line, @Buffer);

   Inc(LineSize, Size);
  end;
 begin
  Line[0]:=#0;

  LineSize:=0;

  StreamSize:=MessageText^.GetSize;

  SavePos:=MessageText^.GetPos;

  Dec(MaxLen);

  repeat
   Size:=StreamSize - SavePos;

   if Size <= 0 then
    Exit;

   if Size > BufferSize then
    Size:=BufferSize;

   MessageText^.Read(Buffer, Size);

   for K:=1 to Size do
    if Buffer[K] in [#13, #10] then
     begin
      Buffer[K]:=#0;

      if Buffer[K + 1] = #10 then
       begin
        PutBuffer;

        MessageText^.Seek(SavePos + K + 1);
       end
      else
       begin
        PutBuffer;

        MessageText^.Seek(SavePos + K);
       end;

      Exit;
     end;

   Buffer[Size + 1]:=#0;

   Inc(SavePos, Size);

   PutBuffer;
  until False;
 end;

procedure TMessageBase.GetString(var Line: String);
 var
  LinePChar: PChar;
 begin
  GetMem(LinePChar, SizeOf(String));

  GetStringPChar(LinePChar, SizeOf(String));

  Line:=FromASCIIZ(LinePChar);

  FreeMem(LinePChar, SizeOf(String));
 end;

procedure TMessageBase.PutStringPChar(Line: PChar);
 const
  B: System.Byte = 13;
 begin
  MessageText^.Write(Line^, LenASCIIZ(Line));
  MessageText^.Write(B, SizeOf(B));
 end;

procedure TMessageBase.PutString(const Line: String);
 var
  LinePChar: PChar;
 begin
  GetMem(LinePChar, Length(Line) + 1);

  ToASCIIZ(Line, LinePChar);

  PutStringPChar(LinePChar);

  FreeMem(LinePChar, Length(Line) + 1);
 end;

function TMessageBase.EndOfMessage: Boolean;
 begin
  EndOfMessage:=MessageText^.GetSize = MessageText^.GetPos;
 end;

procedure TMessageBase.SetTextPos(Position: Longint);
 begin
  MessageText^.Seek(Position);
 end;

function TMessageBase.GetTextPos: Longint;
 begin
  GetTextPos:=MessageText^.GetPos;
 end;

function TMessageBase.GetTextSize: Longint;
 begin
  GetTextSize:=MessageText^.GetSize;
 end;

procedure TMessageBase.TruncateText;
 begin
  MessageText^.Truncate;
 end;

procedure TMessageBase.ReadText(var Buf; Count: Word);
 begin
  MessageText^.Read(Buf, Count);
 end;

procedure TMessageBase.WriteText(var Buf; Count: Word);
 begin
  MessageText^.Write(Buf, Count);
 end;

function TMessageBase.GetAttribute(Attribute: Longint): Boolean;
 begin
  Abstract;
 end;

procedure TMessageBase.SetAttribute(Attribute: Longint; Enable: Boolean);
 begin
  Abstract;
 end;

procedure TMessageBase.GetWrittenDateTime(var DateTime: TMessageBaseDateTime);
 begin
  Abstract;
 end;

procedure TMessageBase.GetArrivedDateTime(var DateTime: TMessageBaseDateTime);
 begin
  Abstract;
 end;

procedure TMessageBase.SetWrittenDateTime(var DateTime: TMessageBaseDateTime);
 begin
  Abstract;
 end;

procedure TMessageBase.SetArrivedDateTime(var DateTime: TMessageBaseDateTime);
 begin
  Abstract;
 end;

function TMessageBase.WriteMessage: Boolean;
 begin
  Abstract;
 end;

function TMessageBase.WriteMessageHeader: Boolean;
 begin
  Abstract;
 end;

function TMessageBase.GetKludgePChar(const Name, Destination: PChar; const MaxLen: Word): Boolean;
 var
  NameL: Integer;
 begin
  NameL:=LenASCIIZ(Name);

  SetTextPos(0);

  while not EndOfMessage do
   begin
    KludgeStart:=GetTextPos;

    GetStringPChar(Destination, MaxLen);

    if CompLASCIIZ(Name, Destination, NameL) = 0 then
     begin
      KludgeEnd:=GetTextPos;

      GetKludgePChar:=True;

      Exit;
     end;
   end;

  GetKludgePChar:=False;
 end;

function TMessageBase.GetKludge(const Name: String; var Destination: String): Boolean;
 const
  DestinationSize = SizeOf(String);
 var
  AName, ADestination: PChar;
 begin
  GetMem(ADestination, DestinationSize);
  GetMem(AName, Length(Name) + 1);

  ToASCIIZ(Name, AName);

  GetKludge:=GetKludgePChar(AName, ADestination, DestinationSize - 1);

  Destination:=FromASCIIZ(ADestination);

  FreeMem(AName, Length(Name) + 1);
  FreeMem(ADestination, DestinationSize);
 end;

procedure TMessageBase.SetKludgePChar(const Name, Value: PChar);
 var
  Stream: PMessageBaseStream;
  Temp: PChar;
 begin
  GetMem(Temp, MaxLineSize);

  if GetKludgePChar(Name, Temp, MaxLineSize) then
   begin
    Stream:=CreateMessageBaseMemoryStream(MaxMessageSize);

    SetTextPos(KludgeEnd);

    Stream^.CopyFrom(MessageText^, GetTextSize - KludgeEnd);

    SetTextPos(KludgeStart);

    PutStringPChar(Value);

    Stream^.Seek(0);

    MessageText^.CopyFrom(Stream^, Stream^.GetSize);

    MessageText^.Truncate;

    Dispose(Stream, Done);
   end
  else
   AddKludgePChar(Value);

  FreeMem(Temp, MaxLineSize);
 end;

procedure TMessageBase.SetKludge(const Name, Value: String);
 var
  AName, AValue: PChar;
 begin
  GetMem(AName, Length(Name) + 1);
  GetMem(AValue, Length(Value) + 1);

  ToASCIIZ(Name, AName);
  ToASCIIZ(Value, AValue);

  SetKludgePChar(AName, AValue);

  FreeMem(AValue, Length(Value) + 1);
  FreeMem(AName, Length(Name) + 1);
 end;

procedure TMessageBase.DeleteKludgePChar(const Name: PChar);
 var
  Stream: PMessageBaseStream;
  Temp: PChar;
 begin
  GetMem(Temp, MaxLineSize);

  if GetKludgePChar(Name, Temp, MaxLineSize) then
   begin
    Stream:=CreateMessageBaseMemoryStream(MaxMessageSize);

    SetTextPos(KludgeEnd);

    Stream^.CopyFrom(MessageText^, GetTextSize - KludgeEnd);

    SetTextPos(KludgeStart);

    Stream^.Seek(0);

    MessageText^.CopyFrom(Stream^, Stream^.GetSize);

    MessageText^.Truncate;

    Dispose(Stream, Done);
   end;

  FreeMem(Temp, MaxLineSize);
 end;

procedure TMessageBase.DeleteKludge(const Name: String);
 var
  AName: PChar;
 begin
  GetMem(AName, Length(Name) + 1);

  ToASCIIZ(Name, AName);

  DeleteKludgePChar(AName);

  FreeMem(AName, Length(Name) + 1);
 end;

procedure TMessageBase.AddKludgePChar(const Value: PChar);
 var
  P: Longint;
  Stream: PMessageBaseStream;
 begin
  P:=AfterLastKludge;

  if P = GetTextSize then
   begin
    SetTextPos(P);

    PutStringPChar(Value);
   end
  else
   begin
    Stream:=CreateMessageBaseMemoryStream(MaxMessageSize);

    SetTextPos(P);

    Stream^.CopyFrom(MessageText^, GetTextSize - P);

    SetTextPos(P);

    PutStringPChar(Value);

    Stream^.Seek(0);

    MessageText^.CopyFrom(Stream^, Stream^.GetSize);

    MessageText^.Truncate;

    Dispose(Stream, Done);
   end;
 end;

procedure TMessageBase.AddKludge(const Value: String);
 var
  AValue: PChar;
 begin
  GetMem(AValue, Length(Value) + 1);

  ToASCIIZ(Value, AValue);

  AddKludgePChar(AValue);

  FreeMem(AValue, Length(Value) + 1);
 end;

function TMessageBase.GetMessageTextStream: PMessageBaseStream;
 begin
  GetMessageTextStream:=MessageText;
 end;

procedure TMessageBase.SetFlag(const Flag: Longint; const Enable: Boolean);
 begin
  if Enable then
   Flags:=Flags or Flag
  else
   Flags:=Flags and not Flag;
 end;

function TMessageBase.GetFlag(const Flag: Longint): Boolean;
 begin
  GetFlag:=Flags and Flag = Flag;
 end;

procedure TMessageBase.CheckFromAddress(const S: String; var Address: TAddress);
 var
  A: TAddress;
 begin
  if Copy(S, 1, 7) = 'MSGID:' then StrToAddress(ExtractWord(2, S, [' ']), Address);
  if Copy(S, 1, 5) = 'INTL'   then
   begin
    A.Point:=Address.Point;

    StrToAddress(ExtractWord(3, S, [' ']), Address);

    Address.Point:=A.Point;
   end else
  if Copy(S, 1, 5) = 'FMPT'   then StrToInteger(ExtractWord(2, S, [' ']), Address.Point);
 end;

procedure TMessageBase.CheckToAddress(const S: String; var Address: TAddress);
 var
  A: TAddress;
 begin
  if Copy(S, 1, 5) = 'INTL' then
   begin
    A.Point:=Address.Point;

    StrToAddress(ExtractWord(2, S, [' ']), Address);

    Address.Point:=A.Point;
   end else
  if Copy(S, 1, 5) = 'TOPT' then StrToInteger(ExtractWord(2, S, [' ']), Address.Point);
 end;

function TMessageBase.CreateNewMessage: Boolean;
 begin
  Abstract;
 end;

function TMessageBase.KillMessage: Boolean;
 begin
  Abstract;
 end;

function TMessageBase.GetLastRead(const UserNumber: Longint): Longint;
 begin
  Abstract;
 end;

procedure TMessageBase.SetLastRead(const UserNumber: Longint; const Value: Longint);
 begin
  Abstract;
 end;

procedure TMessageBase.ResetDateTime;
 var
  DateTime: TMessageBaseDateTime;
 begin
  GetCurrentMessageBaseDateTime(DateTime);

  SetWrittenDateTime(DateTime);
  SetArrivedDateTime(DateTime);
 end;

procedure TMessageBase.SetBaseType(const BaseType: TBaseType);
 begin
  SetFlag(afNetmail, BaseType = btNetmail);
  SetFlag(afEchomail, BaseType = btEchomail);
  SetFlag(afLocal, BaseType = btLocal);
 end;

procedure TMessageBase.PutOrigin(Address: TAddress; const Text: String);
 var
  S: String;
 begin
  S:=Concat(' * Origin:  (', AddressToStrEx(Address), ')');

  System.Insert(Copy(Text, 1, 79 - Length(S)), S, 12);

  PutString(S);
 end;

function TMessageBase.AfterLastKludge: Longint;
 var
  Line: PChar;
  Mode: (mKludge, mText);
  P, Lines: Longint;
 begin
  GetMem(Line, MaxLineSize);

  Mode:=mText;

  AfterLastKludge:=GetTextSize;

  SetTextPos(0);

  Lines:=0;

  while not EndOfMessage do
   begin
    P:=GetTextPos;

    GetStringPChar(Line, MaxLineSize);

    if Line[0] = #1 then Mode:=mKludge else
    if Mode = mKludge then
     begin
      AfterLastKludge:=P;

      Break;
     end
    else
     begin
      Inc(Lines);

      if Lines > 1 then
       Break;
     end;
   end;

  if Mode <> mKludge then
   AfterLastKludge:=0;

  FreeMem(Line, MaxLineSize);
 end;

procedure TMessageBase.SetMessageTextStream(const AMessageText: PMessageBaseStream);
 begin
  if MessageText <> nil then
   Dispose(MessageText, Done);

  MessageText:=AMessageText;
 end;

procedure TMessageBase.SetStatus(const AStatus: Longint);
 begin
  Status:=AStatus;
 end;

function TMessageBase.GetStatus: Longint;
 begin
  GetStatus:=Status;
 end;

procedure TMessageBase.SetOpened(const AOpened: Boolean);
 begin
  Opened:=AOpened;
 end;

function TMessageBase.GetOpened: Boolean;
 begin
  GetOpened:=Opened;
 end;

procedure TMessageBase.SetCurrent(const ACurrentMessage: Longint);
 begin
  CurrentMessage:=ACurrentMessage;
 end;

procedure TMessageBase.SetBasePath(const ABasePath: String);
 begin
  BasePath:=ABasePath;
 end;

function TMessageBase.GetBasePath: String;
 begin
  GetBasePath:=BasePath;
 end;

function TMessageBase.GetRead: Boolean;
 begin
  GetRead:=False;
 end;

procedure TMessageBase.SetRead(const Value: Boolean);
 begin
 end;

{* Stuff *}

procedure GetAttributesLine(B: PMessageBase; var S: String);
 begin
  S:='';

  if B^.GetAttribute(maPrivate) then S:=S + 'Pvt ';
  if B^.GetAttribute(maCrash) then S:=S + 'Cra ';
  if B^.GetAttribute(maReceived) then S:=S + 'Rcv ';
  if B^.GetAttribute(maSent) then S:=S + 'Snt ';
  if B^.GetAttribute(maAttach) then S:=S + 'Att ';
  if B^.GetAttribute(maTransit) then S:=S + 'Trs ';
  if B^.GetAttribute(maOrphan) then S:=S + 'Orp ';
  if B^.GetAttribute(maKill) then S:=S + 'K/s ';
  if B^.GetAttribute(maLocal) then S:=S + 'Loc ';
  if B^.GetAttribute(maHold) then S:=S + 'Hld ';
  if B^.GetAttribute(maFRq) then S:=S + 'FRq ';
  if B^.GetAttribute(maRRq) then S:=S + 'RRq ';
  if B^.GetAttribute(maRRc) then S:=S + 'RRc ';
  if B^.GetAttribute(maARq) then S:=S + 'ARq ';
  if B^.GetAttribute(maURq) then S:=S + 'URq ';
  if B^.GetAttribute(maScanned) then S:=S + 'Scn ';

  if Length(S) <> 0 then
   {$IFDEF DELPHI}
   SetLength(S, Length(S) - 1);
   {$ELSE}
   Dec(S[0]);
   {$ENDIF}
 end;

procedure GetDateTimeLine(var DT: TMessageBaseDateTime; var S: String);
 function LeadingZero(Number, Count: Longint): String;
  var
   S: String;
  begin
   S:=LongToStr(Number);

   while Length(S) < Count do
    S:='0' + S;

   LeadingZero:=S;
  end;
 begin
  S:=LeadingZero(DT.Year, 4) + '/' +
     LeadingZero(DT.Month, 2) + '/' +
     LeadingZero(DT.Day, 2) + ' ' +
     LeadingZero(DT.Hour, 2) + ':' +
     LeadingZero(DT.Min, 2) + ':' +
     LeadingZero(DT.Sec, 2) + '.' +
     LeadingZero(DT.Sec100, 2);
 end;

{ version }

function skMHLversion: String;
 begin
  skMHLversion:='0.1b24-avs2';
 end;

function skMHLtitle: String;
 begin
  skMHLtitle:= 'skMHL ' + skMHLversion;
 end;

function skMHLfulltitle: String;
 begin
  skMHLfulltitle:=skMHLtitle + ' (q) by sk // [rAN], 1998-2001; Port to fpc, *nix based OS by Andrew V. Sichevoi';
 end;

end.
