var tempo,opcao,mult,i,tempowait,tempoloop:integer;
    opcaos,respostaa:string;
    rk:char;


procedure Temporizador;
     begin
       tempoloop:=1000;
       for i:=tempo downto 1 do
             begin
                 write('   Temporizador definido para ', tempo,' segundos.');
                 if (KeyPressed) then
                   begin
                     rk:=readkey;
                     if (rk=#13)then
                        tempoloop:=0;
                   end;
                 if (i=1) and (tempoloop>0) then
                     write('   Tempo restante: ', i, ' segundo')
                 else if (tempoloop>0) then
                     write('   Tempo restante: ', i, ' segundos');
                 write('   [Enter] para desativar');
                 Delay(tempoloop);
                 if (KeyPressed) then
                   begin
                     rk:=readkey;
                     if (rk=#13)then
                        tempoloop:=0;
                   end;
                 DelLine;
                 GotoXY(1,25);
                 if (i<=1) and (tempoloop>0) then
                   begin
                     write('   Temporizador definido para ', tempo,' segundos.');
                     write('   Tempo restante: 0 segundos');
                     GotoXY(1,25);
                     DelLine;
                   end;
                 if (tempoloop=0) then
                   begin;
                     GotoXY(1,24);
                     DelLine;
                     break;
                   end;
             end;
        if (tempoloop>0) then
           begin
                write('   Alarme ativo! [Enter] para desativar.');
                while (tempoloop>0) do
                   begin
                       Beep(2500,100);
                       Delay(25);
                       if (KeyPressed) then
                          begin
                            rk:=readkey;
                            if (rk=#13)then
                               tempoloop:=0;
                               DelLine;
                               GotoXY(1,WhereY);
                               writeln('   Alarme desativado!')
                          end;
                   end;
           end

     end;

procedure ProcedureTemporizador;
         begin
                 cursoron;
		 repeat
		   textbackground(lightgray);
                   textcolor(black);
                   clrscr;
		   writeln('                                                                                   ___________________');
		   writeln('                                                                                  /                   \');
		   writeln('                                                                                 /   ______---______   \');
		   writeln('     ______                                _                 __                 /   /               \   \');
		   writeln('    /_  __/__  ____ ___  ____  ____  _____(_)___  ____ _____/ /___  _____      {   /    _     _   _  \   }');
		   writeln('     / / / _ \/ __ `__ \/ __ \/ __ \/ ___/ /_  / / __ `/ __  / __ \/ ___/      |  {    | | . | | | |  }  |-`');
		   writeln('    / / /  __/ / / / / / /_/ / /_/ / /  / / / /_/ /_/ / /_/ / /_/ / /          |  |    |_| . |_| |_|  |  | |');
		   writeln('   /_/  \___/_/ /_/ /_/ .___/\____/_/  /_/ /___/\__,_/\__,_/\____/_/           |  {                   }  |-´');
		   writeln('                     /_/                                                       {   \                 /   }');
		   writeln('                                                                                \   `------___------´   /');
		   writeln('                                                                                 \                     /');
		   writeln('                                                                                  \                   /');
		   writeln('                                                                                    -----------------');
		   writeln;
		   writeln;
		   writeln;
		   writeln('   Escolha a unidade de tempo pretendida (1, 2, 3): ');
		   writeln;
		   writeln('      o Segundos');
		   writeln('      o Minutos');
		   writeln('      o Horas');
		   repeat
			 GotoXY(53,17);
			 readln(opcao);
			 GotoXY(1,23);
			 case opcao of
				  1:
					 begin
						opcaos:='Segundo';
						mult:=1;
					 end;
				  2:
					 begin
						opcaos:='Minuto';
						mult:=60;
					 end;
				  3:
					 begin
						opcaos:='Hora';
						mult:=60*60;
					 end;
				  else
					 begin
					   opcaos:='null';
					   write('   *** Opção Inválida ***');
					   Delay(1000);
					   DelLine;
					   GotoXY(1,17);
					   DelLine;
					   InsLine;
					   writeln('   Escolha a unidade de tempo pretendida (1, 2, 3): ');
					 end;
			 end;
		   until (opcaos<>'null');
		   GotoXY(1,23);
		   write('   Digite o tempo em ', lowercase(opcaos),'s pretendido: ');
		   readln(tempo);
		   writeln();
		   tempo:=tempo*mult;
		   Temporizador();
		   writeln();
		   write('   Pretende repetir? (S/N) ');
		   readln(respostaa);
		 until (lowercase(respostaa)<>'s');
                 Beep(300,50);
                 cursoroff;
                 clrscr;
	end;
