# metanet
trafic flow optimalisation assignment


### MetaNEt optimization assignment

##enhance traffic roadcapacity with variable speedlimiet and/or ramp limiting

#trafficmodel:

the road is segmented in length
roadsegments are laned accross
every segment has:
0-1 ramp in
0-1 ramp out
rampout + rampin max 1
1..l lambda lanes in
1..l+-01 lambda lanes out ( fanout of fanin"ritsen" )

#segment statevariables:
density in every lane
speed in every lane
rampqueuelangth

#segment parameters:
speedlimit
ramprate

# segment model relations
@see assignment document
f
g


#simulation
subdivide the roadsimulation in segments

