function [thetaFunc,velFunc,accFunc] = pathCalc(theta, time, vel, acc)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    syms t;
    
    if ~exist('vel','var')
     % third parameter does not exist, so default it to something
      vel(1) = 0;
      vel(2) = 0;
    end

    if ~exist('acc','var')
     % third parameter does not exist, so default it to something
      acc(1) = 0;
      acc(2) = 0;
    end

    c=[theta(1) vel(1) acc(1) theta(2) vel(2) acc(2)]';
    b = [1 time(1) time(1)^2 time(1)^3 time(1)^4 time(1)^5; 0 1 2*time(1) 3*time(1)^2 4*time(1)^3 5*time(1)^4; 0 0 2 6*time(1) 12*time(1)^2 20*time(1)^3; 1 time(2) time(2)^2 time(2)^3 time(2)^4 time(2)^5; 0 1 2*time(2) 3*time(2)^2 4*time(2)^3 5*time(2)^4; 0 0 2 6*time(2) 12*time(2)^2 20*time(2)^3];
    
    %a=inv(b)*c;
    a = b\c;
    
    thetaFunc = a(1) + a(2)*t + a(3)*t^2 + a(4)*t^3 + a(5)*t^4 + a(6)*t^5;
    velFunc = a(2) + 2*a(3)*t + 3*a(4)*t^2 + 4*a(5)*t^3 + 5*a(6)*t^4;
    accFunc = 2*a(3) + 6*a(4)*t + 12*a(5)*t^2 + 20*a(6)*t^3;

end
