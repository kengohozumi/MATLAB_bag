clear all;
close all;
[filename, pathname]=uigetfile('*.bag');
bag = rosbag(filename);
%bag;
%bag.AvailableTopics

cmd_vel = select(bag,'Topic','/cmd_vel');

msgStructscmd_vel = readMessages(cmd_vel,'DataFormat','struct');
msgStructscmd_vel{1};

xPoints = 1:length(msgStructscmd_vel);
cmd_velLinearXPoints = cellfun(@(m) double(m.Linear.X),msgStructscmd_vel);
cmd_velLinearYPoints = cellfun(@(m) double(m.Linear.Y),msgStructscmd_vel);
cmd_velLinearZPoints = cellfun(@(m) double(m.Linear.Z),msgStructscmd_vel);
cmd_velAngularXPoints = cellfun(@(m) double(m.Angular.X),msgStructscmd_vel);
cmd_velAngularYPoints = cellfun(@(m) double(m.Angular.Y),msgStructscmd_vel);
cmd_velAngularZPoints = cellfun(@(m) double(m.Angular.Z),msgStructscmd_vel);

subplot(3,1,1);plot(xPoints,cmd_velLinearXPoints,'o');
subplot(3,1,2);plot(xPoints,cmd_velLinearYPoints,'o');
subplot(3,1,3);plot(xPoints,cmd_velLinearZPoints,'o');
figure
subplot(3,1,1);plot(xPoints,cmd_velAngularXPoints,'o');
subplot(3,1,2);plot(xPoints,cmd_velAngularYPoints,'o');
subplot(3,1,3);plot(xPoints,cmd_velAngularZPoints,'o');
