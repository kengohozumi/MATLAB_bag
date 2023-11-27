clear all;
close all;
[filename, pathname]=uigetfile('*.bag');
bag = rosbag(filename);
bag;
bag.AvailableTopics;

odom = select(bag,'Topic','/odom');
odom_gps  = select(bag,'Topic','/odom/gps');

msgStructsodom = readMessages(odom,'DataFormat','struct');
msgStructsodom_gps = readMessages(odom_gps,'DataFormat','struct');

msgStructsodom{1}
msgStructsodom_gps{1}

xPoints_odom = cellfun(@(m) m.Pose.Pose.Position.X,msgStructsodom);
yPoints_odom = cellfun(@(m) m.Pose.Pose.Position.Y,msgStructsodom);
xPoints_odom_gps = cellfun(@(m) m.Pose.Pose.Position.X,msgStructsodom_gps);
yPoints_odom_gps = cellfun(@(m) m.Pose.Pose.Position.Y,msgStructsodom_gps);

plot(xPoints_odom,yPoints_odom,'o')
hold on
plot(xPoints_odom_gps,yPoints_odom_gps,'o')

