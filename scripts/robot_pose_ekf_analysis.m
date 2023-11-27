clear all;
close all;
[filename, pathname]=uigetfile('*.bag');
bag = rosbag(filename);
bag;
bag.AvailableTopics;
bag.MessageList;

robotekf = select(bag,'Topic','/combine_dr_measurements/odom_combined');

msgStructsrobotekf = readMessages(robotekf,'DataFormat','struct');

msgStructsrobotekf{1}
ekf_posex = cellfun(@(m) m.Pose.Pose.Position.X,msgStructsrobotekf);
ekf_posey = cellfun(@(m) m.Pose.Pose.Position.Y,msgStructsrobotekf);

plot(ekf_posex,ekf_posey,'o',color="blue")
