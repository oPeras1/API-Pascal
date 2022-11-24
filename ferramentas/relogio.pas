var respostahoras,stringdia:string;
    numeros:array[1..10,1..6] of string;
    quadrado:array[1..4] of string;
    year, month, day, hr, min, sec, ms: Word;
    ano, mes, dia, hora, minuto, segundo, mssegundo: string;
    num:array[1..4] of integer;
    loopnum:integer;
    aparecer:bool;

procedure AbrirRelogio;
  begin
    numeros[2][1]:='   ___ ';
    numeros[2][2]:='  |_  |';
    numeros[2][3]:='    | |';
    numeros[2][4]:='    | |';
    numeros[2][5]:='    | |';
    numeros[2][6]:='    |_|';
    numeros[3][1]:=' _____ ';
    numeros[3][2]:='|___  |';
    numeros[3][3]:=' ___| |';
    numeros[3][4]:='| ____|';
    numeros[3][5]:='| |___ ';
    numeros[3][6]:='|_____|';
    numeros[4][1]:=' _____ ';
    numeros[4][2]:='|___  |';
    numeros[4][3]:=' ___| |';
    numeros[4][4]:='|___  |';
    numeros[4][5]:=' ___| |';
    numeros[4][6]:='|_____|';
    numeros[5][1]:=' _   _ ';
    numeros[5][2]:='| | | |';
    numeros[5][3]:='| |_| |';
    numeros[5][4]:='|___  |';
    numeros[5][5]:='    | |';
    numeros[5][6]:='    |_|';
    numeros[6][1]:=' _____ ';
    numeros[6][2]:='|  ___|';
    numeros[6][3]:='| |___ ';
    numeros[6][4]:='|___  |';
    numeros[6][5]:=' ___| |';
    numeros[6][6]:='|_____|';
    numeros[7][1]:=' _____ ';
    numeros[7][2]:='|  ___|';
    numeros[7][3]:='| |___';
    numeros[7][4]:='|  _  |';
    numeros[7][5]:='| |_| |';
    numeros[7][6]:='|_____|';
    numeros[8][1]:=' _____ ';
    numeros[8][2]:='|___  |';
    numeros[8][3]:='    | |';
    numeros[8][4]:='    | |';
    numeros[8][5]:='    | |';
    numeros[8][6]:='    |_|';
    numeros[9][1]:=' _____ ';
    numeros[9][2]:='|  _  |';
    numeros[9][3]:='| |_| |';
    numeros[9][4]:='|  _  |';
    numeros[9][5]:='| |_| |';
    numeros[9][6]:='|_____|';
    numeros[10][1]:=' _____ ';
    numeros[10][2]:='|  _  |';
    numeros[10][3]:='| |_| |';
    numeros[10][4]:='|___  |';
    numeros[10][5]:='    | |';
    numeros[10][6]:='    |_|';
    numeros[1][1]:=' _____ ';
    numeros[1][2]:='|  _  |';
    numeros[1][3]:='| | | |';
    numeros[1][4]:='| | | |';
    numeros[1][5]:='| |_| |';
    numeros[1][6]:='|_____|';
    quadrado[1]:=' _ ';
    quadrado[2]:='|_|';
    quadrado[3]:=' _ ';
    quadrado[4]:='|_|';
    respostahoras:='s';
    repeat
      textbackground(lightgray);
      textcolor(black);
      clrscr;
      cursoroff; //desativa o cursor
      stringfinal:='/_/ |_|\___/_/\____/\__, /_/\____/';
      writeln;
      writeln;
      GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
      writeln('    ____       __  __        _     ');
      GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
      writeln('   / __ \___  / /_/_/ ____ _(_)___ ');
      GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
      writeln('  / /_/ / _ \/ / __ \/ __ `/ / __ \');
      GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
      writeln(' / _, _/  __/ / /_/ / /_/ / / /_/ /');
      GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
      writeln('/_/ |_|\___/_/\____/\__, /_/\____/');
      GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
      writeln('                   /____/');
      writeln;
      writeln;
      aparecer:=true;
      loopnum:=0;
      while respostahoras='s' do
        begin
          window(((WindMaxX - Length(stringfinal)) div 2),12,WindMaxX, WindMaxY);
          DecodeTime(Time,hr, min, sec, ms);
          if (loopnum mod 1000 = 0) then
            begin
              clrscr;
              hora:=VarToStr(hr);
              if (Length(hora)=1) then
                hora:='0'+hora;
              for im1:=1 to Length(hora) do
                begin
                     num[im1]:=StrToInt(Copy(hora,im1,1));
                end;
              minuto:=VarToStr(min);
              if (Length(minuto)=1) then
                minuto:='0'+minuto;
              for im1:=1 to Length(minuto) do
                begin
                     num[im1+2]:=StrToInt(Copy(minuto,im1,1));
                end;
              for im1:=1 to 6 do
                begin
                     write(numeros[num[1]+1][im1]);
                     write(numeros[num[2]+1][im1]);
                     if (im1<6) and (im1>1) then
                       begin
                         if (aparecer) then
                           begin
                             write('  ',quadrado[im1-1],' ');
                             write(numeros[num[3]+1][im1]);
                             writeln(numeros[num[4]+1][im1]);
                           end
                         else
                           begin
                             write('      ');
                             write(numeros[num[3]+1][im1]);
                             writeln(numeros[num[4]+1][im1]);
                           end;
                       end
                     else
                       begin
                         write('      ',numeros[num[3]+1][im1]);
                         writeln(numeros[num[4]+1][im1]);
                       end;
                end;
              if (aparecer) then
                aparecer:=false
              else
                aparecer:=true;
              DecodeDate(Date,year,month,day);
              window(1,22,WindMaxX, WindMaxY);
              clrscr;
              stringdia:='Hoje é '+LongDayNames[DayOfWeek(Date)]+', dia '+VarToStr(day)+' de '+LongMonthNames[month]+' do ano de '+VarToStr(year);
              GotoXY(((WindMaxX - Length(stringdia)) div 2),WhereY);
              writeln(stringdia);
              window(((WindMaxX - Length(stringfinal)) div 2),12,WindMaxX, WindMaxY);
            end;
          window(1,22,WindMaxX, WindMaxY);
          stringdia:='São '+VarToStr(hr)+' h, '+VarToStr(min)+' min, '+VarToStr(sec)+' sec e '+VarToStr(ms)+' ms';
          GotoXY(((WindMaxX - Length(stringdia)) div 2),WhereY+1);
          DelLine;
          writeln(stringdia);
          Delay(10);
          loopnum:=loopnum+20;
          if (KeyPressed) then
            begin
              rk:=readkey;
              if (rk=#27) then
                respostahoras:='n';
            end;
        end;
    until (lowercase(respostahoras)<>'s');
    window(1,1,WindMaxX,WindMaxY);
    clrscr;
  end;
