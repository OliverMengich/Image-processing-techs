

%%
 %image = imread('U2V5YV.jfif');  imshow(image)
 image = imread('U2V5YV.jfif');
 %%
 Im = rgb2hsv(image);
 imshowpair(image,Im,'montage')
 
 %%
  imgray = rgb2gray(Im); imshow(imgray)
lev = graythresh(imgray);
bw = imbinarize(imgray,0.395);

imshow(bw)

imshowpair(image,bw,'montage')

%%
lev1 = multithresh(rgb2gray(Im));
seg_1 = imquantize(Im,lev1);
imshow(seg_1,[]);
%%
thr = multithresh(Im,2


 %%
 channel1Min = 0.179;
 channel1Max = 0.706;
 
 channel2Min = 0.136;
 channel2Max=0.500;
 
 channel3Min = 0.208;
 channel3Max = 0.890;
 
 BW = (Im(:,:,1) >= channel1Min ) & (Im(:,:,1) <= channel1Max) & ...
    (Im(:,:,2) >= channel2Min ) & (Im(:,:,2) <= channel2Max) & ...
    (Im(:,:,3) >= channel3Min ) & (Im(:,:,3) <= channel3Max);

%subplot(1,3,2)
imshowpair(Im,BW,'montage')
%%
diskElem = strel('square',3);
Ibwopen = imopen(BW,diskElem);
%subplot(1,3,3)
imshow(Ibwopen)
 
 %%
 
 image = imread('FGNILS.jpg'); imshow(image)
 
 %%
 Im = rgb2hsv(image);
 imshowpair(image,Im,'montage')
 
 %%
 
 mask = false(size(rgb2gray(qim)));
 mask(50:150,40:170)=true;
 
 visboundaries(mask)
 %%
 bw = activecontour(rgb2gray(qim),mask,200,'edge');
 visboundaries(bw);
 
 %%
 imedge = edge(Imgray,'Roberts');
 imshow(imedge)