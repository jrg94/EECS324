function pherValue = diffusionPher(diffusionRate, site, N, NE, E, SE, S, SW, W, NW)
pherValue = (1 - 8*diffusionRate)*site + diffusionRate*(N + NE + E + SE + S + SW + W + NW);