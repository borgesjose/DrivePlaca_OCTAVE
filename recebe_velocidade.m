 function ler = recebe_velocidade

  global SerPic
  pkg load instrument-control  %Carrega a bilbioteca que contem as funções de comunicação serial


  flushinput(SerPic);  %Limpa a porta serial de entrada
  fprintf(SerPic,'%c','w');

  ler = srl_read(SerPic,2);%fscanf(SerPic, '%s');  %lendo os dados no PIC
 disp(num2str(ler))
  %vel = str2double(ler);

##
##  if vel > 80 % Checagem de erro se velocidade é positiva
##    fprintf(SerPic,'%c','w');
##    ler = fscanf(SerPIC,'%s');
##    vel = str2double(ler);
##  endif
##  if vel<0 %Checagem de erro se velocidade é negativa
##       fprintf(SerPic,'%c','w');
##       ler = fscanf(SerPIC,'%s');
##       vel = str2double(ler);
##  endif
##  if isnan(vel) %Checagem de erro se velocidade e NaN
##       fprintf(SerPic,'%c','w');
##       ler = fscanf(SerPIC,'%s');
##       vel = str2double(ler);
##  endif

  flushoutput(SerPic);
  end
