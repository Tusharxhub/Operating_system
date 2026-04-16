
#! A cloud data center has free memory partitions of sizes:

#! 100 KB
#! 350 KB
#! 200 KB
#! 450 KB
#! 600 KB

#! Five virtual machine requests arrive sequentially:

#! P1 requires 90 KB
#! P2 requires 180 KB
#! P3 requires 340 KB
#! P4 requires 210 KB
#! P5 requires 400 KB

#! The memory manager allocates each process into the smallest available partition that can accommodate the process in order to minimize wasted memory.



partitions = [100, 350, 200, 450, 600]
processes = {"P1": 90, "P2": 180, "P3": 340, "P4": 210, "P5": 400}

allocated = []
internal = 0

for p, size in processes.items():
    candidates = [i for i, part in enumerate(partitions) if part >= size]
    best = min(candidates, key=partitions.__getitem__) if candidates else -1

    if best != -1:
        waste = partitions[best] - size
        internal += waste
        allocated.append((p, size, partitions[best], waste))
        partitions[best] = -1
    else:
        allocated.append((p, size, "Not Allocated", 0))

print("Strategy Used: Best Fit\n")
print(*allocated, sep="\n")

print("\nInternal Fragmentation =", internal, "KB")

external = sum(x for x in partitions if x != -1)
print("External Fragmentation =", external, "KB")