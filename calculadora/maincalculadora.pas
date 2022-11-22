var respostac:string;
    opcoesescolhiveisc:array[1..4] of string;
    opcaopescolherc:bool;

procedure Calculadora;
  begin
       Beep(700,50);
       respostac:='s';
       repeat
          stringfinal:='\____/\__,_/_/\___/\__,_/_/\__,_/\__,_/\____/_/   \__,_/';
          textbackground(lightgray);
          textcolor(black);
          clrscr;
          cursoroff; //desativa o cursor
          writeln;
          writeln;
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
	  writeln('   ______      __           __          __');
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
	  writeln('  / ____/___ _/ /______  __/ /___ _____/ /___  _________ _');
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
	  writeln(' / /   / __ `/ / ___/ / / / / __ `/ __  / __ \/ ___/ __ `/');
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
	  writeln('/ /___/ /_/ / / /__/ /_/ / / /_/ / /_/ / /_/ / /  / /_/ /');
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
          writeln(stringfinal);
	  Delay(100);
          writeln;
          writeln;
          writeln;
          im1:=1;
          opcoesescolhiveisc[1]:='Operações';       //Definir todas as opções
          opcoesescolhiveisc[2]:='Média';
          opcoesescolhiveisc[3]:='Equações - Incógnita';
          opcoesescolhiveisc[4]:='Voltar';
          while (im1<=length(opcoesescolhiveisc)) do  //'Animação' das opções disponiveis e o seu centramento
            begin
              writeln;
              GotoXY(((WindMaxX+1 - Length(opcoesescolhiveisc[im1])) div 2),WhereY);
              writeln(opcoesescolhiveisc[im1]);
              Delay(100);
              im1:=im1+1;
            end;
          cursorp:=1;
          GotoXY(((WindMaxX+1 - Length(opcoesescolhiveisc[cursorp])) div 2),cursorp+11);      //Escolher as opções apartir das "arrow keys", definir cor ciano para a opcao pre-selecionada e cor default para a que deixou de ser pre-selecionada
          TextColor(cyan);
          writeln(opcoesescolhiveisc[cursorp]);
          opcaopescolherc:=true;
          while opcaopescolherc do
            begin
              rk:=readkey;
              if (rk=#80)then
                begin
                  GotoXY(((WindMaxX+1 - Length(opcoesescolhiveisc[cursorp])) div 2),(cursorp)*2+10);
                  TextColor(black);
                  writeln(opcoesescolhiveisc[cursorp]);
                  if (cursorp=Length(opcoesescolhiveisc)) then
                    cursorp:=0;
                  cursorp:=cursorp+1;
                  GotoXY(((WindMaxX+1 - Length(opcoesescolhiveisc[cursorp])) div 2),cursorp*2+10);
                  TextColor(cyan);
                  writeln(opcoesescolhiveisc[cursorp]);
                  Beep(400,50);
                end
              else if (rk=#72) then
                begin
                  GotoXY(((WindMaxX+1 - Length(opcoesescolhiveisc[cursorp])) div 2),(cursorp)*2+10);
                  TextColor(black);
                  writeln(opcoesescolhiveisc[cursorp]);
                  if (cursorp=1) then
                    cursorp:=Length(opcoesescolhiveisc)+1;
                  cursorp:=cursorp-1;
                  GotoXY(((WindMaxX+1 - Length(opcoesescolhiveisc[cursorp])) div 2),cursorp*2+10);
                  TextColor(cyan);
                  writeln(opcoesescolhiveisc[cursorp]);
                  Beep(400,50);
                end
              else if (rk=#13) then
                begin
                  writeln(cursorp);
                  case cursorp of
                    1:
                      begin
                           ProcedureTemporizador();
                           opcaopescolherc:=false;
                      end;
                    2:
                      begin
                          opcaopescolherc:=false;
                      end;
                    3:
                      begin
                          opcaopescolherc:=false;
                      end;
                    4:
                      begin
                          respostac:='n';
                          opcaopescolherc:=false;
                          Beep(300,50);
                      end;
                  end;
                end;
            end;
       until (lowercase(respostac)<>'s');
  end;

