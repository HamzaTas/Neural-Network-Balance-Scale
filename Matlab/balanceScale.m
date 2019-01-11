
% ------------- Balance Scale --------------------
clc
sayac=0;
dogru_say=0;
yanlis_say=0;
araNoron=2;
nu=0.6;
alfa=0.8; 
cikislar=zeros(1,4);
hataliOlanlar=zeros(1,1);

% --- Dataset Tan�mlar�
x=egitimVeri;                        % E�itim girisler
t=egitimTarget;                      % E�itim hedef ��k��lar

% --- Ara katman i�in tan�mlamalar
wBar=zeros(araNoron,4);              % Ara katman agirliklari
deltaWBar=zeros(araNoron,4);         % Ara katman agirliklarindaki degisim
bBar=zeros(araNoron,1);              % Ara katman bias'lari
deltaBbar=zeros(araNoron,1);         % Ara katman bias'lar�ndaki degisim
opBar=zeros(araNoron,1);             % Ara katman ��k��ar�

% --- ��k�� katman� i�in tan�mlamalar
w=zeros(2,araNoron);                 % ��k�� katman� ag�rl�klar�
deltaW=zeros(2,araNoron);            % ��k�� katman� ag�rl�klar� de�i�im
b=zeros(2,1);                        % ��k�� katman� biaslar�
deltaB=zeros(2,1);                   % ��k�� katman�ndaki bias de�i�im
OpHata=zeros(2,1);                   % ��k�� katman� hata fakt�r�
op=zeros(2,1);                       % �retilen ��k��lar


% --- E�itim A�amas�
for k=1:length(egitimVeri)
    hata=1;
    while(hata>0.01)
    
    % ara katman ��k��lar�n�n bulunmas�
    for i=1:araNoron
        top=0;
        for n=1:4
            top=top+x(n,k)*wBar(i,n);
        end
        opBar(i)=f(top+bBar(i));
    end
    
    % ��k�� katman� ��k��lar�n�n bulunmas�
    for n=1:2
        top=0;
        for i=1:araNoron
            top=top+opBar(i)*w(n,i);
        end
        op(n)=f(top+b(n));
    end
    
    % G�ncelleme kontrol�
    if t(1,1)~=op(1,1)|| t(2,1)~=op(2,1)
        
    % --- ��k�� katman� g�ncellemeleri ---
    % ��k�� hata fakt�rlerinin hesaplanmas�
    for i=1:2
        OpHata(i)=(t(i,k)-op(i))*op(i)*(1-op(i));
    end
    
    % ��k�� a��rl�klar�n�n g�ncellemesi
    for j=1:araNoron
        for i=1:2
            deltaW(i,j)=nu*OpHata(i)*opBar(j)+alfa*deltaW(i,j);
        end
    end
    w=w+deltaW;
    
    % ��k�� katman� biaslar�n�n g�ncellenmesi
    for j=1:2
        deltaB(j)=nu*OpHata(j)+alfa*deltaB(j);
        b(j)=b(j)+deltaB(j);
    end
    
    % --- Ara katman� g�ncellemeleri ---
    % ara katman ag�rl�klar� g�ncellemesi
    for i=1:araNoron
        for j=1:4
            deltaWBar(i,j)=nu*opBar(i)*(1-opBar(i))*w(1,i)*OpHata(1)*x(j,k);           
            wBar(i,j)=wBar(i,j)+deltaWBar(i,j);
        end
    end
    
    % ara katman biaslar�n�n g�ncellenmesi
    for i=1:araNoron
        deltaBbar(i)=nu*opBar(i)*(1-opBar(i))*w(1,i)*OpHata(1);
        bBar(i)=bBar(i)+deltaBbar(i);
    end
    
    sayac=sayac+1;
    hata=(1/2)*((t(1,k)-op(1))^2+(t(2,k)-op(2))^2);
    end %if sonu
    end %while sonu    
end

% --- Test A�amas�

    dogru=0;
    
    for k=1:length(TestVeri)
        
    % ara katman ��k��lar�n�n bulunmas�
    for i=1:araNoron
         top=0;
         for n=1:4
             top=top+TestVeri(n,k)*wBar(i,n);
         end
          opBar(i)=f(top+bBar(i));
    end
    
    % ��k�� katman� ��k��lar�n�n bulunmas�
    for n=1:2
        top=0;
        for i=1:araNoron
            top=top+opBar(i)*w(n,i);
        end
        op(n)=f(top+b(n));
        cikislar(k,n)=op(n);
    end
    cikislar(k,3) = TestTarget(1,k);
    cikislar(k,4) = TestTarget(2,k);
    
    %��k�� belirleme
    if op(1)>0.99
        op(1)=1;
        op(2)=0;
    elseif op(2)>0.99
        op(1)=0;
        op(2)=1;
    else
        op(1)=1;
        op(2)=1;
    end

    % Dogruluk sorgulama
    if(TestTarget(1,k)==op(1))&&(TestTarget(2,k)==op(2))
        disp('dogru ');
        dogru_say=dogru_say+1;
        dogru=dogru+1; 
    else
        yanlis_say=yanlis_say+1;
        disp('yanl�s');
    end
    end %for sonu
    x=sprintf('Verilen test verisine g�re a��n ba�ar� oran�');
    disp(x);
    disp(100*dogru/length(TestVeri));

  