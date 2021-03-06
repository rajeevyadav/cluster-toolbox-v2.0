function [transco2basl] = transco2corr(M,type)%[transco2basl] = transCO2corr(M,type)%takes matrix M and corrects for CO2 interference%CO2 bands which are treated are:%2403.21 to 2272.06 (i.e. bins closest to 2400-2275)%682.77 to 655.77 (i.e. bins closest to 680-660)%when:%      type = 1, for 1764 bin data%      type = 2, for 1660 bin data%      type = 3, for 882 bin data%%% Copyright (c) 1997, Royston Goodacre%                modified with the data 2004, Catherine Winder%to work out matrix dimensions[rows,cols]=size(M);  if type == 1 %to set a trend in the two CO2 bands%%for 1764 data    transco2basl1=zeros(rows,69);    for i=1:rows       co2begin1=M(i,830);       co2end1=M(i,898);       slide1 = lintrans(1:69,1,69,co2begin1,co2end1);       transco2basl1(i,:)=slide1;    end    transco2basl2=zeros(rows,15);    for i=1:rows       co2begin2=M(i,1722);       co2end2=M(i,1736);       slide2 = lintrans(1:15,1,15,co2begin2,co2end2);       transco2basl2(i,:)=slide2;    end    for i=1:rows        transco2basl(i,:)=[M(i,1:829)';transco2basl1(i,:)';M(i,899:1721)';...            transco2basl2(i,:)';M(i,1737:1764)']';    end %%%for 1660 bin dataelseif type == 2    transco2basl1=zeros(rows,41);    for i=1:rows       co2begin1=M(i,840);       co2end1=M(i,880);       slide1 = lintrans(1:41,1,41,co2begin1,co2end1);       transco2basl1(i,:)=slide1;    end    transco2basl2=zeros(rows,15);    for i=1:rows       co2begin2=M(i,1620);       co2end2=M(i,1634);       slide2 = lintrans(1:15,1,15,co2begin2,co2end2);       transco2basl2(i,:)=slide2;    end    for i=1:rows        transco2basl(i,:)=[M(i,1:839)';transco2basl1(i,:)';M(i,881:1619)';...            transco2basl2(i,:)';M(i,1635:1660)']';    endelseif type ==3    %to set a trend in the two CO2 bands    transco2basl=zeros(rows,35);    for i=1:rows       co2begin1=M(i,415);       co2end1=M(i,449);       slide1 = lintrans(1:35,1,35,co2begin1,co2end1);       transco2basl(i,:)=slide1;    end    transco2basl2=zeros(rows,8);    for i=1:rows       co2begin2=M(i,861);       co2end2=M(i,868);       slide2 = lintrans(1:8,1,8,co2begin2,co2end2);       transco2basl2(i,:)=slide2;    end    for i=1:rows       co2basl(i,:)=[M(i,1:414)';transco2basl(i,:)';M(i,450:860)';...           transco2basl2(i,:)';M(i,869:882)']';    endelse    error('Unknown data type!')end