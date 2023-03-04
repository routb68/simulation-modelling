%% finding century avg from our data;
a = 0;
idxa = 0;
b = 0;
idxb = 0;
c = 0;
idxc = 0;
for i = 1:2004
    d = SimT1Q12S1{i,1};
    if d <1901
        a = a + SimT1Q12S1{i,4};
        idxa = idxa+1;
    elseif d>1900 && d<2001
        b = b+SimT1Q12S1{i,4};
        idxb =idxb+1;
    else 
        c = c+SimT1Q12S1{i,4};
        idxc = idxc+1;
    end
end

%% calculating century avg
a = a/idxa;
b = b/idxb;
c = c/idxc;
%% ploting century avg line for tmax
centmax = zeros(3,1);
centmax(1) = a;
centmax(2) = b;
centmax(3) = c;
century = zeros(3,1);
century(1) = 19;
century(2) = 20;
century(3) = 21;

%% tmin treand calculations for 
a = 0;
b = 0;
c = 0;
for i = 1:2004
    d = SimT1Q12S1{i,1};
    if d <1901
        a = a + SimT1Q12S1{i,5};
    elseif d>1900 && d<2001
        b = b+SimT1Q12S1{i,5};
    else 
        c = c+SimT1Q12S1{i,5};
    end
end
a = a/idxa;
b = b/idxb;
c = c/idxc;
centmin = zeros(3,1);
centmin(1) = a;
centmin(2) = b;
centmin(3) = c;





