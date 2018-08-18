function f = dilantin(t, Q, dosage, half_life) % Computing the slope from the model
elimination_constant=-log(0.5)/half_life;
f=0.12*dosage*pulse(t)-elimination_constant*Q;

    function f = pulse(t) % Generating a unit pulse train
    if mod(t,8)==0
    f = 1;
    else
    f = 0;
    end