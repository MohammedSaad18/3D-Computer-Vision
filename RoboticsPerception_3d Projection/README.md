# 3D projetion of Objects using Homography
- in this task i was asked to implement the functions to project any 3d object into videos by estimating the camera pose using homography (Robotics Perception course)
- i was asked to project a cube, but since i am an  Egyptian , i had another openion
- ![pyramid](https://media.giphy.com/media/Mcy49tq2z495a7kt9A/giphy.gif)

## The process
- track the interest points in each frame where i will land the 3d opject on them
- estimating the Homograpghy matrix between a plan in the real world and the image projection of it
- using the homograpghy matrix to estimate the pose of the camera in each framke
- project a virtual 3d opject into the image plane using the the matrix x(image) = K(R*X+T)  // X stands for real world coordinates where K is the camera calibration matrix, R and T are the rotation and translation matrix respectively
