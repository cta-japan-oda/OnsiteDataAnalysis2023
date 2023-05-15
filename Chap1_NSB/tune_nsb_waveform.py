from lstchain.version import __version__
from lstchain.io import standard_config
from lstchain.image.modifier import calculate_required_additional_nsb

print(lstchain version: , __version__)

# Input MC file. MC file should be simtel files!
input_filename = "/fefs/aswg/data/mc/DL0/LSTProd2/TrainingDataset/Protons/dec_2276/sim_telarray/node_theta_44.927_az_85.716_/output_v1.4/simtel_corsika_theta_44.927_az_85.716_run1.simtel.gz"

# Real DL1 file. This file has the "target" NSB which we want to have in the MC files
target_data = "/fefs/aswg/data/real/DL1/20221018/v0.9/tailcut84/dl1_LST-1.Run09686.0000.h5"


nsb_tuning_ratio = calculate_required_additional_nsb(input_filename,
                                                     target_data,
                                                     config=standard_config)

print("correction ratio, data_ped_variance, mc_ped_variance = ", nsb_tuning_ratio)
