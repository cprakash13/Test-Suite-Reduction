data_file=open("data.txt","r")
coverage_file=open("max_cov.txt","w")
data=[]
for line in data_file:
    x = line.split()
    y=x[3].split(":")
    coverage=float(y[1][slice(-1)])
    data.append(coverage)
data_file.close()

max_index=-1
cnt=-1
max_cov=-1
for coverage in data:
	cnt=cnt+1
	if coverage > max_cov:
		max_index=cnt
		max_cov=coverage
coverage_file.write(str(max_cov))

input_file=open(r"test/T.in","r")
lines=input_file.readlines()
input_file.close()
removed=lines.pop(max_index)

output_file=open(r"test/S.in","a")
output_file.write(removed)
input_file=open(r"test/T.in","w")
input_file.writelines(lines)
output_file.close()
input_file.close()
