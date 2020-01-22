unit UUtil;

interface
uses System.SysUtils, System.Classes;
        function retornarPrimeiroDiaAno(data: TDateTime) : TDateTime;
        function DecomporTempo(TempoJogo: TTime): Integer;
        procedure Split(const Delimiter: Char; Value: string; const Strings: TStrings);
implementation

function retornarPrimeiroDiaAno(data: TDateTime) : TDateTime;
var
  dia, mes, ano: Word;
begin
 DecodeDate(data, ano, mes, dia);
 result:= EncodeDate(ano,1,1);
end;

function DecomporTempo(TempoJogo: TTime) : Integer;
var
  Hora, Minuto, Segundo:String;
begin
  Hora:= FormatDateTime('hh', TempoJogo);
  Minuto:= FormatDateTime('nn', TempoJogo);
  Segundo:= FormatDateTime('ss', TempoJogo);
  result:= (StrToInt(Hora)*60)+(StrToInt(Minuto)*60)+(StrToInt(Segundo)*60);
end;

procedure Split(const Delimiter: Char; Value: string;
  const Strings: TStrings);
var
  I: Integer;
begin
  for I := 0 to Value.Length-1 do
  begin
    if (Value.Substring(i,1) = Delimiter) then
    begin
       Continue;
    end;
    Strings.Add(Value.Substring(i,1));
  end;
end;

end.
