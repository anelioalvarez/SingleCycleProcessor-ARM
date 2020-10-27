# encoding: utf-8
from re import findall
import sys

SPACES = "    " # equals 1 tab


def main():
    try:
        assembly_code = open("main.list", "r").read()
    except:
        print("Error: file 'main.list' does not exist!")
        sys.exit(1)
    
    pattern = "[0-9a-f]:\t[0-9a-f]{8}"
    matchs = findall(pattern, assembly_code)

    ROM = []
    for instr in matchs:
        ROM.append(instr.split("\t")[1])
    
    # print ROM with the format used
    print("ROM [0:%s] = '{" %(len(ROM) - 1))
    print(",\n".join(SPACES + "32'h" + instr for instr in ROM))
    print("};")


if __name__ == "__main__":
    main()