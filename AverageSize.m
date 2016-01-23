clear all;
close all;
clc;

path = '.\Car Side View Database\';
pt = dir(path);

PicNum = 0;
for i = 1 : length(pt)
    if strcmp(pt(i).name, '.') || strcmp(pt(i).name, '..')
        continue;
    else
        PicNum = PicNum + 1;
    end
end

PicName = cell(PicNum,1);
for i = 1 : length(pt)
    if strcmp(pt(i).name,'.') || strcmp(pt(i).name,'..')
        continue;
    else
        PicName{i-2} = pt(i).name;
    end
end

Size = zeros(PicNum,3);
for i = 1 : length(PicName)
    temp = strcat(path,PicName{i});
    Size(i,:) = size(imread(temp));
end

averageWidth = sum(Size(:,2)) / PicNum;
averageHeight = sum(Size(:,1)) / PicNum;

