var respostaf,stringfinal:string;
    opcoesescolhiveisf:array[1..4] of string;
    opcaopescolherf:bool;

{$I 'ferramentas/alarme.pas'}
{$I 'ferramentas/relogio.pas'}

procedure Ferramentas;
  begin
       respostaf:='s';
       Beep(700,50);
       repeat
          stringfinal:='/_/    \___/_/  /_/   \__,_/_/ /_/ /_/\___/_/ /_/\__/\__,_/____/';
          textbackground(lightgray);
          textcolor(black);
          UpdateCrtDimensions;
          window(1,1,WindMaxX,WindMaxY);
          clrscr;
          cursoroff; //desativa o cursor
          writeln;
          writeln;
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
	  writeln('    ______                                          __            ');
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
	  writeln('   / ____/__  ______________ _____ ___  ___  ____  / /_____ ______');
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
	  writeln('  / /_  / _ \/ ___/ ___/ __ `/ __ `__ \/ _ \/ __ \/ __/ __ `/ ___/');
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
	  writeln(' / __/ /  __/ /  / /  / /_/ / / / / / /  __/ / / / /_/ /_/ (__  ) ');
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
          writeln(stringfinal);
	  Delay(100);
          writeln;
          writeln;
          writeln;
          im1:=1;
          opcoesescolhiveisf[1]:='Temporizador';       //Definir todas as opções
          opcoesescolhiveisf[2]:='Relógio';
          opcoesescolhiveisf[3]:='Jogos';
          opcoesescolhiveisf[4]:='Voltar';
          while (im1<=length(opcoesescolhiveisf)) do  //'Animação' das opções disponiveis e o seu centramento
            begin
              writeln;
              GotoXY(((WindMaxX+1 - Length(opcoesescolhiveisf[im1])) div 2),WhereY);
              writeln(opcoesescolhiveisf[im1]);
              Delay(100);
              im1:=im1+1;
            end;
          cursorp:=1;
          GotoXY(((WindMaxX+1 - Length(opcoesescolhiveisf[cursorp])) div 2),cursorp+11);      //Escolher as opções apartir das "arrow keys", definir cor ciano para a opcao pre-selecionada e cor default para a que deixou de ser pre-selecionada
          TextColor(cyan);
          writeln(opcoesescolhiveisf[cursorp]);
          opcaopescolherf:=true;
          while opcaopescolherf do
            begin
              rk:=readkey;
              if (rk=#80)then
                begin
                  GotoXY(((WindMaxX+1 - Length(opcoesescolhiveisf[cursorp])) div 2),(cursorp)*2+10);
                  TextColor(black);
                  writeln(opcoesescolhiveisf[cursorp]);
                  if (cursorp=Length(opcoesescolhiveisf)) then
                    cursorp:=0;
                  cursorp:=cursorp+1;
                  GotoXY(((WindMaxX+1 - Length(opcoesescolhiveisf[cursorp])) div 2),cursorp*2+10);
                  TextColor(cyan);
                  writeln(opcoesescolhiveisf[cursorp]);
                  Beep(400,50);
                end
              else if (rk=#72) then
                begin
                  GotoXY(((WindMaxX+1 - Length(opcoesescolhiveisf[cursorp])) div 2),(cursorp)*2+10);
                  TextColor(black);
                  writeln(opcoesescolhiveisf[cursorp]);
                  if (cursorp=1) then
                    cursorp:=Length(opcoesescolhiveisf)+1;
                  cursorp:=cursorp-1;
                  GotoXY(((WindMaxX+1 - Length(opcoesescolhiveisf[cursorp])) div 2),cursorp*2+10);
                  TextColor(cyan);
                  writeln(opcoesescolhiveisf[cursorp]);
                  Beep(400,50);
                end
              else if (rk=#13) then
                begin
                  case cursorp of
                    1:
                      begin
                        Beep(700,50);
                        ProcedureTemporizador();
                        opcaopescolherf:=false;
                      end;
                    2:
                      begin
                        Beep(700,50);
                        AbrirRelogio();
                        opcaopescolherf:=false;
                      end;
                    3:
                      begin
                        opcaopescolherf:=false;
                      end;
                    4:
                      begin
                        respostaf:='n';
                        opcaopescolherf:=false;
                        Beep(300,50);
                      end;
                  end;
                end;
            end;
       until (lowercase(respostaf)<>'s');
  end;

