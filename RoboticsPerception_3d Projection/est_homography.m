function [ H ] = est_homography(video_pts, logo_pts)
% est_homography estimates the homography to transform each of the
% video_pts into the logo_pts
% Inputs:
%     video_pts: a 4x2 matrix of corner points in the video
%     logo_pts: a 4x2 matrix of logo points that correspond to video_pts
% Outputs:
%     H: a 3x3 homography matrix such that logo_pts ~ H*video_pts
% Written for the University of Pennsylvania's Robotics:Perception course

% YOUR CODE HERE

A = zeros(8,9);
for i=1:4,
    x=video_pts(i,1);
    y=video_pts(i,2);
    x_=logo_pts(i,1);
    y_=logo_pts(i,2);
       
    A(2*i-1,:)=[x y 1 0 0 0 -x*x_ -y*x_ -x_];
    A(2*i,:)  =[0 0 0 x y 1 -x*y_ -y*y_ -y_];     
end
[U, S, V] = svd(A);
h=V(:,9);

H=[h(1),h(2),h(3);h(4),h(5),h(6);h(7),h(8),h(9);];
if h(9)<0,
    H=H.*-1;
end
%H=reshape(h,[3,3]);

end

