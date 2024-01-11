import sys

def openFile(fName):
    with open(fName) as f:
        L = f.readlines()
    return L

def readFirst(line: str):
    spl = line.split(" ")
    for i in spl:
        try:
            return float(i)
        except:
            pass

def list_in_str(l, line):
    if type(l) == str:
        return l in line
    else :
        for i in l:
            if i not in line:
                return False
        return True

def get_times_of_fun(lines, funName):
    filtr = filter(lambda x: list_in_str(funName, x), lines)
    return map(readFirst, filtr)

def print_stat(lines, funName):
    t = sum(get_times_of_fun(lines, funName))
    print(f"{funName} = {t}")

def get_coq_time(line):
    return float(line.split(" ")[3])

def get_coq_total_time(lines):
    filtr = filter(lambda x: ("Finished transaction") in x, lines)
    total_time = sum(filtr)
    return total_time

if __name__ == "__main__":
    lines = openFile(sys.argv[1])
    # print_stat(lines, "resolve_tc")
    # print_stat(lines, "resolve_all_evars")
    # print_stat(lines, "resolve_typeclass_evars")
    print_stat(lines, ["fail", "solve_inst"])
    print_stat(lines, ["success", "solve_inst"])
    print_stat(lines, "Finished")
    # get_coq_time(lines)