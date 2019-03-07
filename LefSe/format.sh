#!/usr/bin/env python
import pandas, sys

bac=pandas.read_csv("./../Data/bacteria.csv",index_col=0)
fun=pandas.read_csv("./../Data/fungi.csv",index_col=0)
vir=pandas.read_csv("./../Data/virus.csv",index_col=0)
lab=pandas.read_csv(str(sys.argv[1]),index_col=0)

vir=vir.div(vir.sum(axis=1), axis=0)
vir=vir.multiply(100, fill_value=0) #Normalize

if sys.argv[3] == "b+f":
	x=bac.join(fun,how="inner")
	y=x.div(x.sum(axis=1), axis=0)
elif sys.argv[3] == "b+v":
	x=bac.join(vir,how="inner")
elif sys.argv[3] == "f+v":
	x=fun.join(vir,how="inner")
	y=x.div(x.sum(axis=1), axis=0)
elif sys.argv[3] == "b+f+v":
	x=bac.join(fun,how="inner")
	y=x.join(vir,how="inner")
	y=y.div(y.sum(axis=1), axis=0) #Renormalize
elif sys.argv[3]=="b":
	y=bac.div(bac.sum(axis=1), axis=0)
elif sys.argv[3]=="f":
	y=fun.div(fun.sum(axis=1), axis=0)
elif sys.argv[3]=="v":
	y=vir.div(vir.sum(axis=1), axis=0)
else:
	sys.exit()

df=y.join(lab,how="inner")

#Dropping 0 columns
nsel=df.sum(axis=0)
n=nsel[nsel==0].index
df.drop(columns=n,inplace=True)
df=df.transpose()
df.index.name = 'PatientID'
df.to_csv(str(sys.argv[2]),sep='\t')
