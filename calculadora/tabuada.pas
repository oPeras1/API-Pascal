var respostatab:string;
    numtabuada,quanttabuada,ilooptab:integer;

procedure Tabuada;
  begin
    Beep(700,50);
    respostatab:='s';
    stringfinal:='/_/  \__,_/_.___/\__,_/\__,_/\__,_/\__,_/  ';
    textbackground(lightgray);
    textcolor(black);
    clrscr;
    cursoroff; //desativa o cursor
    writeln;
    writeln;
    lenghtescolha:=(WindMaxX+1 - Length(stringfinal)+3) div 2+10;
    GotoXY(lenghtescolha-10,WhereY);
    writeln('  ______      __                    __     ');
    GotoXY(lenghtescolha-10,WhereY);
    writeln(' /_  __/___ _/ /_  __  ______ _____/ /___ _');
    GotoXY(lenghtescolha-10,WhereY);
    writeln('  / / / __ `/ __ \/ / / / __ `/ __  / __ `/');
    GotoXY(lenghtescolha-10,WhereY);
    writeln(' / / / /_/ / /_/ / /_/ / /_/ / /_/ / /_/ / ');
    GotoXY(lenghtescolha-10,WhereY);
    writeln(stringfinal);
    writeln;
    writeln;
    window(1,WhereY,WindMaxX,WindMaxY);
    repeat
      clrscr;
      somamedia:=0;
      GotoXY(lenghtescolha-10,WhereY);
      write('Pretende fazer a tabuada de que n�mero? ');
      readln(numtabuada);
      repeat
        writeln;
        GotoXY(lenghtescolha-10,WhereY);
        write('Pretende fazer a tabuada at� que n�mero? ');
        readln(quanttabuada);
        writeln;
        if (quanttabuada<=0) then
          begin
            textcolor(red);
            stringfinal:='______N�mero Inv�lido______';
            GotoXY(lenghtescolha-5,WhereY);
            writeln('______               ______');
            GotoXY(lenghtescolha-5,WhereY);
            writeln(stringfinal);
            writeln;
            writeln;
            textcolor(black);
          end;
      until (quanttabuada>0);
      for ilooptab:=1 to quanttabuada do
        begin
          GotoXY(lenghtescolha,WhereY);
          writeln(numtabuada,' x ',ilooptab,' = ',numtabuada*ilooptab);
          writeln;
        end;
      GotoXY(lenghtescolha-10,WhereY);
      write('Pretende repetir? (S/N) ');
      readln(respostatab);
    until (lowercase(respostatab)<>'s');
    window(1,1,WindMaxX,WindMaxY);
  end;
