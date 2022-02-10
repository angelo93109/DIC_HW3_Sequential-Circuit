1. Put the files to your accout.
2. You can use the command "./ " to implement the script(01_run_Behavior_sim.sh, 02_run... and 03_run...) we provide to do the behavior simulation, synthsis and gate level simmulation to check your design, respectively.
   (First time, you can use the command  "chmod 744 ??"  to modify the file's Execution authority. ?? --> is the filename, ex: 01_run_Behavior_sim.sh)
3. For the 03_run_gate_sim.sh, you need to modify the path. (I have noted how to modify in the 03_run...)
4. When sythsis, you need to check the timing is (MET) or not.
5. You can change the clock period in the .tcl, after you change clk period in .tcl remeber chcage the clk_period in the Pattern,too.