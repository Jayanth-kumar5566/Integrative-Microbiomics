#!/usr/bin/env python
import pandas, sys

bac=pandas.read_csv("./../Data/bacteria.csv",index_col=0)
fun=pandas.read_csv("./../Data/fungi.csv",index_col=0)
vir=pandas.read_csv("./../Data/virus.csv",index_col=0)
lab=pandas.read_csv(str(sys.argv[1]),index_col=0)

vir=vir.div(vir.sum(axis=1), axis=0)
vir=vir.multiply(100, fill_value=0) #Normalize

x=bac.join(fun,how="inner")
y=x.join(vir,how="inner")

y=y.div(y.sum(axis=1), axis=0) #Renormalize

df=y.join(lab,how="inner")

#Dropping 0 columns
nsel=df.sum(axis=0)
n=nsel[nsel==0].index
df.drop(columns=n,inplace=True)
df=df.transpose()
df.index.name = 'PatientID'
df.to_csv(str(sys.argv[2]),sep='\t')
