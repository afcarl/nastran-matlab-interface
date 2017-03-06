function [ output_text ]=deal_e(parameter_text)
% ����������ʵ��bdf�Ķ��������e�Ĵ���������ֲ��FEMtools��bas����
%parameter_text='9.42+2'; %���������

dVal = str2double(expend_dotFormat(parameter_text));
if (length(parameter_text)>10)
    output_text = sprintf('%16.8E', dVal);
    return
end
sVal = sprintf('%12.4E', dVal);
iPos = strfind(sVal, 'E');
iExponent = str2num(sVal(iPos+1:end)); %e����ָ��
dMantissa = str2double(sVal(1:iPos-1)); %eǰ��

if (iExponent < -9)
  if (dMantissa < 0)
     sVal = sprintf('%4.1fE%3.1d', dMantissa, iExponent);
  else
     sVal = sprintf('%4.2fE%3.1d', dMantissa, iExponent);
  end
elseif ((iExponent == -1 ) || (iExponent == -2))
  if (dMantissa < 0)
     sFmt  = sprintf('%%#8.%df', 4-iExponent);
     sTemp = sprintf(sFmt, -dVal);
     sVal =strcat( '-', sTemp(2:end));
  else
     sFmt  = sprintf('%%#9.%df', 5-iExponent);
     sTemp = sprintf(sFmt, -dVal);
     sVal = sTemp(2:end);
  end
  sVal = regexprep(sVal, '0+$', '');  
elseif ((iExponent) < 6 && (iExponent > -1))
  if (dMantissa < 0) 
     sFmt  = sprintf('%%#8.%df', 5-iExponent);
     sVal = sprintf(sFmt, dVal);
  else
     sFmt  = sprintf('%%#8.%df', 6-iExponent);
     sVal = sprintf(sFmt, dVal);
  end
  sVal = regexprep(sVal, '0+$', '');  
elseif (iExponent == 6)
  if (dMantissa < 0)
     sVal = sprintf('%6.3fE%1.1d', dMantissa, iExponent);
  else
     sFmt  = sprintf('%%#8.%df', 6-iExponent);
     sVal = sprintf(sFmt, dVal);
  end
elseif ((iExponent > 6) && (iExponent < 10))
  if (dMantissa < 0)
     sVal = sprintf('%6.3fE%1.1d', dMantissa, iExponent);
  else
     sVal = sprintf('%6.4fE%1.1d', dMantissa, iExponent);
  end
else
  if (dMantissa < 0 )
     sVal = sprintf('%5.2fE%2.1d', dMantissa, iExponent);
  else
     sVal = sprintf('%5.3fE%2.1d', dMantissa, iExponent);
  end
end
iPos = strfind(sVal, '.');
if (~isempty(iPos))                  
  sVal = regexprep(sVal, '0+E', 'E');         
end
sVal = sprintf('%8s', sVal)  ;
output_text=sVal;
return


