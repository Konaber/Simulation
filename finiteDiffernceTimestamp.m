function [] = finiteDiffernceTimestamp(diffusionConstant, timeSteps, gridConstant, timeStamps)
    m = [1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
    0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
    0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
    0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
    0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
    0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
    0 1 0 0 0 1 -4 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0;
    0 0 1 0 0 0 1 -4 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0;
    0 0 0 1 0 0 0 1 -4 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 1 0 0 0 1 -4 1 0 0 0 1 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 -4 1 0 0 0 1 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 -1 0 0 0 0 4 0 0 0 0 -3 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1];
    n = [0;0;0;0;0;0;1;1;1;0;0;1;0;0;0;0;1;0;0;0;0;1;0;0;0];
    deltaT = timeSteps;
    k = diffusionConstant;
    a = gridConstant;
    T = timeStamps;
    concentration = nan(T,1);
    startsum = 0;
    for h=1:1:25
        startsum = startsum + n(h,1);
    end
    concentration(1,1) = startsum;
    for i=2:1:T + 2
        n2 = n + deltaT * k * (1/a) * m * n;
        sum = 0;
        for j=1:1:25
            sum = sum + n2(j,1);
        end
        concentration(i,1) = sum;
        n = n2;
    end
    plot([0:1:T+1],concentration)
    title(['Diffusion of [parts] with Diffusionconstant D = ', num2str(diffusionConstant)])
    xlabel('Time [timeStamps/timeSteps]')
    ylabel('Concentration [parts]')
end