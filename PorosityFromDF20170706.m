clear variables
close all
%use DF image to extract porositu info
%for Co and TiO2 little difference in intensity
rec=[128 128 256 256];


[filename, pathname, filterindex] = uigetfile('*.*','Select DF images', 'MultiSelect', 'off');
cd(pathname);
base = strcat('*_');
nameF = '(1)_Counts_Ra_K_map.tif';
dra = dir([base nameF]);
for i=1:length(dra)
   DF = im2double(imread(dra(i).name));
   DF3 = imcrop(DF(:,:,1));
%    DF3 = DF2(:,:,1);
   DFmax = max(DF3(:));
   DFmin = min(DF3(:));
   Thetha = 1-((DF3-DFmin)/(DFmax-DFmin));
%    ThethaDF(:,:,i) = Thetha;
   porosity = mean(Thetha(:));
   Porosity(i) = porosity;
%    DF2(:,:,i) = DF(:,:,1);
%    figure
%    imshow(Thetha)
end
PorosityDF = mean(Porosity)
stddevPorDF = std(Porosity)
P=Porosity';

%%figures

figure
plot(Porosity,'or')
hold on
errorbar(PorosityDF,stddevPorDF,'sb')



figure
histogram(Porosity)



