# Inertia-Measurement

Use the python script 'inertia_computation.py'

The extracted data from the simulation is in the 'inertia_sim_data_202505261.tab' file

To get the data from a simulation:

1. Import the command file 'inertia_sim.cmd' or database 'inertia_sim.bin' into Adams
2. Run simulation: select 'Start at equilibrium', suggested Step Size: 1/200
3. Open post-processor, generate the plots by: File -> Import -> Plot Config File ... -> Plot Configuration File 'plots.plt'
4. Export data: File -> Export -> Table:
5. - File Name: Browse to the desired folder and selected a representative name, extension is '.tab'
   - Plot: '.plot_1'
   - Format: 'spreadsheet'

To read the data in the Python script:
1. store the path to the file as a string
2. pass the string to the function 'main'
