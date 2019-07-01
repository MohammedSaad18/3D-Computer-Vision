function [proj_points, t, R] = ar_cube(H,render_points,K)
%% ar_cube
% Estimate your position and orientation with respect to a set of 4 points on the ground
% Inputs:
%    H - the computed homography from the corners in the image
%    render_points - size (N x 3) matrix of world points to project
%    K - size (3 x 3) calibration matrix for the camera
% Outputs: 
%    proj_points - size (N x 2) matrix of the projected points in pixel
%      coordinates
%    t - size (3 x 1) vector of the translation of the transformation
%    R - size (3 x 3) matrix of the rotation of the transformation
% Written by Stephen Phillips for the Coursera Robotics:Perception course

% YOUR CODE HERE: Extract the pose from the homography
h1=H(:,1);
h2=H(:,2);
h3=H(:,3);
h12=cross(h1,h2);

h_ = [h1 h2 h12];
[u, s, v] = svd(h_);
deth = det(u*v');
R=u*[1 0 0;0 1 0;0 0 deth]*v';
t = h3./norm(h1);
% YOUR CODE HERE: Project the points using the pose
proj_points=bsxfun(@plus,render_points * R',t') * K';
proj_points_z=proj_points';
%proj_points(:, 1) = proj_points(:, 1) ./ proj_points(:, 3);
%proj_points(:, 2) = proj_points(:, 2) ./ proj_points(:, 3);
%proj_points = proj_points(:, 1:2);
%proj_points;

%tr=repmat( t, [1,size(render_points,1)] );
%proj_points_z = K*((R*render_points')+tr);
proj_points_z(1,:)=proj_points_z(1,:)./proj_points_z(end,:);
proj_points_z(2,:)=proj_points_z(2,:)./proj_points_z(end,:);

proj_points = proj_points_z(1:2,:);
proj_points=proj_points';
end
