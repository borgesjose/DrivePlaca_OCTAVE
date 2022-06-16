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

global SerPic
varlist = {'r','e', 'y','u','Tempo'};
clear(varlist{:});
Ts = 0.1;  %Determinação do período de amostragem
set_pwm(0); %zerar PWM
Qde_amostras =50; %Quantidade de amostras do gráfico
%  for k=1:Qde_amostras r(k)=80;
%   end;
%  for k=1:Qde_amostras/2 r(k)=10;
%  end;
% for k=Qde_amostras/2+1:(Qde_amostras) r(k)=30;
% end
%     K=30;
degrau=10;
%for k=1:Qde_amostras u(k)=degrau; end;
 clf(figure(2));
 h = figure(2);
 hLine1 = line(nan, nan, 'Color','red','LineWidth',2);
  %hLine1 = line(nan, nan, 'Color','red','LineStyle','none','Marker','*');
  title('Implementação Controle Motor DC');
  xlabel('Tempo (s)');
  ylabel('Velocidade (RPS)');
  set_pwm(degrau);
     for k=1:Qde_amostras
            y(k) = recebe_velocidade; %Recebe o valor medido de armazena
%             e(k)=r(k)-y(k);
              u(k)=degrau;
         if u(k)>100 u(k)=100; end;
         if u(k)<0 u(k)=0; end;
    %    set_pwm(u(k));
      x1 = get(hLine1, 'XData');
      y1 = get(hLine1, 'YData');
      x1 = [x1 k*Ts];
      y1 = [y1 y(k)];
      set(hLine1, 'XData', x1, 'YData', y1);
       Tempo(k) = k*Ts;
       pause(Ts);
end
set_pwm(0);
 hold on
 plot(Tempo,u,'b','LineWidth',2);
%  hold on
%  plot(Tempo,,'g','LineWidth',2)
% figure(2);
% plot(Tempo,u,'g');
% title('Variável de Controle');
% xlabel('Tempo (s)');
% ylabel('u(t)');
 hold off;
saidas=[Tempo; u; y]';
 axis([0 Qde_amostras*Ts 0 inf])
% save -ascii degmotor75.dat saidas;


