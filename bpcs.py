#!/usr/bin/python

# Between participants correlation score
# It requires a list of datasets (in PYMVPA style):
# ds_all
# it produces a new feature attribute called
# bpcs
# and filled according to bpcs computed according to
# Haxby 2011 definition

for p in np.arange(len(ds_all)):
	curr_p=ds_all[p].samples.T
	curr_list=np.zeros((curr_p.shape[0],len(ds_all)-1))
	the_idxs=np.delete(np.arange(len(ds_all)),p)
	for r in the_idxs:
		curr_r=ds_all[r].samples.T
		curr_list[:,r]=np.max(np.corrcoef(curr_p,curr_r)[:curr_p.shape[0],curr_p.shape[0]:],1)
	ds_all[p].fa['bpcs']=np.sum(curr_list,1)
