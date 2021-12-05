uses
     skMHL,
     skOpen,
     skCommon;

var
 Base: PMessageBase;
 Sender, Receiver: TAddress;
 S   : String;
begin

 if not OpenMessageBase(Base, 'F/tmp/MSG') then
  begin
   WriteLn('Failed to open netmail: ', ExplainStatus(OpenStatus));
   Halt(255);
  end;

 Base^.SetBaseType(btNetmail); 
 Base^.Seek(Base^.GetHighest); {��������� � ������ ���������� ���������}
 
 if not Base^.OpenMessage then begin
  Writeln('Can''t open message!');
  Halt(1);
 End;

 Writeln('FROM: ', Base^.GetFrom);
 Writeln('TO  : ', Base^.GetTo);
 Writeln('SUBJ: ', Base^.GetSubject);
 
 While Not Base^.EndOfMessage Do Begin
  Base^.GetString(S);
  If (S[1] <> #1) Then Writeln(S); {���� ������ �� �������� �������, ��}
 End;			           {������� ������}


 Base^.CloseMessage;
 CloseMessageBase(Base);
end.