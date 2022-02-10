wvResizeWindow -win $_nWave1 0 29 1920 1001
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/disk2/others/dsd_310591036/DIC_hw/Ex3/no_pipeline/Convolution.fsdb}
wvSelectGroup -win $_nWave1 {G1}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/TESTBED"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/u_Convolution_example"
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/u_Convolution_example/Out_OFM\[20:0\]} \
{/TESTBED/u_Convolution_example/clk} \
{/TESTBED/u_Convolution_example/cstate\[1:0\]} \
{/TESTBED/u_Convolution_example/in_valid} \
{/TESTBED/u_Convolution_example/nstate\[1:0\]} \
{/TESTBED/u_Convolution_example/out_valid} \
{/TESTBED/u_Convolution_example/rst_n} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSelectGroup -win $_nWave1 {G2}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/TESTBED/u_PATTERN_example"
wvSetPosition -win $_nWave1 {("G1" 25)}
wvSetPosition -win $_nWave1 {("G1" 25)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/u_Convolution_example/Out_OFM\[20:0\]} \
{/TESTBED/u_Convolution_example/clk} \
{/TESTBED/u_Convolution_example/cstate\[1:0\]} \
{/TESTBED/u_Convolution_example/in_valid} \
{/TESTBED/u_Convolution_example/nstate\[1:0\]} \
{/TESTBED/u_Convolution_example/out_valid} \
{/TESTBED/u_Convolution_example/rst_n} \
{/TESTBED/u_PATTERN_example/Pattern_In_IFM_1\[7:0\]} \
{/TESTBED/u_PATTERN_example/Pattern_In_IFM_2\[7:0\]} \
{/TESTBED/u_PATTERN_example/Pattern_In_IFM_3\[7:0\]} \
{/TESTBED/u_PATTERN_example/Pattern_In_IFM_4\[7:0\]} \
{/TESTBED/u_PATTERN_example/Pattern_In_IFM_5\[7:0\]} \
{/TESTBED/u_PATTERN_example/Pattern_In_IFM_6\[7:0\]} \
{/TESTBED/u_PATTERN_example/Pattern_In_IFM_7\[7:0\]} \
{/TESTBED/u_PATTERN_example/Pattern_In_IFM_8\[7:0\]} \
{/TESTBED/u_PATTERN_example/Pattern_In_IFM_9\[7:0\]} \
{/TESTBED/u_PATTERN_example/Pattern_In_Weight_1\[7:0\]} \
{/TESTBED/u_PATTERN_example/Pattern_In_Weight_2\[7:0\]} \
{/TESTBED/u_PATTERN_example/Pattern_In_Weight_3\[7:0\]} \
{/TESTBED/u_PATTERN_example/Pattern_In_Weight_4\[7:0\]} \
{/TESTBED/u_PATTERN_example/Pattern_In_Weight_5\[7:0\]} \
{/TESTBED/u_PATTERN_example/Pattern_In_Weight_6\[7:0\]} \
{/TESTBED/u_PATTERN_example/Pattern_In_Weight_7\[7:0\]} \
{/TESTBED/u_PATTERN_example/Pattern_In_Weight_8\[7:0\]} \
{/TESTBED/u_PATTERN_example/Pattern_In_Weight_9\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvCollapseGroup -win $_nWave1 "G2"
wvSelectSignal -win $_nWave1 {( "G1" 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 \
           23 24 25 )} 
wvSetPosition -win $_nWave1 {("G1" 25)}
wvSetPosition -win $_nWave1 {("G1" 25)}
wvSetPosition -win $_nWave1 {("G1" 25)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/u_Convolution_example/Out_OFM\[20:0\]} \
{/TESTBED/u_Convolution_example/clk} \
{/TESTBED/u_Convolution_example/cstate\[1:0\]} \
{/TESTBED/u_Convolution_example/in_valid} \
{/TESTBED/u_Convolution_example/nstate\[1:0\]} \
{/TESTBED/u_Convolution_example/out_valid} \
{/TESTBED/u_Convolution_example/rst_n} \
{/TESTBED/u_PATTERN_example/Pattern_In_IFM_1\[7:0\]} \
{/TESTBED/u_PATTERN_example/Pattern_In_IFM_2\[7:0\]} \
{/TESTBED/u_PATTERN_example/Pattern_In_IFM_3\[7:0\]} \
{/TESTBED/u_PATTERN_example/Pattern_In_IFM_4\[7:0\]} \
{/TESTBED/u_PATTERN_example/Pattern_In_IFM_5\[7:0\]} \
{/TESTBED/u_PATTERN_example/Pattern_In_IFM_6\[7:0\]} \
{/TESTBED/u_PATTERN_example/Pattern_In_IFM_7\[7:0\]} \
{/TESTBED/u_PATTERN_example/Pattern_In_IFM_8\[7:0\]} \
{/TESTBED/u_PATTERN_example/Pattern_In_IFM_9\[7:0\]} \
{/TESTBED/u_PATTERN_example/Pattern_In_Weight_1\[7:0\]} \
{/TESTBED/u_PATTERN_example/Pattern_In_Weight_2\[7:0\]} \
{/TESTBED/u_PATTERN_example/Pattern_In_Weight_3\[7:0\]} \
{/TESTBED/u_PATTERN_example/Pattern_In_Weight_4\[7:0\]} \
{/TESTBED/u_PATTERN_example/Pattern_In_Weight_5\[7:0\]} \
{/TESTBED/u_PATTERN_example/Pattern_In_Weight_6\[7:0\]} \
{/TESTBED/u_PATTERN_example/Pattern_In_Weight_7\[7:0\]} \
{/TESTBED/u_PATTERN_example/Pattern_In_Weight_8\[7:0\]} \
{/TESTBED/u_PATTERN_example/Pattern_In_Weight_9\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvCollapseGroup -win $_nWave1 "G2"
wvSelectSignal -win $_nWave1 {( "G1" 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 \
           23 24 25 )} 
wvSetPosition -win $_nWave1 {("G1" 25)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 21 22 23 24 25 )} 
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 21 22 23 24 25 )} 
wvSetRadix -win $_nWave1 -format UDec
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSelectGroup -win $_nWave1 {G1}
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvExit
