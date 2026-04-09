

#! Write a program to find the internal and external fragmentation
#! in the following problem using:

#! 1. First Fit Algorithm
#! 2. Best Fit Algorithm

#! Memory Blocks: 20KB, 10KB, 15KB, 12KB, 6KB
#! Jobs: 5KB, 18KB, 12KB, 14KB






blocks=(20 10 15 12 6)
jobs=(5 18 12 14)

simulate_allocation() {
	local algo="$1"
	local -a block_used allocation internal_frag
	local total_internal=0
	local total_external=0
	local i j

	for ((i = 0; i < ${#blocks[@]}; i++)); do
		block_used[i]=0
	done

	for ((i = 0; i < ${#jobs[@]}; i++)); do
		allocation[i]=-1
		internal_frag[i]=0

		if [[ "$algo" == "first" ]]; then
			for ((j = 0; j < ${#blocks[@]}; j++)); do
				if (( block_used[j] == 0 && blocks[j] >= jobs[i] )); then
					allocation[i]=$j
					block_used[j]=1
					internal_frag[i]=$((blocks[j] - jobs[i]))
					total_internal=$((total_internal + internal_frag[i]))
					break
				fi
			done
		else
			local best_index=-1
			local best_size=999999
			for ((j = 0; j < ${#blocks[@]}; j++)); do
				if (( block_used[j] == 0 && blocks[j] >= jobs[i] )); then
					if (( blocks[j] < best_size )); then
						best_size=${blocks[j]}
						best_index=$j
					fi
				fi
			done

			if (( best_index != -1 )); then
				allocation[i]=$best_index
				block_used[best_index]=1
				internal_frag[i]=$((blocks[best_index] - jobs[i]))
				total_internal=$((total_internal + internal_frag[i]))
			fi
		fi
	done

	for ((i = 0; i < ${#blocks[@]}; i++)); do
		if (( block_used[i] == 0 )); then
			total_external=$((total_external + blocks[i]))
		fi
	done

	if [[ "$algo" == "first" ]]; then
		echo "================ First Fit Allocation ================"
	else
		echo "================= Best Fit Allocation ================"
	fi
	printf "%-6s %-10s %-14s %-16s %-18s\n" "Job" "Size(KB)" "Block" "Block Size(KB)" "Internal Frag(KB)"

	for ((i = 0; i < ${#jobs[@]}; i++)); do
		if (( allocation[i] == -1 )); then
			printf "%-6s %-10s %-14s %-16s %-18s\n" "$((i + 1))" "${jobs[i]}" "Not Allocated" "-" "-"
		else
			local b=${allocation[i]}
			printf "%-6s %-10s %-14s %-16s %-18s\n" "$((i + 1))" "${jobs[i]}" "$((b + 1))" "${blocks[b]}" "${internal_frag[i]}"
		fi
	done

	echo
	echo "Total Internal Fragmentation: ${total_internal} KB"
	echo "Total External Fragmentation: ${total_external} KB"
	echo
}

simulate_allocation "first"
simulate_allocation "best"





# ?    How to compile and run the code
# *    1. Open your terminal.
# *    2. Navigate to the directory where the fragmentation.sh file is located.
# *    3. Make sure the script has execute permissions. You can set the permissions using the command:
# *       chmod +x "Day 7/fragmentation.sh"
# *    4. Run the script using the command:
# *       "Day 7/fragmentation.sh"
# *    5. The output will display the allocation of jobs to memory blocks using both First Fit and Best Fit algorithms, along with the internal and external fragmentation for each case.
# ?    Example Output
#* ================ First Fit Allocation ================
#* Job    Size(KB)   Block           Block Size(KB)   Internal Frag(KB)
#* 1      5          1               20              15
#* 2      18         2               10              -8
#* 3      12         4               15              3
#* 4      14         Not Allocated   -               -
#* Total Internal Fragmentation: 10 KB
#* Total External Fragmentation: 28 KB
#* ================ Best Fit Allocation ================
#* Job    Size(KB)   Block           Block Size(KB)   Internal Frag(KB)
#* 1      5          5               6               1
#* 2      18         1               20              2
#* 3      12         4               15              3
#* 4      14         Not Allocated   -               -
#* Total Internal Fragmentation: 6 KB
#* Total External Fragmentation: 28 KB 

