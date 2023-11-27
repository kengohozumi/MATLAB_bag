clear all;
close all;
[filename, pathname]=uigetfile('*.bag');
bag = rosbag(filename);
%bag;
%bag.AvailableTopics

imu = select(bag,'Topic','/imu');
movebase = select(bag,'Topic','/movingbase_yaw');

msgStructsimu = readMessages(imu,'DataFormat','struct');
msgStructsmovingbase = readMessages(movebase,'DataFormat','struct');

xPointsmb = 1:length(msgStructsmovingbase);
xmb = cellfun(@(m) m.Header.Stamp.Sec,msgStructsmovingbase);%xPointsmb.Seq
yPointsmb_Orientation_x = cellfun(@(m) double(m.Orientation.X),msgStructsmovingbase);
yPointsmb_Orientation_y = cellfun(@(m) double(m.Orientation.Y),msgStructsmovingbase);
yPointsmb_Orientation_z = cellfun(@(m) double(m.Orientation.Z),msgStructsmovingbase);
yPointsmb_Orientation_w = cellfun(@(m) double(m.Orientation.W),msgStructsmovingbase);
yPointsmb_Angular_x = cellfun(@(m) double(m.AngularVelocity.X),msgStructsmovingbase);
yPointsmb_Angular_y = cellfun(@(m) double(m.AngularVelocity.Y),msgStructsmovingbase);
yPointsmb_Angular_z = cellfun(@(m) double(m.AngularVelocity.Z),msgStructsmovingbase);

xPointsimu = 1:length(msgStructsimu);
ximu = cellfun(@(m) m.Header.Stamp.Sec,msgStructsimu);%xPointsimu.Seq
yPointsimu_Orientation_x = cellfun(@(m) double(m.Orientation.X),msgStructsimu);
yPointsimu_Orientation_y = cellfun(@(m) double(m.Orientation.Y),msgStructsimu);
yPointsimu_Orientation_z = cellfun(@(m) double(m.Orientation.Z),msgStructsimu);
yPointsimu_Orientation_w = cellfun(@(m) double(m.Orientation.W),msgStructsimu);
yPointsimu_Angular_x = cellfun(@(m) double(m.AngularVelocity.X),msgStructsimu);
yPointsimu_Angular_y = cellfun(@(m) double(m.AngularVelocity.Y),msgStructsimu);
yPointsimu_Angular_z = cellfun(@(m) double(m.AngularVelocity.Z),msgStructsimu);

subplot(4,1,1);plot(ximu,yPointsimu_Orientation_z,'o');
subplot(4,1,2);plot(xmb,yPointsmb_Orientation_z,'o');
subplot(4,1,3);plot(ximu,yPointsimu_Orientation_w,'o');
subplot(4,1,4);plot(xmb,yPointsmb_Orientation_w,'o');

