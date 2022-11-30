var HTTPS:TFPHttpClient;
   localizacao,ConteudoJSON,valorpais:string;
   clima,descricao:string;
   tempatual,tempsens,tempmin,tempmax,pressure,humidity,sea_level,visibilidade:real;
   JSONString:TJSONData;
   numlugares,loopfortempo,lugardef:integer;
   lat,lon:real;

procedure TempoCidade;
 begin
   InitSSLInterface;
   HTTPS := TFPHttpClient.Create(nil);
   write('Localização: ');
   read(localizacao);
   ConteudoJSON:=HTTPS.Get('https://api.openweathermap.org/geo/1.0/direct?q='+localizacao+'&limit=5&appid=8b827ad11875bddec581fa5734ceab8c'); //obter dados sobre lugares com esse nome
   JSONString:=GetJSON(ConteudoJSON);
   numlugares:=JSONString.FindPath('').Count;//ver quantas cidades/lugares existem com o nome
   lugardef:=0;
   for loopfortempo:=1 to numlugares do //JSON Começa com valores em 0
     begin
       valorpais:=JSONString.FindPath('['+IntToStr(loopfortempo-1)+'].country').AsString;//obter o país
       if (valorpais='PT') then  //Priorizar lugares portugueses, caso contrario, vai para o primeiro que aparecer
         lugardef:=loopfortempo-1;
     end;
   lat:=JSONString.FindPath('['+IntToStr(lugardef)+'].lat').AsFloat;
   lon:=JSONString.FindPath('['+IntToStr(lugardef)+'].lon').AsFloat;
   writeln(lat:0:2);
   writeln(lon:0:2);
   ConteudoJSON:=HTTPS.Get('https://api.openweathermap.org/data/2.5/weather?lat='+FloatToStr(lat)+'&lon='+FloatToStr(lon)+'&appid=8b827ad11875bddec581fa5734ceab8c'); //obter dados sobre o tempo do lugar
   JSONString:=GetJSON(ConteudoJSON);
   clima:=JSONString.FindPath('weather[0].main').AsString;
   descricao:=JSONString.FindPath('weather[0].description').AsString;
   tempatual:=JSONString.FindPath('main.temp').AsFloat;
   tempsens:=JSONString.FindPath('main.feels_like').AsFloat;
   tempmin:=JSONString.FindPath('main.temp_min').AsFloat;
   tempmax:=JSONString.FindPath('main.temp_max').AsFloat;
   pressure:=JSONString.FindPath('main.pressure').AsFloat;
   humidity:=JSONString.FindPath('main.humidity').AsFloat;
   //sea_level:=JSONString.FindPath('main.sea_level').AsFloat;
   //visibilidade:=JSONString.FindPath('visibility').AsFloat;
   writeln(ConteudoJSON);
   readkey;
 end;