var loopjogogalo,lugaratual,valorx,valory,xinicial,yinicial,sitioescolhido,numsitiolivre:integer;
    lugarlivre:array[1..9] of bool;//Lugares livres, onde 1 representa se esta livre ou nao, e 2 a coord central
    lugaresmaquina:array[1..9] of bool;//Lugares ocupados pela maquina
    lugaresjogador:array[1..9] of bool;//Lugares ocupados pelo jogador
    partetabela,nomegalo,respostagolo,vencedor:string;
    jogoativo:bool;

procedure ObterXYGalo(valorpos:integer); //MENU PARA SUBIR,DESCER, TROCAR DE MENUS...
  begin
    if (((valorpos+2) mod 3)=0) then
      begin
        valorx:=7;
      end
    else if (((valorpos+1) mod 3)=0) then
      begin
        valorx:=21;
      end
    else
      begin
        valorx:=35;
      end;
    if (valorpos<=3) then
      begin
        valory:=4;
      end
    else if (valorpos<=6) then
      begin
        valory:=11;
      end
    else
      begin
        valory:=18;
      end;
  end;

procedure VerificarVencedor;
  begin
    if ((lugaresmaquina[1]) and (lugaresmaquina[2]) and (lugaresmaquina[3])) or ((lugaresmaquina[4]) and (lugaresmaquina[5]) and (lugaresmaquina[6])) or ((lugaresmaquina[7]) and (lugaresmaquina[8]) and (lugaresmaquina[9])) then //vitorias horizontais
      begin
        vencedor:=nomemaquina;
      end
    else if ((lugaresmaquina[1]) and (lugaresmaquina[5]) and (lugaresmaquina[9])) or ((lugaresmaquina[3]) and (lugaresmaquina[5]) and (lugaresmaquina[7])) then //vitorias diagonais
      begin
        vencedor:=nomemaquina;
      end
    else if ((lugaresmaquina[1]) and (lugaresmaquina[4]) and (lugaresmaquina[7])) or ((lugaresmaquina[2]) and (lugaresmaquina[5]) and (lugaresmaquina[8])) or ((lugaresmaquina[3]) and (lugaresmaquina[6]) and (lugaresmaquina[9])) then //vitorias verticais
      begin
        vencedor:=nomemaquina;
      end
    else if ((lugaresjogador[1]) and (lugaresjogador[2]) and (lugaresjogador[3])) or ((lugaresjogador[4]) and (lugaresjogador[5]) and (lugaresjogador[6])) or ((lugaresjogador[7]) and (lugaresjogador[8]) and (lugaresjogador[9])) then //vitorias horizontais
      begin
        vencedor:=nomegalo;
      end
    else if ((lugaresjogador[1]) and (lugaresjogador[5]) and (lugaresjogador[9])) or ((lugaresjogador[3]) and (lugaresjogador[5]) and (lugaresjogador[7])) then //vitorias diagonais
      begin
        vencedor:=nomegalo;
      end
    else if ((lugaresjogador[1]) and (lugaresjogador[4]) and (lugaresjogador[7])) or ((lugaresjogador[2]) and (lugaresjogador[5]) and (lugaresjogador[8])) or ((lugaresjogador[3]) and (lugaresjogador[6]) and (lugaresjogador[9])) then //vitorias verticais
      begin
        vencedor:=nomegalo;
      end
    else
      begin
        //verificar se houve empate
        numsitiolivre:=0;
        for loopjogogalo:=1 to 9 do
          if lugarlivre[loopjogogalo] then
            numsitiolivre:=numsitiolivre+1;
        if (numsitiolivre=0) then
          vencedor:='Empate';
      end;
  end;

procedure JogoGalo;
  begin
    begin
    Beep(700,50);
    stringfinal:='\____/\____/\__, /\____/';
    respostagolo:='s';
    textbackground(lightgray);
    textcolor(black);
    clrscr;
    writeln;
    writeln;
    lenghtescolha:=(WindMaxX - Length(stringfinal)) div 2+10;
    GotoXY(lenghtescolha-10,WhereY);
    writeln('       __                ');
    GotoXY(lenghtescolha-10,WhereY);
    writeln('      / /___  ____ _____');
    GotoXY(lenghtescolha-10,WhereY);
    writeln(' __  / / __ \/ __ `/ __ \');
    GotoXY(lenghtescolha-10,WhereY);
    writeln('/ /_/ / /_/ / /_/ / /_/ /');
    GotoXY(lenghtescolha-10,WhereY);
    writeln(stringfinal);
    GotoXY(lenghtescolha-10,WhereY);
    writeln('           /____/        ');
    stringfinal:='/_____/\____/';
    lenghtescolha:=(WindMaxX - Length(stringfinal)) div 2+10;
    GotoXY(lenghtescolha-10,WhereY+1);
    writeln('    ____      ');
    GotoXY(lenghtescolha-10,WhereY);
    writeln('   / __ \____ ');
    GotoXY(lenghtescolha-10,WhereY);
    writeln('  / / / / __ \');
    GotoXY(lenghtescolha-10,WhereY);
    writeln(' / /_/ / /_/ /');
    GotoXY(lenghtescolha-10,WhereY);
    writeln(stringfinal);
    stringfinal:='\____/\__,_/_/\____/';
    lenghtescolha:=(WindMaxX - Length(stringfinal)) div 2+10;
    GotoXY(lenghtescolha-10,WhereY+1);
    writeln('   ______      __    ');
    GotoXY(lenghtescolha-10,WhereY);
    writeln('  / ____/___ _/ /___ ');
    GotoXY(lenghtescolha-10,WhereY);
    writeln(' / / __/ __ `/ / __ \');
    GotoXY(lenghtescolha-10,WhereY);
    writeln('/ /_/ / /_/ / / /_/ /');
    GotoXY(lenghtescolha-10,WhereY);
    writeln(stringfinal);
    partetabela:='_____________|_____________|_____________';
    end;
    repeat
      GotoXY(lenghtescolha-10,Wherey+2);
      write('Digite o seu nome: ');
      read(nomegalo);
      nomemaquina:=sysutils.GetEnvironmentVariable('COMPUTERNAME');
      stringfinal:=nomegalo+' <--- VS ---> '+nomemaquina;
      GotoXY(((WindMaxX - Length(stringfinal)) div 2),WhereY-1);
      textcolor(cyan);
      writeln(stringfinal);
      xinicial:=(WindMaxX - Length(partetabela)) div 2;
      yinicial:=WhereY+5;
      window(xinicial,yinicial,WindMaxX,WindMaxY);
      GotoXY(1,1);
      textcolor(black);
      for loopjogogalo:=1 to 9 do
        begin
          lugarlivre[loopjogogalo]:=true;
          lugaresjogador[loopjogogalo]:=false;
          lugaresmaquina[loopjogogalo]:=false;
        end;
      for loopjogogalo:=1 to 21 do
        begin
          GotoXY(14,WhereY);
	  write('|');
	  GotoXY(WhereX+13,WhereY);
	  writeln('|');
        end;
      GotoXY(1,7);
      writeln(partetabela);
      GotoXY(1,WhereY+6);
      writeln(partetabela);
      textcolor(black);
      lugaratual:=1;
      ObterXYGalo(lugaratual);
      textbackground(cyan);
      GotoXY(valorx,valory);
      writeln(' ');
      jogoativo:=true;
      while jogoativo do
        begin
            rk:=readkey;
            if (rk=#77)then //direita
              begin
                if (lugarlivre[lugaratual]) then
                  begin
                    ObterXYGalo(lugaratual);
                    GotoXY(valorx,valory);
                    textbackground(lightgray);
                    writeln(' ');
                  end;
                if (lugaratual=9) then
                  lugaratual:=0;
                lugaratual:=lugaratual+1;
                while (not lugarlivre[lugaratual]) do //se ta ocupado avan�ar 1 casa
                  begin
                    lugaratual:=lugaratual+1;
                    if (lugaratual>=10) then
                      lugaratual:=1;
                  end;
                ObterXYGalo(lugaratual);
                textbackground(cyan);
                GotoXY(valorx,valory);
                writeln(' ');
              end
            else if (rk=#75) then //esquerda
              begin
                if (lugarlivre[lugaratual]) then
                  begin
                    ObterXYGalo(lugaratual);
                    GotoXY(valorx,valory);
                    textbackground(lightgray);
                    writeln(' ');
                  end;
                if (lugaratual=1) then
                  lugaratual:=10;
                lugaratual:=lugaratual-1;
                while (not lugarlivre[lugaratual]) do //se ta ocupado avan�ar 1 casa
                  begin
                    lugaratual:=lugaratual+1;
                    if (lugaratual>=10) then
                      lugaratual:=1;
                  end;
                ObterXYGalo(lugaratual);
                textbackground(cyan);
                GotoXY(valorx,valory);
                writeln(' ');
              end
            else if (rk=#72) then //cima
              begin
                if (lugarlivre[lugaratual]) then
                  begin
                    ObterXYGalo(lugaratual);
                    GotoXY(valorx,valory);
                    textbackground(lightgray);
                    writeln(' ');
                  end;
                if (lugaratual=1) then
                  lugaratual:=10
                else if  (lugaratual=2) then
                  begin
                    lugaratual:=11;
                  end
                else if  (lugaratual=3) then
                  lugaratual:=12;
                lugaratual:=lugaratual-3;
                while (not lugarlivre[lugaratual]) do //se ta ocupado avan�ar 1 casa
                  begin
                    lugaratual:=lugaratual+1;
                    if (lugaratual>=10) then
                      lugaratual:=1;
                  end;
                ObterXYGalo(lugaratual);
                textbackground(cyan);
                GotoXY(valorx,valory);
                writeln(' ');
              end
            else if (rk=#80) then //baixo
              begin
                if (lugarlivre[lugaratual]) then
                  begin
                    ObterXYGalo(lugaratual);
                    GotoXY(valorx,valory);
                    textbackground(lightgray);
                    writeln(' ');
                  end;
                if (lugaratual=9) then
                  lugaratual:=0
                else if  (lugaratual=8) then
                  lugaratual:=-1
                else if  (lugaratual=7) then
                  lugaratual:=-2;
                lugaratual:=lugaratual+3;
                while (not lugarlivre[lugaratual]) do //se ta ocupado avan�ar 1 casa
                  begin
                    lugaratual:=lugaratual+1;
                    if (lugaratual>=10) then
                      lugaratual:=1;
                  end;
                ObterXYGalo(lugaratual);
                textbackground(cyan);
                GotoXY(valorx,valory);
                writeln(' ');
              end
            else if (rk=#13) then //Enter
              begin
                ObterXYGalo(lugaratual);
                GotoXY(valorx,valory);
                textbackground(lightgray);
                writeln(' ');
                textcolor(green);
                lugarlivre[lugaratual]:=false;
                lugaresjogador[lugaratual]:=true;
                window(xinicial+valorx-3,yinicial+valory-3,WindMaxX,WindMaxY);//criar janela para desenhar o X
                GotoXY(1,1);
	        writeln('\   /');
	        writeln(' \ / ');
	        writeln('  \  ');
	        writeln(' / \ ');
	        writeln('/   \');
                window(xinicial,yinicial,WindMaxX,WindMaxY);
                vencedor:='nenhum';
                VerificarVencedor; //verificar se houve vitoria
                Delay(500);
                //Maquina escolher um sitio para colocar a O
                if (((lugaresmaquina[1]) and (lugaresmaquina[2])) or ((lugaresmaquina[6]) and (lugaresmaquina[9])) or ((lugaresmaquina[5]) and (lugaresmaquina[7]))) and (lugarlivre[3]) then       //Maquina "inteligente", para escolher lugares que a fa�am ganhar
                    lugaratual:=3
                else if (((lugaresmaquina[1]) and (lugaresmaquina[3])) or ((lugaresmaquina[5]) and (lugaresmaquina[8]))) and (lugarlivre[2]) then
                    lugaratual:=2
                else if (((lugaresmaquina[2]) and (lugaresmaquina[3])) or ((lugaresmaquina[4]) and (lugaresmaquina[7])) or ((lugaresmaquina[5]) and (lugaresmaquina[9]))) and (lugarlivre[1]) then
                    lugaratual:=1
                else if (((lugaresmaquina[3]) and (lugaresmaquina[9])) or ((lugaresmaquina[4]) and (lugaresmaquina[5]))) and (lugarlivre[6]) then
                    lugaratual:=6
                else if (((lugaresmaquina[4]) and (lugaresmaquina[6])) or ((lugaresmaquina[2]) and (lugaresmaquina[8])) or ((lugaresmaquina[1]) and (lugaresmaquina[9]))) and (lugarlivre[5]) then
                    lugaratual:=5
                else if (((lugaresmaquina[1]) and (lugaresmaquina[7])) or ((lugaresmaquina[5]) and (lugaresmaquina[6]))) and (lugarlivre[4]) then
                    lugaratual:=4
                else if (((lugaresmaquina[7]) and (lugaresmaquina[8])) or ((lugaresmaquina[3]) and (lugaresmaquina[6])) or ((lugaresmaquina[1]) and (lugaresmaquina[5]))) and (lugarlivre[9]) then
                    lugaratual:=9
                else if (((lugaresmaquina[7]) and (lugaresmaquina[9])) or ((lugaresmaquina[2]) and (lugaresmaquina[5]))) and (lugarlivre[8]) then
                    lugaratual:=8
                else if (((lugaresmaquina[8]) and (lugaresmaquina[9])) or ((lugaresmaquina[1]) and (lugaresmaquina[4])) or ((lugaresmaquina[3]) and (lugaresmaquina[5]))) and (lugarlivre[9]) then
                    lugaratual:=7
               else if (((lugaresjogador[1]) and (lugaresjogador[2])) or ((lugaresjogador[6]) and (lugaresjogador[9])) or ((lugaresjogador[5]) and (lugaresjogador[7]))) and (lugarlivre[3]) then       //Maquina "inteligente", para escolher lugares que n�o fa�am o jogador ganhar
                    lugaratual:=3
                else if (((lugaresjogador[1]) and (lugaresjogador[3])) or ((lugaresjogador[5]) and (lugaresjogador[8]))) and (lugarlivre[2]) then
                    lugaratual:=2
                else if (((lugaresjogador[2]) and (lugaresjogador[3])) or ((lugaresjogador[4]) and (lugaresjogador[7])) or ((lugaresjogador[5]) and (lugaresjogador[9]))) and (lugarlivre[1]) then
                    lugaratual:=1
                else if (((lugaresjogador[3]) and (lugaresjogador[9])) or ((lugaresjogador[4]) and (lugaresjogador[5]))) and (lugarlivre[6]) then
                    lugaratual:=6
                else if (((lugaresjogador[4]) and (lugaresjogador[6])) or ((lugaresjogador[2]) and (lugaresjogador[8])) or ((lugaresjogador[1]) and (lugaresjogador[9]))) and (lugarlivre[5]) then
                    lugaratual:=5
                else if (((lugaresjogador[1]) and (lugaresjogador[7])) or ((lugaresjogador[5]) and (lugaresjogador[6]))) and (lugarlivre[4]) then
                    lugaratual:=4
                else if (((lugaresjogador[7]) and (lugaresjogador[8])) or ((lugaresjogador[3]) and (lugaresjogador[6])) or ((lugaresjogador[1]) and (lugaresjogador[5]))) and (lugarlivre[9]) then
                    lugaratual:=9
                else if (((lugaresjogador[7]) and (lugaresjogador[9])) or ((lugaresjogador[2]) and (lugaresjogador[5]))) and (lugarlivre[8]) then
                    lugaratual:=8
                else if (((lugaresjogador[8]) and (lugaresjogador[9])) or ((lugaresjogador[1]) and (lugaresjogador[4])) or ((lugaresjogador[3]) and (lugaresjogador[5]))) and (lugarlivre[9]) then
                    lugaratual:=7
                else  //caso contrario, jogar aleatoriamente
                  begin
                    numsitiolivre:=0;
                    for loopjogogalo:=1 to 9 do
                      begin
                        if (lugarlivre[loopjogogalo]) then
                          begin
                            numsitiolivre:=numsitiolivre+1;//contagem dos lugares livres q existem
                          end;
                      end;
                    Randomize; //Gerar nova sequencia de numeros aleatorios
                    sitioescolhido:=random(numsitiolivre-1)+1;//sortear um lugar aleatorio
                    numsitiolivre:=0;
                    for loopjogogalo:=1 to 9 do
                      begin
                        if (lugarlivre[loopjogogalo]) then
                          begin
                            numsitiolivre:=numsitiolivre+1;//contagem dos lugares livres q existem
                            if (sitioescolhido=numsitiolivre) then
                              begin
                                lugaratual:=loopjogogalo;//Posicao na array no sitioescolhido
                              end;
                          end;
                      end;
                  end;
                //Desenhar a O
                if (lugarlivre[lugaratual]) and (vencedor='nenhum') then
                  begin
                    ObterXYGalo(lugaratual);
                    GotoXY(valorx,valory);
                    textbackground(lightgray);
                    writeln(' ');
                    textcolor(red);
                    lugarlivre[lugaratual]:=false;
                    lugaresmaquina[lugaratual]:=true;
                    window(xinicial+valorx-7,yinicial+valory-4,WindMaxX,WindMaxY);//criar janela para desenhar o X
                    GotoXY(1,1);
	            writeln('    _____    ');
	            writeln('  ,�     `.  ');
	            writeln(' /         \ ');
	            writeln(' |         | ');
	            writeln(' \         / ');
	            writeln('  `._____,�  ');
                    window(xinicial,yinicial,WindMaxX,WindMaxY);
                    while (not lugarlivre[lugaratual]) do //se ta ocupado avan�ar 1 casa
                      begin
                        lugaratual:=lugaratual+1;
                        if (lugaratual>=10) then
                          lugaratual:=1;
                      end;
                  end;
                  VerificarVencedor; //verificar se houve vitoria
                  if (vencedor<>'nenhum') then
                    begin
                      Delay(2000);
                      window(xinicial,yinicial,WindMaxX,WindMaxY);
                      clrscr;
                      textcolor(black);
                      writeln('vencedor: ',vencedor);//possivelvencedor passa a ser o real vencedor
                      Delay(1000);
                      jogoativo:=false;
                    end;
                end;
              end;
            write('Pretende repetir? (S/N) ');
            readln(respostagolo);
    until (respostagolo<>'s');
  end;