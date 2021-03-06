import sil
import pandas
for nam in ["b+f","b+v","f+v"]:
	file=open(str(nam)+"_k_sil.csv","w")
	file.write("K_value,Avg_silhouette,Sil_cluster1,Sil_cluster2,Sil_cluster3,Sil_cluster4,Sil_cluster5\n")
	for i in range(1,217):
		P_m=pandas.read_csv(str(nam)+"/matrix"+str(i)+".csv")
		P_m=P_m.values[:,1:]
		lab=pandas.read_csv(str(nam)+"/labels"+str(i)+".csv")
		lab=lab['x'].values
		s=sil.silhouette_score(P_m,lab)
		file.write(str(i)+","+str(s)[1:-1]+"\n")
	file.close()

print "Done"
'''
df=pandas.read_csv("k_sil.csv",index_col=0)
print "Tuned value of k is"
print df.idxmax(axis=0)
'''
