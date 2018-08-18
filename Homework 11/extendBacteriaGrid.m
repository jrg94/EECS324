function [ extendedGrid ] = extendBacteriaGrid(mat )
%EXTENDBACTERIAGRID Adds a boundary around the matrix
% extendBacteriaGrid( mat ) Takes mat, an m-by-n matrix parameter and
% return an (m+2) by (n+2) matrix with periodic boundary conditions in the
% north and south directions, with first and last columns of fixed value
% BORDER.
global BORDER
extendedGrid = mat;
m = size(mat,1);
matNS =[mat(end, :, :); mat; mat(1, :, :)];
border = BORDER * ones(m + 2, 1);
extendedGrid = [border matNS border];