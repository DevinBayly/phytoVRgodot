from pathlib import Path
import subprocess as sp

plys = sorted((Path.home()/"Downloads/phyto_vr/sorghum").rglob("*ply"))
for i,ply in enumerate(plys):
    sp.run(f"ln -s {ply} plant{i}.ply",shell=True)
