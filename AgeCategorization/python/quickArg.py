# Generic Python Argument input/output
import sys
import getopt

def quickArg(argv):
    inputfile = ""
    outputfile = ""
    try:
        opts, args = getopt.getopt(argv,"hi:o:d:m:y:c:",["ifile=","ofile="])
    except getopt.GetoptError:
        print(sys.argv[0] + " -i <inputfile> -o <outputfile> -d <day> -m <month> -y <year> -c <column>")
        print(sys.argv[0] + " -i <inputfile> -o <outputfile>")
        print("Not all Variables Defined(below are list of variables that need definition)")
        print("-i\tinput file")
        print("-o\toutput file")
        print("-d\tday of election")
        print("-m\tmonth of election")
        print("-y\tyear of election")
        print("-c\tcolumn where date of births are specified in 'year-month-day' order ")
        sys.exit(2)
    for opt, arg in opts:
        if opt == '-h':
            print(sys.argv[0] + " -i <inputfile> -o <outputfile>")
            print("Not all Variables Defined(below are list of variables that need definition)")
            print("-i\tinput file")
            print("-o\toutput file")
            print("-d\tday of election")
            print("-m\tmonth of election")
            print("-y\tyear of election")
            print("-c\tcolumn where date of births are specified in 'year-month-day' order ")
            sys.exit()
        elif opt in ("-i", "--ifile"):
            inputfile = arg
        elif opt in ("-o", "--ofile"):
            outputfile = arg
        #additional arguments specified here
        elif opt in ("-d", "--day"):
            eday = arg
        elif opt in ("-y", "--year"):
            eyear = arg
        elif opt in ("-m", "--month"):
            emonth = arg
        elif opt in ("-c", "--column"):
            column = arg
    return [inputfile, outputfile, eyear, emonth, eday, column]

if __name__ == "__main__":
    quickArg(sys.argv[1:])
