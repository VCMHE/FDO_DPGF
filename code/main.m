close all;
clear all;
%%
addpath 'fusion_metrix'

X=imread(  'mri_060.jpg');
X1=imread('pet_060.jpg');
lab1=rgb2lab(X);
lab2=rgb2lab(X1);

%% FDO  reconstruction  Algorithm1 in our manuscript
if (size(X,3) ~= 1) 
   A = rgb2gray(X);
end
S1=FDO(A);
if (size(X1,3) ~= 1) 
   B = rgb2gray(X1);
end
S2=FDO(B);

%% GFF fusion to produce pre-fusion result "IFR" in Fig. 2
I(:,:,1)=S1;
I(:,:,2)=S2;
Prefusion = GFF(I);
lab=rgb2lab(cat(3,Prefusion,Prefusion,Prefusion));
PFused=lab2rgb(cat(3,lab(:,:,1),lab2(:,:,2),lab2(:,:,3)));
figure(1),imshow(PFused)

%% DPGF   Algorithm2 in our manuscript
n=50; %% number of interations of DPFG 
[Fused metri]=DPGF(X,X1,Prefusion,n);  % "Fused" is the final fused result, and "metri" is the evaluation scores
% imwrite(Fused, strcat('PRO_',num2str(img_name{num}),'.bmp')); 

%% Line diagram of the evaluation metircs
tx=1:1:n;
figure (3), 
plot(tx,metri(:,1)/max(metri(:,1)),'-^',tx,metri(:,2)/max(metri(:,2)),'-o',tx,metri(:,3)/max(metri(:,3)),'-*', tx,metri(:,4)/max(metri(:,4)),'-d',...
tx,metri(:,5)/max(metri(:,5)),'-x',tx,metri(:,6)/max(metri(:,6)),'-rp'),legend ('AVG','MIN','Q^A^B^/^F','VIF','SSIM','PSNR')
axis([-inf inf,-inf,1.05]);

%% Final score of our method
name = {'AVG','MIN','QABF','VIF','SSIM','PSNR'};
T = array2table(metri(n,:),'VariableNames',name)


