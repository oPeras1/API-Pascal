var respostop:string;
    resultado:real;
    poperando,soperando,valorsalto,lenghtescolha:integer;
    opcoesescolhiveisop:array[1..8] of string;
    opcaopescolherop:bool;

procedure Operacoes;
  begin
    Beep(700,50);
    respostop:='s';
    stringfinal:='\____/ .___/\___/_/   \__,_/\___/\____/\___/____/';
    textbackground(lightgray);
    textcolor(black);
    clrscr;
    cursoroff; //desativa o cursor
    writeln;
    writeln;
    lenghtescolha:=(WindMaxX+1 - Length(stringfinal)+3) div 2+10;
    GotoXY(lenghtescolha-10,WhereY);
    writeln('   ____                              ___');
    GotoXY(lenghtescolha-10,WhereY);
    writeln('  / __ \____  ___  _________ _______//\/ ___  _____');
    GotoXY(lenghtescolha-10,WhereY);
    writeln(' / / / / __ \/ _ \/ ___/ __ `/ ___/ __ \/ _ \/ ___/');
    GotoXY(lenghtescolha-10,WhereY);
    writeln('/ /_/ / /_/ /  __/ /  / /_/ / /__/ /_/ /  __(__  )');
    GotoXY(lenghtescolha-10,WhereY);
    writeln(stringfinal);
    GotoXY(lenghtescolha-10,WhereY);
    writeln('    /_/                     /_)');
    writeln;
    writeln;
    window(1,WhereY,WindMaxX,WindMaxY);
    repeat
      clrscr;
      stringfinal:='Introduza o primeiro operando: ';
      GotoXY(lenghtescolha-10,WhereY);
      write(stringfinal);
      readln(poperando);
      writeln;
      stringfinal:='Introduza o segundo operando: ';
      GotoXY(lenghtescolha-10,WhereY);
      write(stringfinal);
      readln(soperando);
      writeln;
      stringfinal:='Escolha uma das seguintes op��es para a opera��o a realizar:';
      GotoXY(lenghtescolha-10,WhereY);
      write(stringfinal);
      writeln;
      im1:=1;
      opcoesescolhiveisop[1]:='o Adi��o';       //Definir todas as op��es
      opcoesescolhiveisop[2]:='o Subtra��o';
      opcoesescolhiveisop[3]:='o Multiplica��o';
      opcoesescolhiveisop[4]:='o Divis�o';
      opcoesescolhiveisop[5]:='o Quociente da Divis�o Inteira';
      opcoesescolhiveisop[6]:='o Resto da Divis�o Inteira';
      opcoesescolhiveisop[7]:='o Potencia��o';
      opcoesescolhiveisop[8]:='o Raiz com �ndice';
      while (im1<=length(opcoesescolhiveisop)) do  //'Anima��o' das op��es disponiveis e o seu centramento
        begin
          writeln;
          GotoXY(lenghtescolha,WhereY);
          writeln(opcoesescolhiveisop[im1]);
          im1:=im1+1;
        end;
      cursorp:=1;
      GotoXY(lenghtescolha,WhereY-Length(opcoesescolhiveisop)*2+1);      //Escolher as op��es apartir das "arrow keys", definir cor ciano para a opcao pre-selecionada e cor default para a que deixou de ser pre-selecionada
      TextColor(cyan);
      writeln(opcoesescolhiveisop[cursorp]);
      opcaopescolherop:=true;
      while opcaopescolherop do
        begin
          rk:=readkey;
          if (rk=#80)then
            begin
              valorsalto:=WhereY;
              GotoXY(lenghtescolha,valorsalto-1);
              TextColor(black);
              writeln(opcoesescolhiveisop[cursorp]);
              valorsalto:=WhereY;
              if (cursorp=Length(opcoesescolhiveisop)) then
                begin
                  valorsalto:=WhereY-Length(opcoesescolhiveisop)*2;
                  cursorp:=0;
                end;
              cursorp:=cursorp+1;
              GotoXY(lenghtescolha,valorsalto+1);
              TextColor(cyan);
              writeln(opcoesescolhiveisop[cursorp]);
              Beep(400,50);
            end
          else if (rk=#72) then
            begin
              valorsalto:=WhereY;
              GotoXY(lenghtescolha,valorsalto-1);
              TextColor(black);
              writeln(opcoesescolhiveisop[cursorp]);
              valorsalto:=WhereY;
              if (cursorp=1) then
                begin
                  valorsalto:=WhereY+Length(opcoesescolhiveisop)*2;
                  cursorp:=Length(opcoesescolhiveisop)+1;
                end;
              cursorp:=cursorp-1;
              GotoXY(lenghtescolha,valorsalto-3);
              TextColor(cyan);
              writeln(opcoesescolhiveisop[cursorp]);
              Beep(400,50);
            end
          else if (rk=#13) then
            begin
              TextColor(black);
              valorsalto:=WhereY;
              GotoXY(lenghtescolha,valorsalto-1);
              writeln(opcoesescolhiveisop[cursorp]);
              case cursorp of
                1:
                  begin
                       resultado:=poperando+soperando;
                       opcaopescolherop:=false;
                  end;
                2:
                  begin
                       resultado:=poperando-soperando;
                       opcaopescolherop:=false;
                  end;
                3:
                  begin
                       resultado:=poperando*soperando;
                       opcaopescolherop:=false;
                  end;
                4:
                  begin
                       resultado:=poperando/soperando;
                       opcaopescolherop:=false;
                  end;
                5:
                  begin
                       resultado:=poperando DIV soperando;
                       opcaopescolherop:=false;
                  end;
                6:
                  begin
                       resultado:=poperando MOD soperando;
                       opcaopescolherop:=false;
                  end;
                7:
                  begin
                       resultado:=power(poperando,soperando);
                       opcaopescolherop:=false;
                  end;
                8:
                  begin
                       resultado:=exp(ln(soperando)/poperando);
                       opcaopescolherop:=false;
                  end;
              end;
              GotoXY(lenghtescolha-10,WhereY+(Length(opcoesescolhiveisop)-cursorp)*2+1);
              writeln('O resultado da opera��o �: ',resultado);
            end;
        end;
        GotoXY(lenghtescolha-10,WhereY+2);
        write('Pretende repetir? (S/N) ');
        readln(respostop);
    until (lowercase(respostop)<>'s');
    window(1,1,WindMaxX,WindMaxY);
  end;
