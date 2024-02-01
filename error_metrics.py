
#creating variables and opening both data set files 
approx = open("PAM.txt","r")
exact = open("PEM.txt","r")

# making lines of files into arrays with readline cmd
approx_val = approx.readlines()
exact_val = exact.readlines()

#declaring variables for calculating error metrics

MED = 0
MRED = 0
ED_max = 0
ED = 0
ED_mean = 0

for i in range(65536):
    m1 = int(approx_val[i])
    m2 = int(exact_val[i])
    ED = abs(m2-m1)
    if(ED>ED_max):
        ED_max = ED
    if (m2!=0):
        MRED = MRED + (abs(m1-m2)/m2)
    ED_mean = ED_mean + abs(m2-m1)

MRED = MRED/65536
MED = ED_mean/65536
NMED = MED/65536
print("MRED : " + str(MRED))
print("ED_max : " + str(ED_max))
print("MED : " + str(MED))
print("NMED:" +  str(NMED))



