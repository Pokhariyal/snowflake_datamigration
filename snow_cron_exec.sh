#!/bin/bash
#* * * * * cd /home/dhruvpokhariyal1997etl;bash cron_exec.sh
source /home/dhruvpokhariyal1997/anaconda3/etc/profile.d/conda.sh
conda activate etl
/home/dhruvpokhariyal1997/anaconda3/envs/etl/bin/python snow_daily_update_script.py >> /home/dhruvpokhariyal1997/etl/log.txt 2>&1