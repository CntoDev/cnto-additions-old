/*
 * disable Attenuation as it is bugged for light sources since Arma 3 lighting
 * update - it displays very differently on the client owning the light
 * compared to other clients
 */
dayLight = 1;
intensity = 1000;
innerAngle = 1;
outerAngle = 90;
coneFadeCoef = 12;
flareMaxDistance = 200;
class Attenuation {
    start = 0;
    constant = 0;
    linear = 0;
    quadratic = 0;
    hardLimitStart = 1;
    hardLimitEnd = 300;
};
