function metrix_value = fusion_metrix(A,B,F,name)
%%%  NOTES:     
%%%
%%%             algorithm                       indicator string 
%%%             ---------------------------     ---------------- 
%%%             shannon entropy                 'SEN'            
%%%             mean vaue                       'ME'          
%%%             average gradient                'AVG'
%%%             standard deviation              'STD'
%%%
%%%             mean-squared error              'MSE'            
%%%             peak signal-to-noise ratio      'PSNR'          
%%%             structural similarity index     'SSIM'           
%%%             visual information fidelity     'VIF'            
%%%             pixel-based VIF                 'VIFP'           
%%%             universal quality index         'UQI'            
%%%             image fidelity criterion        'IFC'           
%%%             noise quality measure           'NQM'            
%%%             weighted signal-to-noise ratio  'WSNR'           
%%%             signal-to-noise ratio           'SNR'
%%%             cross entropy                   'CEN'
%%%             mutual inforamtion              'MIN'
%%%             Q0 index                        'Q0I'
%%%             Qabf index                      'QABF'
%%%             QY index                      '  QY'
%%%             QCB index                      '  QCB'
metrix_name = lower(name);
reference_imageA = double(A);
reference_imageB = double(B);
distorted_image = double(F);
switch metrix_name
    case 'sen'
        metrix_value = one_image_metrix(distorted_image,metrix_name);
    case 'me'
        metrix_value = one_image_metrix(distorted_image,metrix_name); 
    case 'avg'
        metrix_value = one_image_metrix(distorted_image,metrix_name);    
    case 'std'
        metrix_value = one_image_metrix(distorted_image,metrix_name);    
 %----------------------------------------------------------------------       
    case 'mse'
        metrix_value_AF = two_image_metrix(reference_imageA,distorted_image,metrix_name);
        metrix_value_BF = two_image_metrix(reference_imageB,distorted_image,metrix_name);
        metrix_value = (metrix_value_AF + metrix_value_BF)/2;
    case 'psnr'
        metrix_value_AF = two_image_metrix(reference_imageA,distorted_image,metrix_name);
        metrix_value_BF = two_image_metrix(reference_imageB,distorted_image,metrix_name);
        metrix_value = (metrix_value_AF + metrix_value_BF)/2;
    case 'ssim'
        metrix_value_AF = two_image_metrix(reference_imageA,distorted_image,metrix_name);
        metrix_value_BF = two_image_metrix(reference_imageB,distorted_image,metrix_name);
        metrix_value = (metrix_value_AF + metrix_value_BF)/2;
    case 'vif'
        metrix_value_AF = two_image_metrix(reference_imageA,distorted_image,metrix_name);
        metrix_value_BF = two_image_metrix(reference_imageB,distorted_image,metrix_name);
        metrix_value = (metrix_value_AF + metrix_value_BF)/2;
    case 'vifp'
        metrix_value_AF = two_image_metrix(reference_imageA,distorted_image,metrix_name);
        metrix_value_BF = two_image_metrix(reference_imageB,distorted_image,metrix_name);
        metrix_value = (metrix_value_AF + metrix_value_BF)/2;
    case 'uqi'
        metrix_value_AF = two_image_metrix(reference_imageA,distorted_image,metrix_name);
        metrix_value_BF = two_image_metrix(reference_imageB,distorted_image,metrix_name);
        metrix_value = (metrix_value_AF + metrix_value_BF)/2;
    case 'ifc'
        metrix_value_AF = two_image_metrix(reference_imageA,distorted_image,metrix_name);
        metrix_value_BF = two_image_metrix(reference_imageB,distorted_image,metrix_name);
        metrix_value = (metrix_value_AF + metrix_value_BF)/2;
    case 'nqm'
        metrix_value_AF = two_image_metrix(reference_imageA,distorted_image,metrix_name);
        metrix_value_BF = two_image_metrix(reference_imageB,distorted_image,metrix_name);
        metrix_value = (metrix_value_AF + metrix_value_BF)/2;
    case 'wsnr'
        metrix_value_AF = two_image_metrix(reference_imageA,distorted_image,metrix_name);
        metrix_value_BF = two_image_metrix(reference_imageB,distorted_image,metrix_name);
        metrix_value = (metrix_value_AF + metrix_value_BF)/2;
    case 'snr'
        metrix_value_AF = two_image_metrix(reference_imageA,distorted_image,metrix_name);
        metrix_value_BF = two_image_metrix(reference_imageB,distorted_image,metrix_name);
        metrix_value = (metrix_value_AF + metrix_value_BF)/2;
    case 'cen'
        metrix_value_AF = two_image_metrix(reference_imageA,distorted_image,metrix_name);
        metrix_value_BF = two_image_metrix(reference_imageB,distorted_image,metrix_name);
        metrix_value = (metrix_value_AF + metrix_value_BF)/2;
    case 'min'
        metrix_value_AF = two_image_metrix(reference_imageA,distorted_image,metrix_name);
        metrix_value_BF = two_image_metrix(reference_imageB,distorted_image,metrix_name);
        metrix_value = (metrix_value_AF + metrix_value_BF);
    case 'q0i'
        metrix_value_AF = two_image_metrix(reference_imageA,distorted_image,metrix_name);
        metrix_value_BF = two_image_metrix(reference_imageB,distorted_image,metrix_name);
        metrix_value = (metrix_value_AF + metrix_value_BF)/2;
    case 'qabf'
        metrix_value = Qabf(reference_imageA,reference_imageB,distorted_image);
    case 'qy'
        metrix_value = QY(reference_imageA,reference_imageB,distorted_image);
    case 'nmi'
        metrix_value = NMI(reference_imageA,reference_imageB,distorted_image);    
    case 'qcb'
        metrix_value = QCB(reference_imageA,reference_imageB,distorted_image);    
    otherwise
        metrix_value = NaN;
end