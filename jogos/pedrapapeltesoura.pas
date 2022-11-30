var respostappt,nomeppt,escolhappt,escolhamaquina,nomemaquina:string;
    melhorde,numrandom,numjogos,jogosganhosp,jogosganhosm,yppt1,yppt2,yppt3:integer;

procedure PedraPapelTesoura;
  begin
    Beep(700,50);
    Randomize; //Gerar nova sequencia de numeros aleatorios
    respostappt:='s';
    stringfinal:='/_/    \___/\__,_/_/   \__,_/';
    textbackground(lightgray);
    textcolor(black);
    clrscr;
    cursoroff; //desativa o cursor
    writeln;
    writeln;
    lenghtescolha:=(WindMaxX+1 - Length(stringfinal)+3) div 2+10;
    GotoXY(lenghtescolha-10,WhereY);
    writeln('    ____           __          ');
    GotoXY(lenghtescolha-10,WhereY);
    writeln('   / __ \___  ____/ /________ _');
    GotoXY(lenghtescolha-10,WhereY);
    writeln('  / /_/ / _ \/ __  / ___/ __ `/');
    GotoXY(lenghtescolha-10,WhereY);
    writeln(' / ____/  __/ /_/ / /  / /_/ / ');
    GotoXY(lenghtescolha-10,WhereY);
    writeln(stringfinal);
    stringfinal:='/_/    \__,_/ .___/\___/_/';
    lenghtescolha:=(WindMaxX+1 - Length(stringfinal)+3) div 2+10;
    GotoXY(lenghtescolha-10,WhereY+1);
    writeln('    ____                   __');
    GotoXY(lenghtescolha-10,WhereY);
    writeln('   / __ \____ _____  ___  / /');
    GotoXY(lenghtescolha-10,WhereY);
    writeln('  / /_/ / __ `/ __ \/ _ \/ / ');
    GotoXY(lenghtescolha-10,WhereY);
    writeln(' / ____/ /_/ / /_/ /  __/ /  ');
    GotoXY(lenghtescolha-10,WhereY);
    writeln(stringfinal);
    GotoXY(lenghtescolha-10,WhereY);
    writeln('           /_/               ');
    stringfinal:='/_/  \___/____/\____/\__,_/_/   \__,_/';
    lenghtescolha:=(WindMaxX+1 - Length(stringfinal)+3) div 2+10;
    GotoXY(lenghtescolha-10,WhereY+1);
    writeln('  ______                                ');
    GotoXY(lenghtescolha-10,WhereY);
    writeln(' /_  __/__  _________  __  ___________ _');
    GotoXY(lenghtescolha-10,WhereY);
    writeln('  / / / _ \/ ___/ __ \/ / / / ___/ __ `/');
    GotoXY(lenghtescolha-10,WhereY);
    writeln(' / / /  __(__  ) /_/ / /_/ / /  / /_/ / ');
    GotoXY(lenghtescolha-10,WhereY);
    writeln(stringfinal);
    writeln;
    writeln;
    yppt2:=WhereY;
    repeat
      window(1,yppt2,WindMaxX,WindMaxY);
      clrscr;
      jogosganhosp:=0;
      jogosganhosm:=0;
      clrscr;
      somamedia:=0;
      GotoXY(lenghtescolha-10,WhereY);
      write('Digite o seu nome: ');
      readln(nomeppt);
      writeln;
      repeat
        GotoXY(lenghtescolha-10,WhereY);
        write('Melhor de:   jogos');
        GotoXY(lenghtescolha-10+11,WhereY);
        readln(melhorde);
        writeln;
        if (melhorde MOD 2)=0 then
          numjogos:=round(melhorde/2)+1
        else
          numjogos:=round(melhorde/2);
        if (melhorde<=0) then
          begin
            textcolor(red);
            stringfinal:='______Número Inválido______';
            GotoXY(lenghtescolha-5,WhereY);
            writeln('______               ______');
            GotoXY(lenghtescolha-5,WhereY);
            writeln(stringfinal);
            writeln;
            writeln;
            textcolor(black);
          end;
      until (melhorde>0);
      writeln;
      nomemaquina:=sysutils.GetEnvironmentVariable('COMPUTERNAME');
      stringfinal:=' <--- VS ---> ';
      GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2)-Length(nomeppt),WhereY);
      textcolor(cyan);
      writeln(nomeppt,stringfinal,nomemaquina);
      writeln;
      yppt3:=WhereY;
      stringfinal:=IntToStr(jogosganhosp)+' - '+IntToStr(jogosganhosm);
      GotoXY((WindMaxX - Length(stringfinal)) div 2,WhereY);
      write(stringfinal);
      writeln;
      writeln;
      yppt1:=WhereY;
      repeat
        window(1,yppt1+23,WindMaxX,WindMaxY);
        textcolor(black);
        numrandom:=random(2)+1; //Seleciona um numero aleatorio, de 0 até 2, somando 1, fica de 1 a 3
        escolhamaquina:='tesoura';
        if (numrandom=1) then
          escolhamaquina:='pedra'
        else if (numrandom=2) then
          escolhamaquina:='papel';
        repeat
          GotoXY(lenghtescolha-10,WhereY);
          cursoron;
          write('Pedra, Papel ou Tesoura? ');
          readln(escolhappt);
          escolhappt:=lowercase(escolhappt);
          cursoroff;
          writeln;
          writeln;
          if (escolhappt<>'pedra') and (escolhappt<>'papel') and (escolhappt<>'tesoura') then
            begin
              textcolor(red);
              stringfinal:='______Opção Inválida______';
              GotoXY(lenghtescolha-5,WhereY);
              writeln('______               ______');
              GotoXY(lenghtescolha-5,WhereY);
              writeln(stringfinal);
              writeln;
              writeln;
              textcolor(black);
            end;
        until (escolhappt='pedra') or (escolhappt='papel') or(escolhappt='tesoura');
        stringfinal:='O jogador '+nomeppt+' escolheu '+escolhappt+' e o jogador '+nomemaquina+' escolheu '+escolhamaquina;
        GotoXY((WindMaxX - Length(stringfinal)) div 2,WhereY);
        writeln(stringfinal);
        if ((escolhamaquina='pedra') and (escolhappt='tesoura')) or ((escolhamaquina='papel') and (escolhappt='pedra')) or ((escolhamaquina='tesoura') and (escolhappt='papel')) then //Maquina vence
          begin;
            jogosganhosm:=jogosganhosm+1;
            stringfinal:='O vencedor é: '+nomemaquina;
            textcolor(red);
            GotoXY((WindMaxX - Length(stringfinal)) div 2,WhereY+1);
            writeln(stringfinal);
            textcolor(black);
          end
        else if (escolhamaquina=escolhappt) then //Empate
          begin
            textcolor(yellow);
            stringfinal:='Houve um empate!';
            GotoXY((WindMaxX - Length(stringfinal)) div 2,WhereY+1);
            writeln(stringfinal);
            textcolor(black);
          end
        else //Pessoa Vence
          begin
            jogosganhosp:=jogosganhosp+1;
            textcolor(green);
            stringfinal:='O vencedor é: '+nomeppt;
            GotoXY((WindMaxX - Length(stringfinal)) div 2,WhereY+1);
            writeln(stringfinal);
            textcolor(black);
          end;
        stringfinal:='Pressione qualquer tecla para avançar';
        GotoXY((WindMaxX - Length(stringfinal)) div 2,WhereY+2);
        writeln(stringfinal);
        textcolor(cyan);
        window(1,yppt2,WindMaxX,WindMaxY);
        GotoXY(1,yppt3);
        stringfinal:=IntToStr(jogosganhosp)+' - '+IntToStr(jogosganhosm);
        GotoXY((WindMaxX - Length(stringfinal)) div 2,yppt3);
        write(stringfinal);
        window(1,yppt1+23,WindMaxX,WindMaxY);
        readkey;
        clrscr;
      until (numjogos=jogosganhosp) or (numjogos=jogosganhosm);
      writeln;
      writeln;
      if (jogosganhosp>jogosganhosm) then
        begin
          textcolor(green);
          stringfinal:='Parabéns! Ganhaste o jogo contra '+nomemaquina+' de melhor de '+IntToStr(melhorde)+' jogos!';
          GotoXY((WindMaxX - Length(stringfinal)) div 2,WhereY+2);
          writeln(stringfinal);
        end
      else
        begin
          textcolor(red);
          stringfinal:=':( Perdeste o jogo contra '+nomemaquina+' de melhor de '+IntToStr(melhorde)+' jogos...';
          GotoXY((WindMaxX - Length(stringfinal)) div 2,WhereY+2);
          writeln(stringfinal);
        end;
      textcolor(black);
      GotoXY(lenghtescolha-10,WhereY+2);
      write('Pretende repetir? (S/N) ');
      readln(respostappt);
    until (lowercase(respostappt)<>'s');
    window(1,1,WindMaxX,WindMaxY);
  end;

