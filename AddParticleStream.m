function [ output_args ] = AddParticleStream(num, x0, y0, PartAng, Type, Ep, Seper, updown)
global AtomSpacing x y AtomType Vx Vy Mass0 Mass1 nAtoms

if Type == 0
    Mass = Mass0;
else
    Mass = Mass1;
end

for p = 0:num - 1
    nAtoms = nAtoms + 1;
    x(nAtoms) = x0 * AtomSpacing - Seper * p * AtomSpacing * cos(PartAng);
    y(nAtoms) = y0 * AtomSpacing - Seper * p * AtomSpacing * sin(PartAng);
    AtomType(nAtoms) = Type;
end

V = sqrt(2 * Ep / Mass);

%Modification: added the "forward" parameter to the addparticlestream
%function to allow particle streams to move either up or down

for p = 1:num
        Vx(nAtoms - num + p) = V * cos(PartAng);
    if updown == 1
        Vy(nAtoms - num + p) = V * sin(PartAng);
    else
        Vy(nAtoms - num + p) = -V * sin(PartAng);
    end

end

end
