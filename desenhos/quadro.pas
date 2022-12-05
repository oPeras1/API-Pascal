var quadropos:array of array of integer;
    cores,coratual,corantiga,yquadro,posx,posy,ymax,x,y,xcoratual,ycoratual,windmaxxoriginal,windmaxyoriginal:integer;
    quadroproc:bool;

procedure Quadro;
  begin
      quadroproc:=true;
      stringfinal:='\___\_\__,_/\__,_/\__,_/_/   \____/ ';
      textbackground(lightgray);
      textcolor(black);
      clrscr;
      cursoroff; //desativa o cursor
      writeln;
      writeln;
      GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
      writeln('   ____                  __         ');
      GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
      writeln('  / __ \__  ______ _____/ /________ ');
      GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
      writeln(' / / / / / / / __ `/ __  / ___/ __ \');
      GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
      writeln('/ /_/ / /_/ / /_/ / /_/ / /  / /_/ /');
      GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
      writeln(stringfinal);
      Delay(100);
      writeln;
      writeln;
      windmaxxoriginal:=WindMaxX;
      windmaxyoriginal:=WindMaxY;
      write('   ESC - SAIR   |   ENTER - Pintar   |   Setas - Mover   |   Cores: ');
      coratual:=8;
      for cores:=1 to 16 do
        begin
          textcolor(black);
          if (cores<=12) then
            write(' F',cores,' - ')
          else
            write(' ',cores-12,' - ');
          textbackground(cores-1);
          if (cores-1=15) then
            textcolor(Blink);
          write(' ');
          textcolor(black);
          textbackground(lightgray);
          write('  ');
        end;
      xcoratual:=WhereX;
      ycoratual:=WhereY;
      write('   |   Cor Atual: ');
      textbackground(coratual-1);
      if (cores-1=15) then
        textcolor(Blink);
      writeln(' ');
      textcolor(black);
      textbackground(lightgray);
      yquadro:=WhereY+2;
      ymax:=WindMaxY-WhereY-4;
      window(2,yquadro,WindMaxX-1,WindMaxY-1);
      textbackground(yellow);
      clrscr;
      window(4,yquadro+1,WindMaxX-2,WindMaxY);
      SetLength(quadropos, WindMaxX, WindMaxY-1);
      for x:=1 to length(quadropos) do
          for y:=1 to length(quadropos[x-1]) do
              quadropos[x-1][y]:=0;
      textbackground(black);
      clrscr;
      posx:=1;
      posy:=1;
      GotoXY(posx,posy);
      textbackground(coratual-1);
      write(' ');
      GotoXY(posx,posy);
      while quadroproc do
        begin
          rk:=readkey;
          corantiga:=coratual;
          if (rk=#77) or (rk=#75) or (rk=#72) or (rk=#80) then
            begin
              if (rk=#77) then //direita
                begin
                  GotoXY(posx,posy);
                  textbackground(quadropos[posx][posy]);
                  if (quadropos[posx][posy]=15) then
                    textcolor(Blink);
                  write(' ');
                  textcolor(black);
                  GotoXY(posx,posy);
                  if (posx+1)<=(WindMaxX-3) then
                    posx:=posx+1;
                end
              else if (rk=#75) then //esquerda
                begin
                  GotoXY(posx,posy);
                  textbackground(quadropos[posx][posy]);
                  if (quadropos[posx][posy]=15) then
                    textcolor(Blink);
                  write(' ');
                  textcolor(black);
                  GotoXY(posx,posy);
                  if (posx-1)>=1 then
                    posx:=posx-1;

                end
              else if (rk=#72) then //cima
                begin
                  GotoXY(posx,posy);
                  textbackground(quadropos[posx][posy]);
                  if (quadropos[posx][posy]=15) then
                    textcolor(Blink);
                  write(' ');
                  textcolor(black);
                  GotoXY(posx,posy);
                  if (posy-1)>=1 then
                    posy:=posy-1;

                end
              else if (rk=#80) then //baixo
                begin
                  GotoXY(posx,posy);
                  textbackground(quadropos[posx][posy]);
                  if (quadropos[posx][posy]=15) then
                    textcolor(Blink);
                  write(' ');
                  textcolor(black);
                  GotoXY(posx,posy);
                  if (posy+1)<=ymax then
                    posy:=posy+1;
                end;
              GotoXY(posx,posy);
              textbackground(coratual-1);
              write(' ');
              GotoXY(posx,posy)
            end
          else if (rk=#13) then //Enter
              begin
                quadropos[posx][posy]:=coratual-1;
              end
          else if (rk=#59) then //Definir cores
              coratual:=1
          else if (rk=#60) then //Definir cores
              coratual:=2
          else if (rk=#61) then //Definir cores
              coratual:=3
          else if (rk=#62) then //Definir cores
              coratual:=4
          else if (rk=#63) then //Definir cores
              coratual:=5
          else if (rk=#64) then //Definir cores
              coratual:=6
          else if (rk=#65) then //Definir cores
              coratual:=7
          else if (rk=#66) then //Definir cores
              coratual:=8
          else if (rk=#67) then //Definir cores
              coratual:=9
          else if (rk=#68) then //Definir cores
              coratual:=10
          else if (rk=#133) then //Definir cores
              coratual:=11
          else if (rk=#134) then //Definir cores
              coratual:=12
          else if (rk='1') then //Definir cores
              coratual:=13
          else if (rk='2') then //Definir cores
              coratual:=14
          else if (rk='3') then //Definir cores
              coratual:=15
          else if (rk='4') then //Definir cores
              coratual:=16
          else if (rk=#27) then //Sair
              quadroproc:=false;
          if (corantiga<>coratual) then
            begin
              corantiga:=coratual;
              window(1,1,windmaxxoriginal,windmaxyoriginal);
              GotoXY(xcoratual,ycoratual);
              textbackground(lightgray);
              textcolor(black);
              write('   |   Cor Atual: ');
              textbackground(coratual-1);
              if (coratual-1=15) then
                textcolor(Blink);
              writeln(' ');
              textcolor(black);
              textbackground(lightgray);
              window(4,yquadro+1,WindMaxX-2,WindMaxY);
              textbackground(coratual-1);
              GotoXY(posx,posy);
              if (coratual-1=15) then
                textcolor(Blink);
              write(' ');
              textcolor(black);
              GotoXY(posx,posy);
            end;
        end;
      clrscr;
  end;
