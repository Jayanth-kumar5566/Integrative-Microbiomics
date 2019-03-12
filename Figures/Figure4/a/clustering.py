import matplotlib.pyplot as plt
import seaborn as sns
import pandas
import numpy
M=pandas.read_csv("matrix.csv")
lab=pandas.read_csv("labels.csv")
del M["Unnamed: 0"]
M.set_index(lab["Patient_ID"],inplace=True)
M.columns=lab["Patient_ID"]
lab.sort_values('labels',inplace=True)
M=M.reindex(lab['Patient_ID'],axis='index')
M=M.reindex(lab['Patient_ID'],axis='columns')
M=numpy.log(M)
ax=sns.heatmap(M,xticklabels=False,yticklabels=False,cmap=plt.get_cmap("coolwarm"),cbar_kws={'label': "$log(Q_{c})$"})
ax.set_xlabel("")
ax.set_ylabel("")
#plt.show()
plt.savefig("b+f+v.png",dpi=600)

'''
#------------Test--------------
cmaps = ['viridis','BuGn','coolwarm','Greens','seismic']

for i in cmaps:
	plt.clf()
	ax=sns.heatmap(M,xticklabels=False,yticklabels=False,cmap=plt.get_cmap(str(i)),cbar_kws={'label': "$log(Q_{c})$"})
	plt.title(str(i))
	plt.savefig(str(i)+"b+f+v.png",dpi=600)
'''
