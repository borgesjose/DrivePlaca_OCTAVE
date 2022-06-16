%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Universidade Federal do Piauí                       %
% Campus Ministro Petronio Portela                    %
% @author                                             %
% @email                                              %
%  Resposta ao Degrau em Malha Aberta                 %
%                                                     %
%  -- Version: x.x  - xx/xx/2022                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Não fiz nenhuma alteração nesse código ele já era 100% compativel com octave


%Código implementação Relé
global SerPIC
 %Limpar o Workspace - INICIO
Ts = 0.1;  %Determinação do período de amostragem
set_pwm(0); %zerar PWM
eps=1;
%eps=10;
dh=60;
dl=5;
varlist = {'ref','u','e','y', 'Tempo'};
clear(varlist{:})
clf(figure(1))

Qde_amostras = 200; %Quantidade de amostras do gráfico
% REF = 100; % Referência em 100% de PWM
% pwm = REF;

for k=1:Qde_amostras
    ref(k)=20;
end

clf(figure(1));
h = figure(1);
hLine1 = line(nan, nan, 'Color','red');
title('Implementação Controle Motor DC');
xlabel('Tempo (s)');
ylabel('Velocidade (RPS)');

%Inicializa as variáveis gráficas
  k=1;
  y(1)=0 ; y(2)=0; erro(1)=ref(1)-y(1); erro(2)=ref(2)-y(2); u(1)=0; u(2)=0;
  while k<2
      x1 = get(hLine1, 'XData');
      y1 = get(hLine1, 'YData');
      k=1;
      x1 = [x1 k*Ts];
      y1 = [y1 y(k)];
      set(hLine1, 'XData', x1, 'YData', y1); % atribuindo os vetores atualizados a figura h
      k=k+1;
  end
u(1)=dh;
for k=2:Qde_amostras

    y(k) = recebe_velocidade; %Recebe o valor medido de armazena

   e(k) = ref(k)-y(k);
   if ((abs(e(k)) >= eps) & (e(k)  >0))      u(k) =  dh; end;
   if ((abs(e(k)) > eps) & (e(k) < 0))      u(k) = dl; end;
   if ((abs(e(k)) < eps) & (u(k-1) == dh))   u(k) =  dh; end;
   if ((abs(e(k)) < eps) & (u(k-1) == dl))  u(k) = dl; end;
    x1 = get(hLine1, 'XData');
    y1 = get(hLine1, 'YData');
    x1 = [x1 k*Ts];
    y1 = [y1 y(k)];
    set(hLine1, 'XData', x1, 'YData', y1);
   Tempo(k) = k*Ts;

    set_pwm(u(k))

   pause(0.1);
    end
set_pwm(0);
%clf(figure(2));
%figure(2);
hold on
plot(Tempo,u,'b'); %Gera o gráfico Tempo x Saída
hold off;
saidas=[Tempo; u; y]';
% axis([0 Qde_amostras*Ts 0 inf])
 save -ascii ReleHisterese4.dat saidas;
