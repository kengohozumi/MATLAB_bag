clear all;
close all;
[filename, pathname]=uigetfile('*.bag');
bag = rosbag(filename);
%bag;
%bag.AvailableTopics

fix = select(bag,'Topic','/fix');

msgStructsfix = readMessages(fix,'DataFormat','struct');

xPoints = cellfun(@(m) double(m.Latitude),msgStructsfix);
yPoints = cellfun(@(m) double(m.Longitude),msgStructsfix);
Status = cellfun(@(m) m.Status,msgStructsfix);
Status(1)
p1=geoplot(xPoints,yPoints,'o');
geobasemap topographic
