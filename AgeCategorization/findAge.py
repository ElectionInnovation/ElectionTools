import csv
import datetime
import sys,quickArg

def ageCategorize(inputfile, outputfile, eyear, emonth, eday, column):
    with open(outputfile, "w") as csvfile_2:
        writer = csv.writer(csvfile_2, delimiter=',', lineterminator='\n')
        with open(inputfile, "rt") as csvfile:
            voterfile = csv.reader(csvfile)
            voterout = []
            count = 1
            for row in voterfile:
                if (count == 0):
                # this assumes a format of 'year-month-day' like '1948-03-21' but can be changed
                # years are also a calculation of 365.25 for this analysis
                    date = row[column]
                    year = date[0:4]
                    month = date[5:7]
                    day = date[8:10]
                    age = datetime.datetime(eyear,emonth, eday)-datetime.datetime(int(year), int(month), int(day))
                    ageYears = age.days/365.25
                    row.append(ageYears)
                    writer.writerow(row)
                    print("%s" % ageYears)
                else:
                    count = 0
                    row.append("Age")
                    writer.writerow(row)
            csvfile.close()
        csvfile_2.close()
    print("Finished")
    print("Input file is " + inputfile)
    print("Output file is " + outputfile)


if __name__ == "__main__":
    newargs = quickArg.quickArg(sys.argv[1:])
    inputfile = newargs[0]
    outputfile = newargs[1]
    eyear = int(newargs[2])
    emonth = int(newargs[3])
    eday = int(newargs[4])
    column = int(newargs[5])
    ageCategorize(inputfile, outputfile, eyear, emonth, eday, column)
