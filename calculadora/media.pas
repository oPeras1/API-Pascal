var respostam:string;
    nummedia,iloop:integer;
    somamedia,valorintroduzido:real;

procedure Media;
  begin
    Beep(700,50);
    respostam:='s';
    stringfinal:='\____/\__,_/_/\___/\__,_/_/\____/   \__,_/\___/  /_/  /_/\___/\__,_/_/\__,_/  ';
    textbackground(lightgray);
    textcolor(black);
    clrscr;
    cursoroff; //desativa o cursor
    writeln;
    writeln;
    lenghtescolha:=(WindMaxX+1 - Length(stringfinal)+3) div 2+10;
    GotoXY(lenghtescolha-10,WhereY);
    writeln('   ______      __           __             __        __  ___ __      ___      ');
    GotoXY(lenghtescolha-10,WhereY);
    writeln('  / ____/___ _/ /______  __/ /___     ____/ /__     /  |/  //_/ ____/ (_)___ _');
    GotoXY(lenghtescolha-10,WhereY);
    writeln(' / /   / __ `/ / ___/ / / / / __ \   / __  / _ \   / /|_/ / _ \/ __  / / __ `/');
    GotoXY(lenghtescolha-10,WhereY);
    writeln('/ /___/ /_/ / / /__/ /_/ / / /_/ /  / /_/ /  __/  / /  / /  __/ /_/ / / /_/ / ');
    GotoXY(lenghtescolha-10,WhereY);
    writeln(stringfinal);
    writeln;
    writeln;
    window(1,WhereY,WindMaxX,WindMaxY);
    repeat
      clrscr;
      somamedia:=0;
      repeat
        GotoXY(lenghtescolha-10,WhereY);
        write('Pretende fazer a m�dia de quantos elementos? ');
        readln(nummedia);
        writeln;
        if (nummedia<=0) then
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
      until (nummedia>0);
      for iloop:=1 to nummedia do
        begin
          GotoXY(lenghtescolha,WhereY);
          write('Introduza um valor: ');
          readln(valorintroduzido);
          somamedia:=somamedia+valorintroduzido;
          writeln;
        end;
      GotoXY(lenghtescolha-10,WhereY);
      writeln('A m�dia dos ',nummedia,' valores inseridos �:', somamedia/nummedia);
      GotoXY(lenghtescolha-10,WhereY+2);
      write('Pretende repetir? (S/N) ');
      readln(respostam);
    until (lowercase(respostam)<>'s');
    window(1,1,WindMaxX,WindMaxY);
  end;
