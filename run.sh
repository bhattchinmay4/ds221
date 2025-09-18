#!/bin/bash
#SBATCH --job-name=simple_test            # Job name
#SBATCH --nodes=1                         # Number of nodes (do not change)
#SBATCH --partition=debug                 # Partition or queue name (do not change)
#SBATCH --nodelist=node3                  # Use the node assigned to you (change this if needed)
#SBATCH --ntasks=1                        # Number of tasks per node
#SBATCH --time=00:40:00                   # Maximum runtime (HH:MM:SS)
#SBATCH --output=out_%j.txt               # standard output file
#SBATCH --error=err_%j.txt                # standard error file

# -------------------------

# Your commands to run your code should be here


# make a loop to run main.cpp with n different input and output files

g++ main.cpp -o main 
# ./main "./sample_tests/question1/test_case_1.txt" "output_1.txt"
for i in $(seq 1 $1)
do
  echo "input_$i.txt"
  echo "output_$i.txt"
  ./main "./sample_tests/question1/test_case_$i.txt" "./sample_tests/question1/output_$i.txt"
done

