function [ output_text ] = expend_dotFormat( parameter_text )
%������������չbdf��ʡ��e���ַ���
%ע�⣬���������ʹ�ַ�������һλ

parameter_text=strtrim(parameter_text);
minus_flag=0;
if (~isnan(str2double(parameter_text)))  %���ڲ���Ҫ�����������ж�
    output_text=parameter_text;
    return
end

if parameter_text(1)=='-'  %���ڸ�������Ĵ���
    minus_flag=1;
    parameter_text=parameter_text(2:end);
end

if (~isempty(strfind(parameter_text,'+')))
    output_text=strcat(parameter_text(1:strfind(parameter_text,'+')-1),'E',parameter_text(strfind(parameter_text,'+'):length(parameter_text)));
elseif (~isempty(strfind(parameter_text,'-')))
    output_text=strcat(parameter_text(1:strfind(parameter_text,'-')-1),'E',parameter_text(strfind(parameter_text,'-'):length(parameter_text)));
else
    output_text=parameter_text;
end

if minus_flag==1
    output_text=strcat('-',output_text);
end

return
