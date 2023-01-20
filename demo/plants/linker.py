import subprocess as sp
from pathlib import Path

plys = Path("/home/yara/Downloads/phyto_vr/").rglob("*ply")

for i,ply in enumerate(plys):

    sp.run(f"ln -s {ply} plant{i}.ply",shell=True)
