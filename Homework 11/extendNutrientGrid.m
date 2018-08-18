function [ extendedGrid ] = extendNutrientGrid( mat )
%EXTENDNUTRIENTGRID Adds a boundary around the matrix
% extendNutrientGrid( mat ) Takes mat, an m-by-n matrix parameter and
% return an (m+2) by (n+2) matrix with periodic boundary conditons in the
% north and south directs, a first column of zeros, and a last colum with
% constant value MAXNUTRIENT
global MAXNUTRIENT
extendRows = [mat(end, :, :); mat; mat(1, :, :)];
m = size(mat, 1);
substrate = zeros(m + 2, 1);
constNutrient = MAXNUTRIENT * ones(m + 2, 1);
extendedGrid = [substrate extendRows constNutrient];