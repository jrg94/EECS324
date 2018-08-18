function [ NutrientGrid ] = initNutrientGrid( m,n )
%INITNUTRIENTGRID Function to return an initialized Nutrient Grid
% initNutrientGrid( m,n ) returns an m-by-n matrix with each element having the value MAXNUTRIENT
global MAXNUTRIENT
NutrientGrid = zeros(m, n) + MAXNUTRIENT;
end