% Problem 5
% The pool of fluid in the body of a patient undergoing dialysis has been 
% modeled by Enderle et al, (2005) as a twocompartment system, as shown 
% diagrammatically in the figure below, where R is the rate of production 
% of urea by the patient's body; V1 is the volume of the intracellular 
% fluid; V2 is the volume of the extracellular fluid (blood and 
% interstitial fluids); C1 and C2 are the concentrations of urea in the 
% fluids of the two compartments, respectively; k12 and k21 are the mass 
% transport parameters between the two compartments; and k2 is the 
% clearance rate constant for the dialysis unit.

dynsim('fluid', 0, 50, [4.8;150], 100, 'BS23', .000001, 0, 1);
