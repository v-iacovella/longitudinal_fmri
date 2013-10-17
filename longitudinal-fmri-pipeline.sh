#!/usr/bin/python

import os
import glob
import nipype.interfaces.dcm2nii as d2n
import nipype.interfaces.fsl as fsl         # the fsl interfaces
import nipype.pipeline.engine as pe         # the workflow and node wrappers
import nipype.interfaces.dcm2nii as d2nInt
import nipype.algorithms.modelgen as modelgen 
import nipype.interfaces.fsl.model as model
import nipype.interfaces.io as nio


pipe_dir=os.getcwd() + "/pipeline" 
data_dir=os.getcwd() + "/data" 
resu_dir=os.getcwd() + "/results"

print pipe_dir,resu_dir,data_dir

longitudinal_fmri_workflow=pe.Workflow("longitudinal_fmri_workflow")
longitudinal_fmri_workflow.base_dir=resu_dir
fsl.FSLCommand.set_default_output_type('NIFTI_GZ')

data_grabber = pe.Node(nio.DataGrabber(infields=['participants']),outfields=['func_ses1','func_ses2','struct_ses1','struct_ses2'],name="all_data_grabber")
data_grabber.inputs.base_directory=data_dir
data_grabber.inputs.template='*'
data_grabber.inputs.field_template=dict(func_ses1="/sub%s/ses1/p%s.s01.func.nii.gz",func_ses2="/sub%s/ses2/p%s.s02.func.nii.gz",struct_ses1="/sub%s/ses1/anat.nii.gz",struct_ses2="/sub%s/ses2/anat.nii.gz")
data_grabber.inputs.participants=['01','02']





#struct_data_grabber=pe.Node(nio.DataGrabber(infields=['participants']),outfields=['ses1','ses2'])
